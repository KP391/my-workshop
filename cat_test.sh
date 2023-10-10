#!/bin/bash
# I have no idea what's this for, I'll fix it tho.

trap "rm -v .tempfile" EXIT

echo "test" > .tempfile
( echo "This is a"; cat .tempfile; echo " for cat" ) | less
