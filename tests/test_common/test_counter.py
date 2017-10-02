from magma import *
from magma.testing.coroutine import check, coroutine
import os
os.environ["MANTLE"] = "lattice"
from mantle.common import DefineCounter, DefineDownCounter, DefineUpDownCounter


@coroutine
def counter4_sim():
    while True:
        for i in range(0, 1<<4):
            O = i
            yield O


def test_counter():
    Counter4 = DefineCounter(4)

    check(Counter4, counter4_sim(), 1<<4 * 2)

@coroutine
def down_counter4_sim():
    # Counter starts at 0, then counts down
    while True:
        O = 0
        yield O
        for i in range((1<<4) - 1, 0, -1):
            O = i
            yield O


def test_downcounter():
    DownCounter4 = DefineDownCounter(4)

    check(DownCounter4, down_counter4_sim(), 1<<4 * 2)
