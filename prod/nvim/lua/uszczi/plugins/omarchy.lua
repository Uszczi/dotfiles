-- Omarchy theme integration.
--
-- `omarchy theme set` renders a lazy.nvim spec for the current theme to
-- ~/.local/state/omarchy/current/theme/neovim.lua. The stock template is
-- written for LazyVim configs: it ships the theme's colorscheme plugin
-- (e.g. ashen.nvim or aether.nvim with the colors baked into `opts`) and
-- applies the scheme through the "LazyVim/LazyVim" `colorscheme` opt.
--
-- This config is plain lazy.nvim, so read the file, drop the LazyVim entry
-- and apply the colorscheme on the colorscheme plugin itself. The file is
-- re-read at every startup, so `omarchy theme set <name>` takes effect in
-- newly started Neovim sessions. When the file is missing or unreadable we
-- return nothing and theme.lua's catppuccin stays in charge.
--
-- Startup-order note: catppuccin sets its colorscheme from `init` (stage 1
-- of lazy's loader), while the colorscheme applied below runs in the plugin
-- `config` during the eager load stage (stage 2) — so the Omarchy theme
-- wins without touching theme.lua.

local theme_file = vim.fn.expand("~/.local/state/omarchy/current/theme/neovim.lua")

local function read_theme_spec()
  if vim.fn.filereadable(theme_file) ~= 1 then
    return nil
  end
  local chunk = loadfile(theme_file)
  if not chunk then
    return nil
  end
  local ok, spec = pcall(chunk)
  if not ok or type(spec) ~= "table" then
    return nil
  end
  return spec
end

-- The plugin module a spec entry refers to, the way lazy derives it ("ficcdaf/ashen.nvim" -> "ashen").
local function mod_of(entry)
  if type(entry.name) == "string" then
    return entry.name
  end
  local tail = type(entry[1]) == "string" and entry[1]:match("[^/]+$")
  return tail and tail:gsub("%.nvim$", "")
end

local theme = read_theme_spec()
if not theme then
  return {}
end

-- The colorscheme LazyVim would have set lives in the "LazyVim/LazyVim" entry.
local colorscheme
for _, entry in ipairs(theme) do
  if type(entry) == "table" and entry[1] == "LazyVim/LazyVim" and type(entry.opts) == "table" then
    colorscheme = entry.opts.colorscheme or colorscheme
  end
end

local plugins = {}
for _, entry in ipairs(theme) do
  if type(entry) == "table" and entry[1] ~= "LazyVim/LazyVim" then
    local mod = mod_of(entry)
    -- Wrap the entry that provides the colorscheme; pass anything else through
    -- untouched (lazy's `opts` auto-setup still applies to those).
    if mod and (colorscheme == nil and #plugins == 0 or mod == colorscheme) then
      local cs = colorscheme or mod
      entry.config = function(_, opts)
        if type(opts) == "table" then
          local ok, plugin = pcall(require, mod)
          if ok and type(plugin.setup) == "function" then
            plugin.setup(opts)
          end
        end
        vim.cmd.colorscheme(cs)
      end
    end
    plugins[#plugins + 1] = entry
  end
end

return plugins
