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


while getopts "t:n:" option; do
    case ${option} in
        t)
            timeout="${OPTARG}"
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


echo "time: $timeout repeat: $repetitions"

echo "$final_range"; echo

for ((i = 1; i <= $repetitions; i++)); do
    echo $OPTIND
    "$@"
    sleep "$timeout"
done