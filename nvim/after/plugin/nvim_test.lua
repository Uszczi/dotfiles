-- TestSuite - run the whole test suite
-- TestFile - run all tests for the current file
-- TestEdit - edit tests for the current file
---- TestNearest - run the test nearest to the cursor
---- TestLast - rerun the latest test
-- TestVisit - open the last run test in the current buffer
-- TestInfo - show an information about the plugin
--
--
vim.keymap.set("n", "<leader>tn", ":TestNearest<CR>")
vim.keymap.set("n", "<leader>tl", ":TestLast<CR>")
vim.keymap.set("n", "<leader>tf", ":TestFile<CR>")
vim.keymap.set("n", "<leader>ts", ":TestSuite<CR>")
