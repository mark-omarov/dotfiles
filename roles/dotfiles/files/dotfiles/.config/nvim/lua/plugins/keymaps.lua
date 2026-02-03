return {
  {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        n = {
          -- Database
          ["<Leader>D"] = { "<Cmd>Dbee<CR>", desc = "Database" },

          -- Infrastructure
          ["<Leader>I"] = { desc = "Infrastructure" },
          ["<Leader>Ik"] = {
            function()
              require("toggleterm.terminal").Terminal
                :new({ cmd = "k9s", direction = "float", hidden = true })
                :toggle()
            end,
            desc = "K9s",
          },
          ["<Leader>Id"] = {
            function()
              require("toggleterm.terminal").Terminal
                :new({ cmd = "lazydocker", direction = "float", hidden = true })
                :toggle()
            end,
            desc = "Lazydocker",
          },
        },
      },
      autocmds = {
        kulala_keymaps = {
          {
            event = "FileType",
            pattern = { "http", "rest" },
            desc = "Kulala HTTP client keymaps",
            callback = function(args)
              local map = vim.keymap.set
              local opts = { buffer = args.buf }
              map("n", "<Leader>H", "", vim.tbl_extend("force", opts, { desc = "HTTP" }))
              map("n", "<Leader>Hs", function() require("kulala").run() end, vim.tbl_extend("force", opts, { desc = "Send request" }))
              map("n", "<Leader>Ha", function() require("kulala").run_all() end, vim.tbl_extend("force", opts, { desc = "Send all" }))
              map("n", "<Leader>Hn", function() require("kulala").jump_next() end, vim.tbl_extend("force", opts, { desc = "Next request" }))
              map("n", "<Leader>Hp", function() require("kulala").jump_prev() end, vim.tbl_extend("force", opts, { desc = "Prev request" }))
            end,
          },
        },
      },
    },
  },
}
