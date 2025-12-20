return {
  "L3MON4D3/LuaSnip",
  version = "v2.*",
  -- install jsregexp (optional!).
  build = "make install_jsregexp",
  config = function()
    local ls = require("luasnip")
    local s = ls.snippet
    local t = ls.text_node
    local i = ls.insert_node
    local c = ls.choice_node

    ls.config.set_config({
      history = true,
      updateevents = "TextChanged,TextChangedI",
    })

    ls.add_snippets("all", {
      s("ternary", {
        i(1, "cond"),
        t(" ? "),
        i(2, "then"),
        t(" : "),
        i(3, "else"),
      }),
      ls.add_snippets("all", {
        s("httpcache", {
          c(1, {
            t('"HTTPCACHE_ENABLED": True'),
            t('custom_settings = {"HTTPCACHE_ENABLED": True}'),
          }),
          i(0),
        }),
      }),
    })

    vim.keymap.set({ "i", "s" }, "<c-k>", function()
      if ls.expand_or_jumpable() then ls.expand_or_jump() end
    end, { silent = true })

    vim.keymap.set({ "i", "s" }, "<c-j>", function()
      if ls.jumpable(-1) then ls.jump(-1) end
    end, { silent = true })

    vim.keymap.set("i", "<c-l>", function()
      if ls.choice_active() then ls.change_choice(1) end
    end)
  end,
}
