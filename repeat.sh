#!/bin/bash
# run a command multiple times with sleep in between


# INIT
{
#default values
delay=10
repetitions=6


function USAGE {
    echo "wrong parameters"
    echo "run the command without any parameter or"
    echo "    -t (time between each repetition in sec)"
    echo "    -n (number of repetitions)"
}


while getopts "t:n:" option; do
    case ${option} in
        t)
            delay="${OPTARG}"
            ;;
        n)
            repetitions="${OPTARG}"
            ;;
        ?)
            USAGE
            exit 1
            ;;
    esac
done
shift $((OPTIND - 1))
}


# MAIN
{
if [[ "$#" -eq 0 ]]; then
    echo "this command doesn't work without giving it anything to repeat"
    exit 1
fi


for ((i = 1; i <= repetitions; i++)); do
    "$@"
    if [[ $i -ne $repetitions ]]; then
        sleep "$delay"
    fi
    echo
done
}

