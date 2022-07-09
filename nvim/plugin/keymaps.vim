" Don't know why doesn't work remaping in init.lua
nnoremap <space> <Nop>
let mapleader=" "

nnoremap n nzz
nnoremap N Nzz

nnoremap <A-j> :m . +1<CR>==
nnoremap <A-k> :m . -2<CR>==
inoremap <A-j> <Esc>:m . +1<CR>==gi
inoremap <A-k> <Esc>:m . -2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

imap jk <Esc>
tnoremap jk <C-\><C-N>

"  Do I use them
nnoremap <leader>eh :tabprevious<CR>
nnoremap <leader>ej :bprevious<CR>
nnoremap <leader>ek :bnext<CR>
nnoremap <leader>el :tabnext<CR>

nnoremap <leader>hr :call tj#save_and_exec()<CR>

" Do I really need them?
nnoremap  <leader>wh <C-W>h
nnoremap  <leader>wj <C-W>j
nnoremap  <leader>wk <C-W>k
nnoremap  <leader>wl <C-W>l

map gf :lua require'uszczi.go_to_file'.jump()<cr>


""" Dap mode and dap ui
" TODO move that do dap
nnoremap <silent><leader>dd :lua require('dapui').toggle()<CR>
nnoremap <silent><leader>de :lua require('dap').toggle_breakpoint()<CR>
nnoremap <silent><leader>df :lua require('dap').continue()<CR>

nnoremap <leader>du  :lua require('dap').step_into()<CR>
nnoremap <leader>di  :lua require('dap').step_over()<CR>
nnoremap <leader>do  :lua require('dap').step_out()<CR>

nnoremap <leader>da :lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
nnoremap <leader>lp :lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
nnoremap <leader>dr :lua require('dap').repl.open()<CR>
nnoremap <leader>dl :lua require('dap').run_last()<CR>
nnoremap <leader>dc :lua require('dap').run_to_cursor()<CR>
nnoremap <leader>dg :lua require('dapui').float_element('scopes')<CR>
nnoremap <leader>dG :lua require('dapui').toggle('scopes')<CR>
nnoremap <leader>dw :lua require('dapui').eval()<CR>
nnoremap <leader>d0 :lua require('dap.ext.vscode').load_launchjs()<CR>


""" Fugitive
nnoremap <leader>gG :Git<CR>
nnoremap <leader>gg :Neogit<CR>
nnoremap <leader>ii :Gdiffsplit<CR>
nnoremap <leader>iu :diffget //2<CR>
nnoremap <leader>io :diffget //3<CR>

nnoremap <leader>gu :SignifyHunkUndo<CR>
nnoremap <leader>go :SignifyHunkDiff<CR>


""" Harpoon
nnoremap <silent><leader>a :lua require("harpoon.mark").add_file()<CR>
nnoremap <silent><C-e> :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <silent><leader>tc :lua require("harpoon.cmd-ui").toggle_quick_menu()<CR>

nnoremap <silent><leader>rq :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <silent><leader>rw :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <silent><leader>re :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <silent><leader>rr :lua require("harpoon.ui").nav_file(4)<CR>
nnoremap <silent><leader>tu :lua require("harpoon.term").gotoTerminal(1)<CR>
nnoremap <silent><leader>te :lua require("harpoon.term").gotoTerminal(2)<CR>
nnoremap <silent><leader>cu :lua require("harpoon.term").sendCommand(1, 1)<CR>
nnoremap <silent><leader>ci :lua require("harpoon.term").sendCommand(1, 2)<CR>
nnoremap <silent><leader>co :lua require("harpoon.term").sendCommand(1, 3)<CR>


""" Telescope
nnoremap <leader><leader> <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
" TODO find a better way to including only specific type of files in telescope
nnoremap <leader>FF <cmd>:lua require'telescope.builtin'.live_grep({additional_args=function() return {'--type=py'} end })<cr>
nnoremap <leader>fF <cmd>lua require("telescope.builtin").find_files({hidden=true, no_ignore=true})<cr>
nnoremap <leader>fG <cmd>Telescope grep_string<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fm <cmd>Telescope man_pages<cr>
nnoremap <leader>fr <cmd>Telescope oldfiles<cr>
nnoremap <leader>ff <cmd>Telescope git_files<cr>
nnoremap <leader>ff <cmd>Telescope git_files<cr>
nnoremap <leader>ft <cmd>Telescope resume<cr>
nnoremap <leader>fe <cmd>Telescope current_buffer_fuzzy_find<cr>
nnoremap <leader>fv :lua require('my_telescope').current_directory()<cr>
nnoremap <leader>fV :Ex<cr>
nnoremap <leader>fp :Telescope project<cr>
nnoremap <leader>fq :Telescope git_branches<cr>


nnoremap <leader>oP <cmd>:25Vexplore<cr> " TODO Write utlity for hiding this at the same key
nnoremap <leader>op <cmd>NvimTreeToggle<cr>
nnoremap <leader>oi <cmd>NvimTreeFindFile<cr>
nnoremap <leader>od <cmd>DBUIToggle<cr>
nnoremap <F5> :UndotreeToggle<CR>


""" Quickfix and location list
nnoremap <C-j> :cprev<CR>zz
nnoremap <C-k> :cnext<CR>zz
nnoremap <leader>j :lprev<CR>zz
nnoremap <leader>k :lnext<CR>zz

nnoremap <C-q> :call ToggleQFList(1)<CR>
nnoremap <C-w>q :Telescope quickfix<CR>
nnoremap <leader>q :call ToggleQFList(0)<CR>
nnoremap <leader>Q :Telescope loclist<CR>

" TODO this shouldnt be here
" let g:nvim_tree_git_hl = 1
" let g:nvim_tree_respect_buf_cwd = 1

let g:the_primeagen_qf_l = 0
let g:the_primeagen_qf_g = 0

fun! ToggleQFList(global)
    if a:global
        if g:the_primeagen_qf_g == 1
            let g:the_primeagen_qf_g = 0
            cclose
        else
            let g:the_primeagen_qf_g = 1
            copen
        end
    else
        if g:the_primeagen_qf_l == 1
            let g:the_primeagen_qf_l = 0
            lclose
        else
            let g:the_primeagen_qf_l = 1
            lopen
        end
    endif
endfun


""" LSP
nnoremap gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap gr :lua vim.lsp.buf.references()<CR>
nnoremap K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>wa <cmd>lua vim.lsp.buf.add_workspace
nnoremap <leader>wr <cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>
nnoremap <leader>wl <cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>
nnoremap <leader>D <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <leader>ca <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>e <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
nnoremap <leader>cq :lua vim.diagnostic.set_loclist()<CR>

""" Test
nnoremap <leader>tt :lua require'uszczi.testing'.test_method()<CR>
nnoremap <leader>td :lua require'uszczi.testing'.debug_method()<CR>
nnoremap <leader>tT :lua require'uszczi.testing'.test_file()<CR>
nnoremap <leader>tl :lua require'uszczi.testing'.last_test()<CR>
nnoremap <leader>tg :lua require'uszczi.testing'.visit_last()<CR>

""" Worktree
nnoremap <leader>tb :lua require('telescope').extensions.git_worktree.git_worktrees()<CR>

