import sys
from magma import *
from mantle import *
from shields.megawing import MegaWing

megawing = MegaWing()

megawing.Switch.on(2)
megawing.LED.on(1)

main = megawing.main()
A = main.SWITCH[0:1]
B = main.SWITCH[1:2]
O = main.LED[0]

lt1 = LT(1)

O(lt1(A, B))

compile(sys.argv[1], main)


