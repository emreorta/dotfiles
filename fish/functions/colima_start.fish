function colima_start -d "Start colima with a custom resource config"
    argparse h/help c/cpu m/memory d/disk -- $argv

    if set -ql _flag_help
        echo "Usage: colima_start [-h|--help] [-c|--cpu] [-m|--memory] [-d|--disk]

        Start colima with a custom resource config with defaults.

        It defaults to `colima start --cpu 8 --memory 16 --disk 120` with MacOS specific
        defaults, and allows passing different configuration for CPU, memory, and disk.

        Options:
          -h, --help            Show this help message and exit.
          -c, --cpu INTEGER     Amount of CPU cores to allocate (default: 8).
          -m, --memory INTEGER  Amount of memory to allocate (default: 16)
          -d, --disk INTEGER    Amount of disk size to allocate (default: 120).
        "
        return 0
    end

    if -set -ql _flag_cpu
        set cpu $argv[1]
    else
        set cpu 8
    end

    if -set -ql _flag_memory
        set memory $argv[1]
    else
        set memory 16
    end

    if -set -ql _flag_disk
        set disk $argv[1]
    else
        set disk 120
    end

    colima start --arch aarch64 --vm-type=vz --vz-rosetta --cpu $cpu --memory $memory --disk $disk
end
