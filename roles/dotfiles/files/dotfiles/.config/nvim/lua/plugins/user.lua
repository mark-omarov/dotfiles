---@type LazySpec
return {
  -- Missing dep for refactoring.nvim (community pack doesn't pull it in).
  { "lewis6991/async.nvim", lazy = false },
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = { "lewis6991/async.nvim", "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
  },
}
