-- Slayout is a layout that slays.
-- I DON'T KNOW WHY I PICKED THIS STUPID NAME, BUT I DID, OKAY!
---@class Slayout: Layout
---@field private egg? layout_egg
---@field private windows integer[]
---@field private is_opened boolean
local Slayout = {}

---Create a default layout.
---@return Slayout
function Slayout:new()
  ---@type Slayout
  local o = {
    egg = nil,
    is_opened = false,
    windows = {},
    popup_windows = {},
  }
  setmetatable(o, self)
  self.__index = self
  return o
end

---Close dbee when another (inapropriate) buffer is open in the window.
---@package
---@param winid integer
---@param is_editor? boolean special care needs to be taken with editor - it uses multiple buffers.
function Slayout:configure_window_close_on_switch(winid, is_editor)
  local api_ui = require("dbee").api.ui
  local utils = require("dbee.utils")

  local action = function(_, buf, file)
    if is_editor then
      local note, _ = api_ui.editor_search_note_with_file(file)
      if note then
        return
      end
      note, _ = api_ui.editor_search_note_with_buf(buf)
      if note then
        return
      end
    end
    -- close dbee and open buffer
    self:close()
    vim.api.nvim_win_set_buf(0, buf)
  end

  utils.create_singleton_autocmd({ "BufWinEnter", "BufReadPost", "BufNewFile" }, {
    window = winid,
    callback = function(event)
      action(winid, event.buf, event.file)
    end,
  })
end

---Close all other windows when one is closed.
---@package
---@param winid integer
function Slayout:configure_window_on_quit(winid)
  local utils = require("dbee.utils")

  utils.create_singleton_autocmd({ "QuitPre" }, {
    window = winid,
    callback = function()
      self:close()
    end,
  })
end

---Toggle popup when in dbee
function Slayout:open_popup()
  -- Check if popup is already open and close it
  if #self.popup_windows > 0 then
    -- Close all floating windows (including tooltips)
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      local config = vim.api.nvim_win_get_config(win)
      if config.relative ~= "" then
        pcall(vim.api.nvim_win_close, win, true)
      end
    end
    self.popup_windows = {}
    -- Focus back to editor window
    if #self.windows > 0 and vim.api.nvim_win_is_valid(self.windows[1]) then
      vim.api.nvim_set_current_win(self.windows[1])
    end
    return
  end

  local api_ui = require("dbee").api.ui

  local ui_spec = vim.api.nvim_list_uis()[1]
  local win_width = 60
  local win_height = 30
  local x = math.floor((ui_spec["width"] - (win_width * 2)) / 2)
  local y = math.floor((ui_spec["height"] - win_height) / 2)

  -- create new dummy buffer
  local tmp_buf = vim.api.nvim_create_buf(false, true)

  -- open window
  local winid_left = vim.api.nvim_open_win(tmp_buf, true, {
    relative = "editor",
    width = win_width,
    height = win_height,
    col = x,
    row = y,
    border = { "╭", "─", "┬", "│", "┴", "─", "╰", "│" },
    title = "",
    title_pos = "center",
    style = "minimal",
  })
  table.insert(self.popup_windows, winid_left)
  local winid_right = vim.api.nvim_open_win(tmp_buf, true, {
    relative = "editor",
    width = win_width,
    height = win_height,
    col = x + win_width,
    row = y,
    border = { "┬", "─", "╮", "│", "╯", "─", "┴", "│" },
    title = "",
    title_pos = "center",
    style = "minimal",
  })
  table.insert(self.popup_windows, winid_right)

  -- open the dbee views in both windows
  api_ui.drawer_show(winid_left)
  api_ui.call_log_show(winid_right)

  vim.api.nvim_set_current_win(winid_left)

  -- remove temp buffer
  pcall(vim.api.nvim_buf_delete, tmp_buf, { force = true })

  -- helper for closing both windows of the popup
  local close_popup = function()
    pcall(vim.api.nvim_win_close, winid_right, true)
    pcall(vim.api.nvim_win_close, winid_left, true)
    self.popup_windows = {}
  end

  -- function to configure keymaps and autocmds for both popups
  local configure_mappings = function(winid, other_winid)
    local bufnr = vim.api.nvim_win_get_buf(winid)

    -- register autocmd to automatically close the window on leave
    local function autocmd_cb()
      local current_win = vim.api.nvim_get_current_win()
      if current_win ~= winid_left and current_win ~= winid_right then
        close_popup()
      elseif not vim.api.nvim_win_is_valid(winid_left) or not vim.api.nvim_win_is_valid(winid_right) then
        close_popup()
      else
        vim.api.nvim_create_autocmd({ "BufEnter" }, {
          callback = autocmd_cb,
          once = true,
        })
      end
    end
    vim.api.nvim_create_autocmd({ "BufEnter" }, {
      callback = autocmd_cb,
      once = true,
    })

    -- to address the issue of call log hover sometimes not closing.
    vim.api.nvim_create_autocmd({ "QuitPre" }, {
      buffer = vim.api.nvim_win_get_buf(winid),
      callback = close_popup,
    })

    -- escape closes both windows
    vim.keymap.set("n", "<ESC>", function()
      close_popup()
    end, { silent = true, buffer = bufnr })

    -- set keymaps for switching popups from one to the other
    vim.keymap.set("n", "l", function()
      vim.api.nvim_set_current_win(other_winid)
    end, { silent = true, buffer = bufnr })
    vim.keymap.set("n", "h", function()
      vim.api.nvim_set_current_win(other_winid)
    end, { silent = true, buffer = bufnr })
  end

  -- configure
  configure_mappings(winid_left, winid_right)
  configure_mappings(winid_right, winid_left)
end

---@return boolean
function Slayout:is_open()
  return self.is_opened
end

---This function just opens result and editor views in a split.
function Slayout:open()
  local api_ui = require("dbee").api.ui
  local tools = require("dbee.layouts.tools")

  -- save layout before opening ui
  self.egg = tools.save()

  self.windows = {}

  -- editor
  tools.make_only(0)
  local editor_win = vim.api.nvim_get_current_win()
  table.insert(self.windows, editor_win)
  api_ui.editor_show(editor_win)
  self:configure_window_close_on_switch(editor_win, true)
  self:configure_window_on_quit(editor_win)

  -- result
  vim.cmd("bo split")
  local win = vim.api.nvim_get_current_win()
  table.insert(self.windows, win)
  api_ui.result_show(win)
  self:configure_window_close_on_switch(win)
  self:configure_window_on_quit(win)

  -- set cursor to editor
  vim.api.nvim_set_current_win(editor_win)

  self.is_opened = true
end

function Slayout:close()
  local tools = require("dbee.layouts.tools")

  -- close popup windows
  for _, win in ipairs(self.popup_windows) do
    pcall(vim.api.nvim_win_close, win, true)
  end
  self.popup_windows = {}

  -- close all windows
  for _, win in ipairs(self.windows) do
    pcall(vim.api.nvim_win_close, win, false)
  end

  -- restore layout
  tools.restore(self.egg)
  self.egg = nil
  self.is_opened = false
end

return Slayout
