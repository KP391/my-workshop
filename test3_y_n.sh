#!/bin/bash
test1() {
  echo "String is '$1'"
    if [[ "${1,,}" == *'n'* ]] && [[ "${1,,}" == *"y"* ]]; then
      echo -e "There is YES and NO here\n"
    elif [[ $(echo "${1,,}") == *"y"* ]]; then
      echo -e "YES?\n"
    else
      echo -e "nope\n"
    fi
}
#read -p "Enter text : " text

stages() {
  echo -e -n "Stage $1 : "
  case $1 in
    1)
      text="YES and NO"
      test1 "$text"
      ;;
    2)
      text="Yes and no"
      test1 "$text"
      ;;
    3)
      text="yes and No"
      test1 "$text"
      ;;
    4)
      text="There is Yes"
      test1 "$text"
      ;;
    5)
      text="There is yes"
      test1 "$text"
      ;;
    6)
      text="There is NO"
      test1 "$text"
      ;;
    7)
      text="There is no"
      test1 "$text"
      ;;
  esac
}

#main

for i in {1..7}
  do
    stages $i
  done


