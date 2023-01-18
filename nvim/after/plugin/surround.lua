-- https://github.com/kylechui/nvim-surround
require("nvim-surround").setup({
    keymaps = {
        insert = "<C-g>s",
        insert_line = "<C-g>S",
        normal = "ys",
        normal_cur = "yss",
        normal_line = "yS",
        normal_cur_line = "ySS",
        visual = "S",
        visual_line = "gS",
        delete = "ds",
        change = "cs"
    },
    surround = {
        pairs = {
            ["("] = {"( ", " )"},
            [")"] = {"(", ")"},
            ["{"] = {"{ ", " }"},
            ["}"] = {"{", "}"},
            ["<"] = {"< ", " >"},
            [">"] = {"<", ">"},
            ["["] = {"[ ", " ]"},
            ["]"] = {"[", "]"},
            ["e"] = function()
                return {{"hello", "what", ""}, " world"}
            end
        },
        separator = {["'"] = {"'", "'"}, ['"'] = {'"', '"'}, ["`"] = {"`", "`"}},
        HTML = {["t"] = true},
        aliases = {
            ["a"] = ">",
            ["b"] = ")",
            ["B"] = "}",
            ["r"] = "]",
            ["q"] = {'"', "'", "`"},
            ["s"] = {"}", "]", ")", ">", '"', "'", "`"}
        }
    }
})
