return {
  "3rd/image.nvim",
  build = false,
  opts = {
    processor = "magick_cli",
  },
  lazy = false,
  keys = {
    {
      "<leader>cp",
      function()
        local image = require("image")
        if image.is_enabled() then
          image.disable()
          vim.notify("Image.nvim disabled", vim.log.levels.INFO)
        else
          image.enable()
          vim.notify("Image.nvim enabled", vim.log.levels.INFO)
        end
      end,
      desc = "Toggle image.nvim",
    },
  },
}
