#!/bin/bash


# Global Vars
mem_max=""
mem_percent=""

function check_mem() {
 local __mem_percent=`free | grep Mem | awk '{print $3/$2 * 100.0}'`
 eval $__mem_percent="'$mem_percent'"
}

function run_this() {
  # Run if memory exceeded threshold
  echo "Memory is at ${@}%!"
}

function run_that {
  echo "Memory is fine"
}

function main {
  if(( "$mem_percent" > "$mem_max" )); then
    run_this $mem_percent
  else
    run_that
  fi
}

main
