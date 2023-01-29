local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)



require("lazy").setup({"ThePrimeagen/harpoon", "navarasu/onedark.nvim", "dstein64/vim-startuptime", "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"}, {})

vim.cmd [[colorscheme onedark]]
