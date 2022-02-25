#!/bin/bash

# Colours
RED='\033[0;31m'
GRE='\033[0;32m'
YEL='\033[1;33m'
BLU='\033[1;34m'
NC='\033[0m'

# define string
var="This string is printing one by one"

#for loop to echo
function printer() {
  var=$@
  for (( i=0; i<${#var}; i++ )); do
    if [ $i -eq $((${#var}-1)) ]; then
      echo -e "${var:$i:1}${NC}"
      sleep 0.5
    else
    echo -ne "${var:$i:1}${NC}"
    # ${#foo} expands to the length of foo. ${foo:$i:1} expands to the substring starting at position $i of length 1
    sleep 0.5
    fi
  done
}

function main() {
  echo -e "|  Welcome to KP391's echo script! \n| Please enter a string. (if empty will print default value)"
  read -p " > " bvar
  if [ -n "$bvar"  ]; then
    #echo "Value not empty!"
    printer $bvar
  else
    printer $var
  fi
}
#printer $var
# Main
text="$@"
if[ "$@" -z ] {
  then
  main
} else {
  printer $@
}


# Explaination from @chepner in https://stackoverflow.com/questions/10551981/how-to-perform-a-for-loop-on-each-character-in-a-string-in-bash
