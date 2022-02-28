#!/bin/bash

# This script will set default argument if not set using :- operator
# got from https://stackoverflow.com/questions/61387798/bash-if-else-statement-inside-one-line-command
def_guy="[Default Name]"

echo -e "This script will greet person name; if not set will use default name (without using if/else statement)\n"
sleep 3s
echo -e "Syntax : ./<script> <input name>\n"
sleep 3s
echo -e "Hello! ${1:-$def_guy}"
