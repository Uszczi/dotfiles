local ok, ibl = pcall(require, "ibl")
if not ok then
    return
end

require("ibl").setup {
    indent = {char = "┊"},
    scope = {enabled = false}
}
