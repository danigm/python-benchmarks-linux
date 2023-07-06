#!/bin/bash

$PYTHON=$1
$OUT=$2

# Fash performance
pyperformance run --python=/usr/bin/$PYTHON -o /out/$OUT.json -f

# Rigorous
# pyperformance run --python=/usr/bin/$PYTHON -o /out/$OUT.json -r
