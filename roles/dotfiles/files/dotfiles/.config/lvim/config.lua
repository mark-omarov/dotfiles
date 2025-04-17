-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

lvim.transparent_window = true
lvim.format_on_save.enabled = true
vim.opt.laststatus = 3
vim.opt.relativenumber = true

table.insert(lvim.plugins, {
  "zbirenbaum/copilot-cmp",
  event = "InsertEnter",
  dependencies = { "zbirenbaum/copilot.lua" },
  config = function()
    vim.defer_fn(function()
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
      require("copilot_cmp").setup()
    end, 100)
  end,
})

local linters = require "lvim.lsp.null-ls.linters"
linters.setup({
  {
    command = "eslint",
    filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  },
})

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup({
  {
    command = "prettier",
    filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  },
})

require("lvim.lsp.manager").setup("tailwindcss")
require("lvim.lsp.manager").setup("tsserver")
require("lvim.lsp.manager").setup("docker_compose_language_service")
require("lvim.lsp.manager").setup("prettier")

table.insert(lvim.plugins, {
  "CopilotC-Nvim/CopilotChat.nvim",
  dependencies = {
    { "zbirenbaum/copilot.lua" },
    { "nvim-lua/plenary.nvim", branch = "master" },
  },
  build = "make tiktoken",
  opts = {},
})

------------------------------------------------
-- DAP / Debugging Plugins for JS & TS
------------------------------------------------
table.insert(lvim.plugins, {
  "mfussenegger/nvim-dap",
})

require("dap").adapters["pwa-node"] = {
  type = "server",
  host = "localhost",
  port = "${port}",
  executable = {
    command = "node",
    args = {"/Users/mark-omarov/.config/js-debug-dap/js-debug/src/dapDebugServer.js", "${port}"},
  }
}

------------------------------------------------
-- Auto-load a per-project DAP config if it exists
------------------------------------------------
local project_dap_path = vim.fn.getcwd() .. "/.nvim/dap.lua"
if vim.fn.filereadable(project_dap_path) == 1 then
  dofile(project_dap_path)
end
