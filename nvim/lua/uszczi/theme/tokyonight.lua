vim.g.uszczi_colorscheme = "tokyonight"

function ColorMyPencils()
    vim.g.tokyonight_style = "storm"

    vim.cmd("colorscheme " .. vim.g.uszczi_colorscheme)

    local hl = function(thing, opts)
        vim.api.nvim_set_hl(0, thing, opts)
    end

    hl(
        "ColorColumn",
        {
            ctermbg = 0,
            bg = "#555555"
        }
    )
    hl(
        "LineNr",
        {
            fg = "#5eacd3"
        }
    )
end

ColorMyPencils()
