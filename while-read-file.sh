while read FOOD
#for FOOD in $(cat fav-food.list)
do
  echo "My favorite food is $FOOD"
  wait
done < fav-food.list
