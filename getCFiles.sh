#!/bin/bash

# Gets all of the c files in an array
rm -f cfiles.txt
readarray -d '' c_array < <(find * -name "*.c" -print0 )

for file in ${c_array[@]}; do
  echo $file >> cfiles.txt
done