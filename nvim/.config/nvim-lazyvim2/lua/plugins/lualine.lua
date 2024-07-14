return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      theme = "material-stealth", -- the stealth style
      component_separators = "|",
      section_separators = { left = "", right = "" },
    },
    sections = {
      lualine_a = { { "mode", separator = { left = "" } } },
      lualine_z = { { "location", separator = { right = "" } } },
    },
  },
}
