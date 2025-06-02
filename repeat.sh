#!/bin/bash


# run a command multiple times with sleep in between


function USAGE {
    echo "wrong parameters"
    echo "run the command without any parameter or"
    echo "    -t (time between each repetition in seconds)"
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
