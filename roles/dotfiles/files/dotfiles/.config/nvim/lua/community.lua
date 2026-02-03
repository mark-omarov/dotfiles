-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.colorscheme.tokyonight-nvim" },
  { import = "astrocommunity.color.transparent-nvim" },
  { import = "astrocommunity.completion.cmp-cmdline" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.markdown-and-latex.render-markdown-nvim" },
  { import = "astrocommunity.file-explorer.yazi-nvim" },
  { import = "astrocommunity.editing-support.refactoring-nvim" },

  -- Search & replace across project
  { import = "astrocommunity.search.grug-far-nvim" },

  -- Test runner
  { import = "astrocommunity.test.neotest" },

  -- Docker
  { import = "astrocommunity.pack.docker" },
  { import = "astrocommunity.docker.lazydocker" },

  -- K8s / YAML support
  { import = "astrocommunity.pack.helm" },
  { import = "astrocommunity.pack.yaml" },

  -- Task runner (run configs)
  { import = "astrocommunity.code-runner.overseer-nvim" },

  -- Diagnostics
  { import = "astrocommunity.diagnostics.trouble-nvim" },

  -- Surround
  { import = "astrocommunity.motion.mini-surround" },

  -- LSP enhancements
  { import = "astrocommunity.lsp.inc-rename-nvim" },
  { import = "astrocommunity.lsp.actions-preview-nvim" },
}
