#!/usr/bin/env python
"""
lcalc.py is a line oriented calculator

Usage:
    lcalc.py <+-/*> < input
"""

from __future__ import division
import argparse
import sys

parser = argparse.ArgumentParser()
parser.add_argument('operator', nargs=1, choices=['+', '-', '*', '/'],
                    help='Operator for input.')

args = parser.parse_args()

operator_map = {
    '+': lambda lhs, rhs: lhs + rhs,
    '-': lambda lhs, rhs: lhs - rhs,
    '*': lambda lhs, rhs: lhs * rhs,
    '/': lambda lhs, rhs: lhs / rhs
}

def num(s):
    try:
        return int(s)
    except ValueError:
        return float(s)

try:
    operands = [num(line.strip()) for line in sys.stdin]
except ValueError, e:
    sys.stderr.write("Problem parsing input. %s\n" % e) 
    sys.exit(-1)

print reduce(operator_map[args.operator[0]], operands)
