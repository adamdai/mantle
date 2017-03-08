import sys
from magma import *
from parts.xilinx.spartan3.primitives.SRL import SRL32
from shields.megawing import MegaWing

megawing = MegaWing()
megawing.Clock.on()
megawing.Switch.on(6)
megawing.LED.on(1)

main = megawing.main()
A = main.SWITCH[0:5]
I = main.SWITCH[5]
O = main.LED[0]

srl = SRL32(init=1)
O( srl( A, I ) )

compile(sys.argv[1], main)


