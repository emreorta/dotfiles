function merge_taskrc -d "Merge two Taskwarrior configuration into one"
    argparse h/help b/base= l/local= t/target= -- $argv
    or return

    if set -ql _flag_help
        echo "Usage: merge_taskrc [-h|--help] [-b|--base STRING] [-l|--local STRING] [-t|--target STRING]

        Merge two Taskwarrior configuration files (`.taskrc`) into one.

        Taskwarrior doesn't support this natively and some configuration options shouldn't
        be on git (e.g. sync params).

        Options:
          -h, --help            Show this help message and exit.
          -b, --base STRING     Path to the base `.taskrc` file.
          -l, --local STRING    Path to the local `.taskrc` file.
          -t, --target STRING   Path to the target `.taskrc` file (default: ~/.taskrc)

        Examples:
          merge_taskrc --base ~/path/to/.taskrc.base --local ~/path/to/.taskrc.local --target ~/.taskrc
        "
        return 0
    end

    if set -ql _flag_base
      set BASE $_flag_base
    else
      echo "Base configuration file is required" >&2
      return 1
    end

    if set -ql _flag_local
      set LOCAL $_flag_local
    else
      echo "Local configuration file is required" >&2
      return 1
    end

    if set -ql _flag_target
      set TARGET $_flag_target
    else
      set TARGET ~/.taskrc
    end

    cat $BASE $LOCAL > $TARGET
end
