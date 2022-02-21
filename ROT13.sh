#!/bin/bash
function encrypt() {

# Map  upper case A-Z to N-ZA-M and lover case a-z to n-za-m
echo -ne "Encrypted : \n"
tr 'A-Za-z' 'N-ZA-Mn-za-m' <<< "$1"
echo ""
}

# Map  upper case A-Z to N-ZA-M and lower case
function decrypt() {
echo -ne "Decrypted : \n"
tr 'N-ZA-Mn-za-m' 'A-Za-z' <<< "$1"
echo ""
#echo "$i" | tr 'N-ZA-Mn-za-m' 'A-Za-z'
}
trap
function main {
  #echo "Welcome to R0T13!"
  echo  -e "\n[List]"
  PS3="Select action: "
  OPTS=("Encryption" "Decryption")
  select u in "${OPTS[@]}"; do
    case $u in
    Encryption )
          read -p "Encrypt passage : " text1
          encrypt "$text1"
  	  break
          ;;
    Decryption )
          read -p "Decrypt message : " text2
          decrypt "$text2"
  	  break
          ;;
    esac
  done
}

echo -e "\nWelcome to ROT13!"

while true
do
  main
done
