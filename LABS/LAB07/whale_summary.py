#!/usr/bin/env python3

import sys

inputs = sys.argv[1:]
pods = {}
whales = {}

for file in inputs:
    with open(file, 'r') as openfile:
        for line in openfile:
            species = str(' '.join(line.split()[2:])).lower()
            species = species.replace("whales", "whale")
            species = species.replace("orcas", "orca")

            num = int(line.split()[1])

            if species not in whales:
                whales[species] = 0
                pods[species] = 0

            whales[species] += num
            pods[species] += 1

sort = sorted(whales.keys())

for whale in sort:
    print(str(whale) + " observations: "
        + str(pods[whale])+ " pods, "
        + str(whales[whale]) + " individuals")
