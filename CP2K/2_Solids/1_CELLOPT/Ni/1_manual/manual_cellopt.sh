#!/bin/bash

# Author: Woodrow N. Wilson
# Date: 6/7/22
# Notes: Performs a manual cell optimization for a
# Primitive FCC Unit Cell

cp2kfile=cp2k-PADE.inp
standard_length=2.47897354


lengths=($standard_length 2.1 2.2 2.3 2.4 2.5 2.6 )

echo "Start: $(date)"
for l in ${lengths[@]}; do
    echo "SPE with Lattice Length: $l Angstrom"
    mkdir -p simulation/$l
    cp cp2k-PADE.inp simulation/$l
    cd simulation/$l
    sed -i "s/$standard_length/$l/g" cp2k-PADE.inp
    cp2k.ssmp -i cp2k-PADE.inp -o cp2k-PADE.out
    cd ../..

done
echo "End: $(date)"
