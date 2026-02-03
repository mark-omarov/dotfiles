local vault = os.getenv "OBSIDIAN_VAULT"
if not vault or vault == "" then return {} end

---@type LazySpec
return {
  {
    "obsidian-nvim/obsidian.nvim",
    version = "*",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = {
      "BufReadPre " .. vault .. "/**.md",
      "BufNewFile " .. vault .. "/**.md",
    },
    cmd = { "Obsidian" },
    init = function()
      vim.api.nvim_create_autocmd("BufEnter", {
        pattern = vault .. "/**.md",
        callback = function() vim.opt_local.conceallevel = 2 end,
      })
    end,
    opts = {
      workspaces = {
        { name = "vault", path = vault },
      },
      daily_notes = {
        folder = "daily",
      },
      templates = {
        folder = "templates",
      },
      legacy_commands = false,
      ui = {
        checkboxes = {},
        external = { enable = true },
      },
    },
  },
  {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        n = {
          ["<Leader>O"] = { desc = "Obsidian" },
          ["<Leader>Oo"] = { "<Cmd>Obsidian quick_switch<CR>", desc = "Open note" },
          ["<Leader>On"] = { "<Cmd>Obsidian new<CR>", desc = "New note" },
          ["<Leader>Od"] = { "<Cmd>Obsidian today<CR>", desc = "Daily note" },
          ["<Leader>Os"] = { "<Cmd>Obsidian search<CR>", desc = "Search notes" },
          ["<Leader>Ob"] = { "<Cmd>Obsidian backlinks<CR>", desc = "Backlinks" },
          ["<Leader>Ot"] = { "<Cmd>Obsidian tags<CR>", desc = "Tags" },
        },
      },
    },
  },
}
