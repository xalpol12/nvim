local api = require "nvim-tree.api"
vim.keymap.set("n", "<leader>pv", api.tree.open)

vim.opt.termguicolors = true

require("nvim-tree").setup({
  disable_netrw = true,
  hijack_unnamed_buffer_when_opening = false,
  sync_root_with_cwd = true,
  hijack_netrw = true,
  hijack_cursor = true,
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
    adaptive_size = false,
    side = "left",
    preserve_window_proportions = true,
  },
  filesystem_watchers = {
    enable = true,
  },
  filters = {
    dotfiles = true,
  },
  actions = {
    open_file = {
      resize_window = true,
    },
  },
  renderer = {
    group_empty = false,
    root_folder_label = false,
    highlight_git = false,
    highlight_opened_files = "none",

    indent_markers = {
      enable = false,
    },

    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = false,
      },

      glyphs = {
        default = "󰈚",
        symlink = "",
        folder = {
          default = "",
          empty = "",
          empty_open = "",
          open = "",
          symlink = "",
          symlink_open = "",
          arrow_open = "",
          arrow_closed = "",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
})
