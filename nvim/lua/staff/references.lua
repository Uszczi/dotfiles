-- Some way of manually sourcing the file
-- For sure there must be better way
local plugins = {}
for _, plugin in pairs(plugins) do
    vim.cmd("source ~/.config/nvim/plugins/" .. plugin .. ".vim")
end
