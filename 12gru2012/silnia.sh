#!/bin/bash

error()
{
echo "Error: Podales zla liczbe !!! Podaj liczbe naturalna dodatnia,"
echo "wywolujac skrypt tak: ./silnia liczba"
}

silnia ()
{

if [ $liczba -lt 0 ]
then
error
else
n=1;
while [ $liczba -ne 0 ]
do
let "n *= liczba"
let "liczba -= 1"
done
echo "$1! = $n"
fi
}

liczba=$1
silnia $liczba
exit 0