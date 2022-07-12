#!/usr/bin/env bash

ANS=""
function debug {
  echo "number is" $number
  echo "fac_num is" $fac_num
  echo "rain_sfx is" $rain_sfx
}

function fac() {
  number="$2"
  fac_num="$1"
  rain_sfx=""
  case $1 in
    3)
      rain_sfx="Pling"
      ;;
    5)
      rain_sfx="Plang"
      ;;
    7)
      rain_sfx="Plong"
      ;;
    *)
      echo "Error: please use number 3, 5 or 7"
      exit 2
      ;;
  esac
  #debug
  if [[ $((number%fac_num)) -eq 0 ]]; then
    ANS+="$rain_sfx"
  fi
}

function raindrop_ASMR() {
  num="$1"
  fac 3 "$num"
  fac 5 "$num"
  fac 7 "$num"
  if [ ${#ANS} -gt 0 ]; then
    echo $ANS
  else
    echo "$num"
  fi
}

function main {
  raindrop_ASMR "$@"
}

#
# MAIN
#

main "$@"
