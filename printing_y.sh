#!/bin/bash

array_char=( - 1 )
max_y=5
line_max_char=100
y_needed="$1"
y_line_max=32
start_point=50
a_point=0
b_point=0
diff=0

function first_line {
  fl_num=$((64 / (2 ** y_needed)))
  for (( i=0; i<$fl_num; i++ )); do
    for (( j=0; j<$line_max_char; j++ )); do
      echo -ne ${array_char[0]}
    done
    echo ""
  done
}
function other_line {
  for (( k=$y_needed; k>=0; k-- )); do
    total_line=$((y_line_max / (2 ** k)))
    y_line $total_line
  done
}

function y_line() {
  line_num=$(($1/2))
  y_upper $line_num
  y_lower $line_num
}

function y_upper() {
  for (( l=$1; l>0; l-- ))
    do
    a_point=$((start_point-l))
    b_point=$((start_point+l))
    for (( m=0; m<$line_max_char; m++ )); do
      if [ "$m" == "$a_point" ] || [ "$m" == "$b_point" ]
      then
        echo -ne ${array_char[1]}
      else 
        echo -ne ${array_char[0]}
      fi
    done
    echo ""
  done
}

function y_lower() {
  for (( n=0; n<$1; n++ )); do
    for (( o=0; o<$line_max_char; o++ )); do
      if [[ "$o" == "$start_point" ]]
      then 
        echo -ne ${array_char[1]}
      else 
        echo -ne ${array_char[0]}
      fi
    done
    echo ""
  done
}


if [[ -z $y_needed ]]
then
  echo "Syntax : ./printing_y.n <number less than 5>"
elif [[ $1 -gt $max_y ]]
then
  echo "[ERROR] need less than 5"
else
  first_line
  other_line
fi
