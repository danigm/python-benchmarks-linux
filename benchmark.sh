#!/bin/bash

OUT=$IMAGE-$PYTHON_VERSION

# Fash performance
pyperformance run --python=/usr/bin/$PYTHON -o /out/$OUT.json -f

# Rigorous
# pyperformance run --python=/usr/bin/$PYTHON -o /out/$OUT.json -r
