#!/bin/bash
number=$1

divisible_by () {
  if [[ $(($number % $1)) == 0 ]]; then
    return 0 # He seems to use return 0 and return 1 to use with $$? Interesting.
  else
    return 1
  fi
}

sound=""

divisible_by 3 && sound+=Pling # go to function divisible_by and then, depends on return number, append Pling
divisible_by 5 && sound+=Plang
divisible_by 7 && sound+=Plong

[[ -z $sound ]] && sound+=$number

echo $sound

# Solution by patbl >> https://exercism.org/profiles/patbl
