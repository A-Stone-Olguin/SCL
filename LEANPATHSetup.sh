#!/bin/bash

lakePackageArray=("aesop" "cryptolib4" "mathlib" "proofwidgets" "Qq" "std")

for i in ${!lakePackageArray[@]}; do
  LEAN_PATHArray[$i]="$PWD/lake-packages/${lakePackageArray[$i]}/build/lib/"
done
LEAN_PATHArray[6]="$PWD/build/lib/"

for str in ${LEAN_PATHArray[@]}; do
  export LEAN_PATH="$str:$LEAN_PATH"
done
echo $LEAN_PATH