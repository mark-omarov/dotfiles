---@type LazySpec
return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    cmd = { "CodeCompanion", "CodeCompanionChat", "CodeCompanionActions" },
    opts = {
      strategies = {
        chat = { adapter = "claude_code" },
        inline = { adapter = "claude_code" },
      },
    },
  },
  {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        n = {
          ["<Leader>a"] = { desc = "AI" },
          ["<Leader>aa"] = { "<Cmd>CodeCompanionActions<CR>", desc = "Actions" },
          ["<Leader>ac"] = { "<Cmd>CodeCompanionChat Toggle<CR>", desc = "Chat toggle" },
          ["<Leader>ai"] = { "<Cmd>CodeCompanion<CR>", desc = "Inline prompt" },
        },
        v = {
          ["<Leader>a"] = { desc = "AI" },
          ["<Leader>ac"] = { "<Cmd>CodeCompanionChat Add<CR>", desc = "Add selection to chat" },
          ["<Leader>ai"] = { ":CodeCompanion<CR>", desc = "Inline prompt" },
        },
      },
    },
  },
}
