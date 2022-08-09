vim.g.uszczi_colorscheme = "tokyonight"

function ColorMyPencils()
    -- vim.g.tokyonight_transparent_sidebar = true
    -- vim.g.tokyonight_transparent = true
    vim.g.tokyonight_style = "storm"

    vim.cmd("colorscheme " .. vim.g.uszczi_colorscheme)

    local hl = function(thing, opts)
        vim.api.nvim_set_hl(0, thing, opts)
    end

    -- hl(
    --     "SignColumn",
    --     {
    --         bg = "none"
    --     }
    -- )
    --
    hl(
        "ColorColumn",
        {
            ctermbg = 0,
            bg = "#555555"
        }
    )
    --
    -- hl(
    --     "CursorLineNR",
    --     {
    --         bg = "None"
    --     }
    -- )
    --
    -- hl(
    --     "Normal",
    --     {
    --         bg = "none"
    --     }
    -- )
    --
    hl(
        "LineNr",
        {
            fg = "#5eacd3"
        }
    )
    --
    -- hl(
    --     "netrwDir",
    --     {
    --         fg = "#5eacd3"
    --     }
    -- )
end

ColorMyPencils()
