---@type LazySpec
return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        header = table.concat({
          "███╗   ███╗██╗  ██╗███╗   ██╗███████╗████████╗██████╗ ",
          "████╗ ████║██║ ██╔╝████╗  ██║██╔════╝╚══██╔══╝██╔══██╗",
          "██╔████╔██║█████╔╝ ██╔██╗ ██║█████╗     ██║   ██████╔╝",
          "██║╚██╔╝██║██╔═██╗ ██║╚██╗██║██╔══╝     ██║   ██╔══██╗",
          "██║ ╚═╝ ██║██║  ██╗██║ ╚████║███████╗   ██║   ██║  ██║",
          "╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝",
        }, "\n"),
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = " ", key = "w", desc = "Find Word", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "p", desc = "Projects", action = ":lua Snacks.dashboard.pick('projects')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          {
            icon = " ",
            key = "o",
            desc = "Obsidian Daily Note",
            action = ":Obsidian today",
            enabled = function() return os.getenv "OBSIDIAN_VAULT" and os.getenv "OBSIDIAN_VAULT" ~= "" end,
          },
          {
            icon = " ",
            key = "s",
            desc = "Search Notes",
            action = ":Obsidian search",
            enabled = function() return os.getenv "OBSIDIAN_VAULT" and os.getenv "OBSIDIAN_VAULT" ~= "" end,
          },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
      },
      sections = {
        { section = "header" },
        { section = "keys", gap = 1, padding = 1 },
        { section = "startup" },
        -- right pane: GitHub & git info
        {
          pane = 2,
          icon = " ",
          desc = "Browse Repo",
          padding = 1,
          key = "b",
          action = function() Snacks.gitbrowse() end,
        },
        function()
          local in_git = Snacks.git.get_root() ~= nil
          local cmds = {
            {
              title = "Notifications",
              cmd = "gh notify -s -a -n5",
              action = function() vim.ui.open("https://github.com/notifications") end,
              key = "N",
              icon = " ",
              height = 5,
              enabled = true,
            },
            {
              title = "Open Issues",
              cmd = "gh issue list -L 3",
              key = "i",
              action = function() vim.fn.jobstart("gh issue list --web", { detach = true }) end,
              icon = " ",
              height = 7,
            },
            {
              icon = " ",
              title = "Open PRs",
              cmd = "gh pr list -L 3",
              key = "P",
              action = function() vim.fn.jobstart("gh pr list --web", { detach = true }) end,
              height = 7,
            },
            {
              icon = " ",
              title = "Git Status",
              cmd = "git --no-pager diff --stat -B -M -C",
              height = 10,
            },
          }
          return vim.tbl_map(function(cmd)
            return vim.tbl_extend("force", {
              pane = 2,
              section = "terminal",
              enabled = in_git,
              padding = 1,
              ttl = 5 * 60,
              indent = 3,
            }, cmd)
          end, cmds)
        end,
      },
    },
  },
}
