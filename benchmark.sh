#!/bin/bash

$PYTHON=$1
$OUT=$2

pyperformance run --python=/usr/bin/$PYTHON -o /out/$OUT.json
