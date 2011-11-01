#!/usr/bin/env python

try:
    import json
except ImportError:
    import simplejson as json
import sys


if len(sys.argv) == 2:
    with open(sys.argv[1]) as f:
        data = json.load(f)
else:
    data = json.load(sys.stdin)

print json.dumps(data, sort_keys=True, indent=4)
