PS3="Select a day (1-4): "
OPTIONS=("mon" "tue" "wed" "exit")
select i in "${OPTIONS[@]}"
do
  case $i in
    mon) echo "Monday";;
    tue) echo "Tuesday";;
    wed) echo "Wednesday";;
    exit) exit;;
  esac
done
