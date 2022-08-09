require("null-ls").setup(
    {
        debug = true,
        sources = {
            -- require("null-ls").builtins.diagnostics.eslint_d,
            -- require("null-ls").builtins.formatting.eslint_d,
            -- require("null-ls").builtins.diagnostics.flake8,
            -- require("null-ls").builtins.diagnostics.pylint,
            require("null-ls").builtins.diagnostics.vulture.with({extra_args = {"--ignore-names test_*"}}),
            -- require("null-ls").builtins.diagnostics.mypy,
            require("null-ls").builtins.formatting.isort,
            require("null-ls").builtins.completion.spell
        }
    }
)
