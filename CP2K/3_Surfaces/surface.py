from ase.io import read, write
from ase.build import molecule, surface, add_adsorbate, add_vacuum
from ase.visualize import view
import sys

if "--help" in sys.argv or "-h" in sys.argv or len(sys.argv) != 11:
    print("Usage: python3 surface.py unit_cell repeat_x repeat_y thickness midx_a midx_b midx_c vacuum height")
    print("unit_cell: Coordinate file of the Unit Cell to make the surface")
    print("repeat_x(y): Number of times the slab is repeated in the x(y) direction ")
    print("thickness: How thick the slab is in unit cells")
    print("midx_a(b,c): Miller indeces used to cut the unit cell")
    print("vacuum: Amount of vacuum added on both sides of the slab")
    sys.exit()

unit_cell = read(sys.argv[1])

repeat_x = int(sys.argv[2])
repeat_y = int(sys.argv[3])
thickness = int(sys.argv[4])

midx_a =  int(sys.argv[5])
midx_b =  int(sys.argv[6])
midx_c =  int(sys.argv[7])

miller_indices = (midx_a, midx_b, midx_c)

vacuum = float(sys.argv[8])


slab = surface(unit_cell, miller_indices, thickness, vacuum)
system = slab.repeat([repeat_x, repeat_y,1])

view(system)
