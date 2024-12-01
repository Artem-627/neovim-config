vim.opt.termguicolors = true

local bufferline = require("bufferline")

bufferline.setup {
  options = {
    mode = "buffers",
    themable = false,
    separator_style = "thick",
    modified_icon = '● ',
    always_show_bufferline = false,
  },
  highlights = {
    separator_selected = {
      fg = "#AADDCC",
      bg = "#AADDCC"
    },
    separator_visible = {
      fg = "#AADDCC",
      bg = "#AADDCC"
    },
    separator = {
      fg = "#AADDCC",
      bg = "#AADDCC"
    },
  }
}
