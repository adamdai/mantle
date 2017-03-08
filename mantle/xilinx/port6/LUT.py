from collections import Sequence
from magma import *
from magma.compatibility import IntegerTypes

from parts.xilinx.spartan6.primitives.CLB import \
    _LUT1, _LUT2, _LUT3, _LUT4, _LUT5, _LUT6, \
    MUXF7, MUXF8

__all__  = ['LUT1', 'LUT2', 'LUT3', 'LUT4']
__all__ += ['LUT5', 'LUT6', 'LUT7', 'LUT8']
__all__ += ['LUTN', 'LUT']
__all__ += ['Logic1', 'Logic2', 'Logic3', 'Logic4']
__all__ += ['Logic5', 'Logic6', 'Logic7', 'Logic8']

def LUT1(rom, **kwargs):
    return _LUT1(INIT=lutinit(rom,1<<1), **kwargs)

def LUT2(rom, **kwargs):
    return _LUT2(INIT=lutinit(rom,1<<2), **kwargs)

def LUT3(rom, **kwargs):
    return _LUT3(INIT=lutinit(rom,1<<3), **kwargs)

def LUT4(rom, **kwargs):
    return _LUT4(INIT=lutinit(rom,1<<4), **kwargs)

def LUT5(rom, **kwargs):
    return _LUT5(INIT=lutinit(rom,1<<5), **kwargs)

def LUT6(rom, **kwargs):
    return _LUT6(INIT=lutinit(rom,1<<6), **kwargs)

def LUT7(rom, **kwargs):
    if isinstance(rom, IntegerTypes):
        rom = int2seq(rom, 128)
    I = In(Array7)()
    # need to convert rom to a sequence
    lut0 = LUT6(rom[ 0: 64])
    lut1 = LUT6(rom[64:128])
    lut = fork(lut0, lut1)
    lut(I[0], I[1], I[2], I[3], I[4], I[5])
    mux = MUXF7()
    mux(lut.O[0], lut.O[1], I[6])
    return AnonymousCircuit("I0", I[0], 
                   "I1", I[1], 
                   "I2", I[2], 
                   "I3", I[3], 
                   "I4", I[4], 
                   "I5", I[5], 
                   "I6", I[6], 
                   "O", mux.O)

def LUT8(rom, **kwargs):
    if isinstance(rom, IntegerTypes):
        rom = int2seq(rom, 256)
    I = In(Array8)()
    # need to convert rom to a sequence
    lut0 = LUT7(rom[  0:128])
    lut1 = LUT7(rom[128:256])
    lut = fork(lut0, lut1)
    lut(I[0], I[1], I[2], I[3], I[4], I[5], I[6])
    mux = MUXF8()
    mux(lut.O[0], lut.O[1], I[7])
    return AnonymousCircuit("I0", I[0], 
                   "I1", I[1], 
                   "I2", I[2], 
                   "I3", I[3], 
                   "I4", I[4], 
                   "I5", I[5], 
                   "I6", I[6], 
                   "I7", I[7], 
                   "O", mux.O)


def LUTN(rom, n=None, **kwargs):
    """
    n-bit LUT

    I[n] -> n
    """

    # rom must be a sequence
    if isinstance(rom, Sequence):
        assert n is None
        n = len(rom)
    else:
        n = 1 << n

    if n == 2:
        return LUT1(rom, **kwargs)
    if n == 4:
        return LUT2(rom, **kwargs)
    if n == 8:
        return LUT3(rom, **kwargs)
    if n == 16:
        return LUT4(rom, **kwargs)
    if n == 32:
        return LUT5(rom, **kwargs)
    if n == 64:
        return LUT6(rom, **kwargs)
    if n == 128:
        return LUT7(rom, **kwargs)
    if n == 256:
        return LUT8(rom, **kwargs)

    return None

def LUT(rom, **kwargs):
    """
    n-bit LUT

    I[n] -> n
    """
    return LUTN(rom, **kwargs)


Logic1 = LUT1
Logic2 = LUT2
Logic3 = LUT3
Logic4 = LUT4
Logic5 = LUT5
Logic6 = LUT6
Logic7 = LUT7
Logic8 = LUT8

