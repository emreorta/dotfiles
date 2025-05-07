function cat
    if type -q bat
        command bat --style=plain --paging=never --number $argv
    else
        command cat $argv
    end
end
