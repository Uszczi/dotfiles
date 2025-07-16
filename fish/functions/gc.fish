function gc --wraps='git commit'
    set branch (git rev-parse --abbrev-ref HEAD)
    set last_part (string split '/' $branch)[-1]
    set ticket_id (string split -- '-V' $last_part)[1]
    echo "git commit -m $ticket_id # $argv"
end
