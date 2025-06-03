#!/bin/bash
# run a command multiple times with sleep in between


#default values
timeout=5
repetitions=6


function USAGE {
    echo "wrong parameters"
    echo "run the command without any parameter or"
    echo "    -t (time between each repetition in sec" 
    echo "    -n (number of repetitions)"
}


arguments_number=0

while getopts "t:n:" option; do
    case ${option} in
        t)
            timeout="${OPTARG}"
            arguments_number=$((arguments_number + 2))
            ;;
        n)
            repetitions="${OPTARG}"
            arguments_number=$((arguments_number + 2))
            ;;
        ?)
            USAGE
            exit 1
            ;;
    esac
done

((arguments_number + 1))

echo "time: $timeout repeat: $repetitions"

echo "argument number: $arguments_number"; echo

for ((i = 1; i <= repetitions; i++)); do
    echo "optind: $OPTIND"
    echo "dolar hvezda: $*"
    echo "dolar at: $@"
    only_command=$("$* | cut -d ' ' -f $arguments_number-") 
    echo $only_command
    sleep "$timeout"
    echo
done
