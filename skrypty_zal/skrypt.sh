#!/bin/sh


ping -c 1 komixxy.pl > /dev/null || exit 1    #jesli polaczenie jest -> dalsze dzialanie skryptu

cd /tmp
test -d komiks && rm -rf komiks       #sprawdzenie czy dany folder istnieje i ewentualne usuniecie go
mkdir komiks
cd komiks

wget -q http://komixxy.pl/losuj -O komix.html     #pobranie calej strony
egrep bigurl komix.html > adres.txt               #wyciagniecie z kodu strony linijki z wyrazeniem 'bigurl'
cut -b 15-200 adres.txt > adres1.txt              #obciecie poczatku linijki kodu (niestety na "sztywno")

cd ..
cd komiks                 #bez tego pozniejsze polecenie 'tr' nie widzialo plikow

cat adres1.txt | tr "\"" " " > adres.txt      #zamiana ostatniego cudzyslowu na spacje
wget -q -i adres.txt -O komix.jpg       #pobranie konkretnego obrazka dzieki otrzymanemu wyzej linkowi :)

gwenview -f komix.jpg       #otworzenie grafiki przegladarka obrazow (tutaj Gwenview) - nalezy dostosowac do wlasnej dystrybucji
