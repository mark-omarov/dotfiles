-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      "vimdoc",
      "query",
      "bash",
      "json",
      "yaml",
      "toml",
      "go",
      "gomod",
      "gosum",
      "typescript",
      "tsx",
      "javascript",
      "html",
      "css",
      "markdown",
      "markdown_inline",
      "dockerfile",
      "sql",
      "http",
    },
  },
}
