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



require("lazy").setup({"ThePrimeagen/harpoon", {"navarasu/onedark.nvim", init=function() vim.cmd [[colorscheme onedark]] end}, {"dstein64/vim-startuptime", cmd="StartupTime"}, "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"}, {})


