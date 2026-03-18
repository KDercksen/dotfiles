return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      auto_install = true,
      lazy = false,
      build = ":TSUpdate",
    },
  },
}
