return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "hyprlang",
      "css",
    },
  },
  -- add hyprlang file detection
  vim.filetype.add({
    pattern = { [".*/hypr.*%.conf"] = "hyprlang" },
  }),
}
