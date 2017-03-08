from magma import *
from parts.xilinx.spartan3.primitives.CLB import *
from mantle.xilinx.port3.flatcascade import FlatCascade
from mantle.xilinx.port3.ROM import ROMN

__all__  = ['Decode']

def Decode(i, n, invert=False):
    """
    Decode the n-bit number i.

    @return: 1 if the n-bit input equals i
    """

    if n <= 8:
        i = 1 << i
        if invert:
            m = 1 << n
            mask = (1 << m) - 1
            i = mask & (~i)
        return ROMN(i, n)
    else:
        m = (n + LUTS_PER_LOGICBLOCK-1) / LUTS_PER_LOGICBLOCK
        data = m * [0]
        for j in range(m):
            data[j] = 1 << (i & 0xf)
            i = i >> 4
        return FlatCascade(n, 4, data, 0, 0, 1)

