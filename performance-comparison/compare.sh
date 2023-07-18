#!/bin/bash

pyperf compare_to --table --table-format md bci154-3.10.json bci155-3.11.json > bci-table.txt
pyperf compare_to --table --table-format md tw-3.10.json tw-3.11.json > tw-table.txt
pyperf compare_to --table --table-format md rocky9-3.11.json bci155-3.11.json > rocky-table.txt
pyperf compare_to --table --table-format md ubuntu2204-3.11.json bci155-3.11.json > ubuntu-table.txt
pyperf compare_to --table --table-format md ubuntu2204-3.11.json tw-3.11.json > ubuntu-tw-table.txt
pyperf compare_to --table --table-format md bci155-3.11.json tw-3.11.json > bci-tw-table.txt
pyperf compare_to --table --table-format md rocky9-3.11.json tw-3.11.json > rocky-tw-table.txt
