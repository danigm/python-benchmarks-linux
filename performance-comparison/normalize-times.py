#!/usr/bin/env python3

import sys
import re

sec = re.compile("((\d+(.\d+)?) sec)")
ms = re.compile("((\d+(.\d+)?) ms)")
us = re.compile("((\d+(.\d+)?) us)")
ns = re.compile("((\d+(.\d+)?) ns)")


with open(sys.argv[1]) as f:
    for line in f.readlines():
        for torep, n, _ in sec.findall(line):
            n = float(n)
            n = round(n * 1000.0, 20)
            line = line.replace(torep, f"{n} ms")

        for torep, n, _ in us.findall(line):
            n = float(n)
            n = round(n / 1_000.0, 20)
            line = line.replace(torep, f"{n} ms")

        for torep, n, _ in ns.findall(line):
            n = float(n)
            n = round(n / 1_000_000.0, 20)
            line = line.replace(torep, f"{n} ms")

        print(line, end="")
