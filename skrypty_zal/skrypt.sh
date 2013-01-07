#!/bin/sh

export DISPLAY=:0.0

ping -c 1 komixxy.pl > /dev/null || exit 1

cd /tmp
test -d komiks && rm -rf komiks
mkdir komiks
cd komiks

wget -q http://komixxy.pl/losuj -O komix.html
egrep bigurl komix.html > adres.txt
cut -b 15-200 adres.txt > adres1.txt

cd ..
cd komiks

cat adres1.txt | tr "\"" " " > adres.txt
wget -q -i adres.txt -O komix.jpg

gwenview -f komix.jpg
