#!/bin/bash

# GABBY  :  Game Helper?
#
# My personal project that will keep tracks on terminal game (Because I'm bad at remembering them)
# What I have in mind and will add later are:
# >> ctrl+c will come back to menu   , only 4th option will leave the program / or type exit (I think I can use trap here)
# >> Add better visual, maybe ASCII art, but I'm not good at that either.
# >> 3rd option will be list of random dialog that will be read randomly by Gabby.

# Template
function e_status {
   cat <<- EOF
  
  current status   : $E_STATUS
          version  : $e_version
          codename : $e_codename

EOF
}
#
# Current status : Not working

# General information
e_version="0.0.2.1"
e_codename="StealthArcher"

# Colours
RED='\033[0;31m'
GRE='\033[0;32m'
YEL='\033[1;33m'
BLU='\033[1;34m'
NC='\033[0m'

#VAR
e_work=${GRE}working!${NC}
e_work_not=${RED}not working!${NC}

E_STATUS=$e_work_not
BOX_TOP="+--------------------------------------------------+"
LIST_TITLE="| MY GAME LIST                                     |"
LIST_FILE=".play_game.list"
CREATOR="${RED}K${NC}${BLU}P${NC}${GRE}3${NC}${YEL}9${NC}1"
GABBY='\033[1;94mGabby\033[0;39m'
GREET=("Welcome to $CREATOR 's play script! How may I be of service?"
 "Welcome back to $CREATOR 's play script! How may I be of service?"
 "Welcome back to $CREATOR 's play script! Anything else you would like to do?"
 "Welcome back! Anything else you would like to do?"
 "...")
# May move these ^ options into file later, so it can be longer & not cluttered overal code & easier to modify.
G_COUNT=0
X_COUNT=0

# List of options
OPTS1=("View my game list" "Add new game to the list"
 "Talk"
 "[exit]")
PS3='Select option: '
CONFIRM=""

#
# functions
#
# Dotsleep function
dotsleep () {
  for ((i=1;i<="$1";i++))
  do
    echo -n ". "
    sleep 1
  done
  echo -e "\n"
}

#
# ERror call
#

err_call() {
  local __ERROR=("err_option", "err_confirm")

}

#
# Greet function
#

function greet {
  G_COUNT=$((G_COUNT+1))
  X_COUNT=$((X_COUNT+1))
  #echo -e "X_COUNT is $X_COUNT"
  if [ "$X_COUNT" -gt '4' ]; then
    G_COUNT='4'
  fi
  echo -e "\n $GABBY : ${GREET[G_COUNT]}\n"
  if [ "$X_COUNT" -eq '10' ]; then
    echo -e " $GABBY : Why are you still here? lol\n"
  fi
}

function gabby_say() {
  echo -e "\n $GABBY : ${@}\n"
}

function confirmation { # If function results in an error, it maybe because your BASH version is old (fixed)
  echo -ne "> confirm? (y/n)\n: "
  read -t 3000 CONFIRM
  local score="0"
  if [[ $(tr '[A-Z]' '[a-z]' <<< $CONFIRM) == *'y'* ]]
  then
    score=$((score+1))
  fi
  if [[ $(tr '[A-Z]' '[a-z]' <<< $CONFIRM) == *'n'* ]]
  then
    score=$((score+2))
  fi
  if (( ${score} == '3' )); then
    echo -e "\n $GABBY : Jesus christ... choose one. Please.\n"
    confirmation
  elif (( ${score} == '1' )); then
    echo -e "\n[ confirmed. ]\n"
    CONFIRM="yes"
  elif (( ${score} == '2' )); then
    gabby_say "What the ${RED}hell${NC} man?"
    dotsleep 3
    gabby_say "LOL I'm just messing with you!"
    CONFIRM="no"
  else
    echo -e "\n $GABBY : ${RED} !ERROR! !ERROR!${NC}"
    clear
  fi
}


#
# Fancy option function.... (I could've just use if/else to create this..)
#
function option {
  select i in "${OPTS1[@]}"; do
    case $i in
    "View my game list" )
        confirmation
        if [ "$CONFIRM" == "yes" ]; then
	  echo -n "Listing game"
          dotsleep 3
          LIST_GAME
        fi
	break
	;;
    "Add new game to the list" )
        confirmation
        if [ "$CONFIRM" == "yes" ]; then
	  echo "This is option2"
          echo "This is option222"
	  read
        fi
	break
        ;;
    "Talk" )
        confirmation
        if [ "$CONFIRM" == "yes" ]; then
	  echo "This is option3"
	  read
        fi
        break
        ;;
    "[exit]" )
        confirmation
	if [ "$CONFIRM" == "yes" ]; then
	  echo "This is option4"
	  read
        fi
	break
        ;;
    * )
        break
        ;;
    esac
  done
}

function LIST_GAME {
  if [ -z $(ls | find "$LIST_FILE") ]; then
    touch "$LIST_FILE"
    echo -e " $GABBY : $LIST_FILE created."
  fi
  if [ -z $(cat $LIST_FILE) ]; then
    echo -e " $GABBY : ${RED}! ERROR! ${NC} game list empty!"
  else
    echo -e "$BOX_TOP\n$LIST_TITLE\n$BOX_TOP"
    for GAMES in $(cat $LIST_FILE)
      do
        echo -e "| $GAMES"
      done
    echo "$BOX_TOP"
  fi
}


function EXIT_ARGS {
  #clear
  echo -e "\n $GABBY: Okay, see you later!"
}

# main

trap EXIT_ARGS EXIT

main {
  if [ ! "$@" -z ]; then
    read_in
  else
    while true; do
      greet
      option
    done
  fi
}
