function! GoToFile()
lua << EOF
local mod = require('go_to_file')
mod.go_to_file()
EOF
endfunction

command! GoToFile call GoToFile()
