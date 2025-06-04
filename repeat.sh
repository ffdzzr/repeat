#!/bin/bash
# run a command multiple times with sleep in between


#default values
delay=5
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
            delay="${OPTARG}"
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


for ((i = 1; i <= repetitions; i++)); do
    if [[ $arguments_number -gt 0 ]]; then
        only_command=$(echo "$@" | cut -d ' ' -f $arguments_number-)
        $only_command
    else
        "$@"
    fi
    if [[ $i -ne $repetitions ]]; then    
        sleep "$delay"
    fi
    echo
done