rm "C:\Users\mateu\.glzr\glazewm\config.yaml"
rm "C:\Users\mateu\.glzr\zebar"

New-Item -ItemType SymbolicLink -Target "C:\Users\mateu\dotfiles\windows\env\.glzr\glazewm\config.yaml" -Path "C:\Users\mateu\.glzr\glazewm\config.yaml"
New-Item -ItemType SymbolicLink -Target "C:\Users\mateu\dotfiles\windows\env\.glzr\zebar" -Path "C:\Users\mateu\.glzr\zebar"
