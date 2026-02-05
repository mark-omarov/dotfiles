return {
  {
    "kndndrj/nvim-dbee",
    dependencies = { "MunifTanjim/nui.nvim" },
    build = function() require("dbee").install() end,
    cmd = "Dbee",
    config = function()
      local Layout = require("plugins.dbee.layout")
      -- Store layout instance globally so keymaps can access it
      _G.DbeeLayout = Layout:new()
      require("dbee").setup({
        drawer = { disable_help = true },
        window_layout = _G.DbeeLayout,
      })
    end,
  },
}
