return {
  {
    "wakatime/vim-wakatime",
    lazy = false,
  },
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme cyberdream")
    end,
  },
  {
    "mattn/emmet-vim",
    ft = { "html", "css", "javascriptreact", "typescriptreact" },
    config = function()
      vim.g.user_emmet_mode = "jsx"
      vim.g.user_emmet_install_global = 0
      vim.api.nvim_command("autocmd FileType javascriptreact EmmetInstall")
      vim.api.nvim_command("autocmd FileType typescriptreact EmmetInstall")
    end,
  },
}
