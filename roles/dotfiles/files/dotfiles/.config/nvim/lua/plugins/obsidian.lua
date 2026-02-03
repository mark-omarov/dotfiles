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
