#!/bin/bash
test1() {
  case "$1" in
    *yes*)
      echo "String is '$1'"
      if [[ "$1" == *'no'* ]]; then
        echo "There is YES and NO here"
      else
        echo "YES?"
      fi
      ;;
    *no*)
      if [ "$1" == *"yes"* ]; then
        echo "The answer is no... and yes?"
      else
        echo "nope"
      fi
  esac
}
read -p "Enter text : " text
test1 "$text"
