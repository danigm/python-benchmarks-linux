#!/bin/bash

Help()
{
   # Display Help
   echo "Build container images. Build all images by default."
   echo
   echo "Syntax: build.sh [-i|h]"
   echo "options:"
   echo "h     Print this Help."
   echo "r     Remove all images."
   echo "i     Build just one image by name."
   echo
}

Rm()
{
    for i in Containerfile*
    do
        NAME=${i:14}
        podman image rm python-benchmark-$NAME
    done
}

CONTAINER="all"

# Get the options
while getopts ":hri:" option; do
    case $option in
        h) # display Help
            Help
            exit;;
        i)
            CONTAINER=$OPTARG;;
        r)
            Rm
            exit;;
        \?) # Invalid option
            echo "Error: Invalid option"
            exit;;
   esac
done

if [ $CONTAINER == "all" ]
then
    for i in Containerfile*
    do
        NAME=${i:14}
        buildah build -f $i -t python-benchmark-$NAME
    done
else
    buildah build -f Containerfile.$CONTAINER -t python-benchmark-$CONTAINER
fi
