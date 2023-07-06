#!/bin/bash

Help()
{
   # Display Help
   echo "Run the benchmark in a container."
   echo
   echo "Syntax: run.sh [-i|h]"
   echo "options:"
   echo "h     Print this Help."
   echo "i     The image to run."
   echo
}

CONTAINER="all"

# Get the options
while getopts ":hi:" option; do
    case $option in
        h) # display Help
            Help
            exit;;
        i)
            CONTAINER=$OPTARG;;
        \?) # Invalid option
            echo "Error: Invalid option"
            exit;;
   esac
done

mkdir -p out

if [ $CONTAINER == "all" ]
then
    podman run --rm -ti -v out:/out:z python-benchmark-tw
    for i in Containerfile*
    do
        NAME=${i:14}
        podman run --rm -ti -v out:/out:z python-benchmark-$NAME
    done
else
    podman run --rm -ti -v out:/out:z python-benchmark-$CONTAINER
fi
