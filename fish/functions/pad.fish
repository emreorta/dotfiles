function pad -d "Add padding to windows in Aerospace"
    argparse h/help w/width m/monitor r/reset -- $argv
    or return

    if set -ql _flag_help
        echo "Usage: pad [-h|--help] [-w|--with INTEGER] [-m|--monitor STRING] [-r|--reset]

        Add padding to windows in Aerospace.

        Options:
          -h, --help            Show this help message and exit.
          -w, --width INTEGER   Set the padding width (default: 0).
          -m, --monitor STRING  Specify which monitor to apply padding to (default: main).
          -r, --reset           Reset padding to 0 (overrides other flags).

        Examples:
          pad -w 100            Set padding width to 100 on the main monitor.
          pad -m main           Apply padding to the 'main' monitor.
          pad -r                Reset padding to 0 on all monitors. Equivalent to `pad`.
          pad                   Reset padding to 0 on all monitors. Equivalent to `pad --reset`.
        "
        return 0
    end

    if set -ql _flag_width
        set width $argv[1]
    else
        set width 0
    end

    if set -ql _flag_monitor
        set monitor $argv[2]
    else
        set monitor main
    end

    if test (count $argv) -eq 0
        set padding 0
    else if set -ql _flag_reset
        set padding 0
    else
        set padding "[{ monitor.\"$monitor\" = $width }, 0]"
    end

    sed -i '' "s/^\([[:space:]]*outer\.left = \).*/\1$padding/; s/^\([[:space:]]*outer\.right = \).*/\1$padding/" ~/dev/dotfiles/aerospace/aerospace.toml
    aerospace reload-config
end
