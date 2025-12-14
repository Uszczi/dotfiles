local ok, transparent = pcall(require, "transparent")
if not ok then
	-- https://github.com/xiyaowong/transparent.nvim
	-- "xiyaowong/nvim-transparent",
	return
end

transparent.setup({
	enable = true,
	extra_groups = {
		"NvimTreeNormal",
		"NvimTreeEndOfBuffer",
	},
	exclude_groups = {},
})
