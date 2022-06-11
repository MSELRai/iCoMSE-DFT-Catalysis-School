#!/bin/bash

# Author: Woodrow N. Wilson
# Date: 6/7/22
# Notes: Analysis for a manual cell optimization for a
# Primitive FCC Unit Cell

cp2kfile=cp2k-PADE.inp
standard_length=2.47897354


lengths=($standard_length 2.1 2.2 2.3 2.4 2.5 2.6 )

echo "Length (Angstrom), Energy (Ha)"
for l in ${lengths[@]}; do
    E=$(grep "ENERGY" simulation/$l/cp2k-PADE.out | tail -1 | awk '{print $9}')
    echo $l , $E
done


