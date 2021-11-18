#!/bin/bash


# GABBY  :  Game Helper?
#
# My personal project that will keep tracks on terminal game (Because I'm bad at remembering them)
# What I have in mind and will add later are:
# >> ctrl+c will come back to menu   , only 4th option will leave the program / or type exit (I think I can use trap here)
# >> Add better visual, maybe ASCII art, but I'm not good at that either.
# >> 3rd option will be list of random dialog that will be read randomly by Gabby.
# 

# General information
version="0.0.1"
codename="GABA"

# Colours
RED='\033[0;31m'
GRE='\033[0;32m'
YEL='\033[1;33m'
BLU='\033[1;34m'
NC='\033[0m'

#VAR
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


# functions
#
# Dotsleep function
dotsleep () {
  for ((i=1;i<="$1";i++))
  do
    echo -n ". "
    sleep 1s
  done
  echo -e "\n"
}


#
#
# Greet function
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

function confirmation {
  echo -ne "> confirm? (y/n)\n: "
  read -t 3000 CONFIRM
  if  [[ ${CONFIRM,,} == *'y'* ]] && [[ ${CONFIRM,,} == *'n'* ]]; then
    echo -e "\n $GABBY : Jesus christ... choose one. Please.\n"
    confirmation
  elif [ -z ${CONFIRM,,} ] || [[ ${CONFIRM,,} == *'y'* ]]; then
    echo -e "\n[ confirmed. ]\n"
    CONFIRM="yes"
  else
    CONFIRM="no"
    clear
  fi
}


#
#
# Fancy option function.... (I could've just use if/else to create this..)
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

function exit.arg {
  clear
  echo -e "\n $GABBY: Okay, see you later!"
}

# main

trap exit.arg EXIT
while true; do
  greet
  option
done
