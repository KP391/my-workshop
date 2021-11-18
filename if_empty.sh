echo "test me!"
read -p "put something or nothing here: " input
if [ -z "$input" ]; then
  echo "VAR IS EMPTY"
else
  echo "not empty, your input is : $input"
fi


