require("null-ls").setup(
    {
        debug = true,
        sources = {
            -- require("null-ls").builtins.diagnostics.eslint_d,
            -- require("null-ls").builtins.formatting.eslint_d,
            -- require("null-ls").builtins.diagnostics.flake8,
            -- require("null-ls").builtins.diagnostics.pylint,
            -- require("null-ls").builtins.diagnostics.vulture.with(
            --     {
            --         extra_args = {"--ignore-names", "test_*"} -- change something
            --     }
            -- ),
            -- require("null-ls").builtins.diagnostics.vulture,
            -- require("null-ls").builtins.diagnostics.mypy,
            require("null-ls").builtins.formatting.isort -- TODO fix this make working with global isort
            -- require("null-ls").builtins.completion.spell
        }
    }
)