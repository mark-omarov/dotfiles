---@type LazySpec
return {
  {
    "Juksuu/worktrees.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function() require("worktrees").setup() end,
  },
  {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        n = {
          ["<Leader>gw"] = { desc = "Worktrees" },
          ["<Leader>gws"] = {
            function() Snacks.picker.worktrees() end,
            desc = "Switch worktree",
          },
          ["<Leader>gwn"] = {
            function() Snacks.picker.worktrees_new() end,
            desc = "New worktree",
          },
          ["<Leader>gwr"] = {
            function() Snacks.picker.worktrees_remove() end,
            desc = "Remove worktree",
          },
        },
      },
    },
  },
}
