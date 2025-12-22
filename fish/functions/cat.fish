function cat -d "Replace `cat` with `bat` with fallback"
    argparse h/help n/number -- $argv

    if set -ql _flag_help
        echo "Usage: cat [-h|--help] [-p|--plain]

        Replace `cat` with `bat` with `cat` being the fallback.

        It defaults to `bat --style=plain --paging=never` and allows passing
        `-n` or `--number` to output the number row.

        Options:
          -h, --help    Show this help message and exit.
          -n, --number   Use `bat` with `--number`.
        "
      return 0
    end

    if type -q bat
        set bat_opts --style=plain --paging=never

        if set -ql _flag_number
          set bat_opts $bat_opts --number
        end

        command bat $bat_opts $argv
    else
        command cat $argv
    end
end
