FUNCTIONS=("clique_proposals" "clique_purpose" "admin_addpeer")
#MAIN

while :
do
  clear
  "Current functions are : "
  for i in "${FUNCTIONS[@]}"
  do
    echo "$i"
  done
#  read -p "type in function: " FUNC
#  $FUNC
read
done
