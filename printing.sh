#!/bin/bash

array_char=( - . / )
start_num=0
max_line=$1
char_pos="$max_line"
function line {
  for ((j=0; j<$max_line; j++))
  do
    char_pos=$((max_line-j))
    for (( i=0; i<=$max_line; i++ ))
    do
      if [[ $i -lt $char_pos ]]
      then
        echo -ne ${array_char[0]}
      else
        echo -ne ${array_char[1]}
      fi
    done
    echo ""
  done
}

if [ $1 -z ]; then
  echo "Syntax error! number argument expected. (syntax:  printing <number>)"
else
  line
fi
