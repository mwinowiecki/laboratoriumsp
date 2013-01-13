#!/bin/sh

#Wszystkie szczegoly dzialania progamu znajdziesz w /home/$USER/.komix.log

function pomoc
{
  echo -e "Program wyswietla losowy komiks z serwisu komixxy.pl\n"
  echo "Skladnia:  ./komix.sh     lub"
  echo "		./komix.sh OPCJA"
  echo -e "\nDostepne opcje:\n\n	-a	Wyswietla informacje o autorze"
  echo -e "\n	-h	Wyswietla pomoc i liste opcji"
  echo -e "\n	-v	Wyswietla informacje o wersji programu"
  echo -e "\n\nWszelkie informacje o kolejnych etapach dzialania programu jak i "
  echo "ewentualnych bledach znajdziesz w swoim katalogu, a dokladniej w /home/$USER/.komix.log"
  exit
}

#################################################

function wer
{
  echo "Wersja 1.0.0"
  exit
}

#################################################

function autor
{
  echo "Autorem tego skryptu jest Marcin Winowiecki"
  echo -e "\nWszelkie sugesie mozna zglaszac na www.github.com/mwinowiecki"
  exit
}

#################################################
#################################################

function blad
{
  echo "BLAD SIECI"
  echo "Wiecej informacji w /home/$USER/.komix.log"
  exit 1
}

#################################################

function spr_pol
{
  ping -c 1 komixxy.pl > /home/$USER/.komix.log 2>&1 || blad    #jesli polaczenie jest -> dalsze dzialanie skryptu
}

#################################################

function pobierz
{
  pushd /tmp >> /home/$USER/.komix.log 2>&1
  test -d komiks && rm -rf komiks       			#sprawdzenie czy dany folder istnieje i ewentualne usuniecie go
  mkdir komiks
  pushd komiks >> /home/$USER/.komix.log 2>&1

  wget http://komixxy.pl/losuj -O komix.html >> /home/$USER/.komix.log 2>&1   	#pobranie calej strony
  egrep bigurl komix.html > adres.txt  	#wyciagniecie z kodu strony linijki z wyrazeniem 'bigurl'
  cut -b 15-200 adres.txt > adres1.txt	#obciecie poczatku linijki kodu (niestety na "sztywno")
  cut -b 15-200 adres.txt >> /home/$USER/.komix.log 2>&1

  popd >> /home/$USER/.komix.log 2>&1
  pushd komiks >> /home/$USER/.komix.log 2>&1                #bez tego pozniejsze polecenie 'tr' nie widzialo plikow

  cat adres1.txt | tr "\"" " " > adres2.txt      #zamiana ostatniego cudzyslowu na spacje
  cat adres1.txt | tr "\"" " " >> /home/$USER/.komix.log 2>&1
  wget -i adres2.txt -O komix.jpg >> /home/$USER/.komix.log 2>&1	#pobranie
			# konkretnego obrazka dzieki otrzymanemu wyzej   linkowi :)
}

################################################# 

function wyswietl
{
  gwenview -f komix.jpg >> /home/$USER/.komix.log 2>&1       #otworzenie grafiki przegladarka obrazow (tutaj Gwenview) - nalezy dostosowac do wlasnej dystrybucji
  echo "Jesli cos poszlo nie tak, zajrzyj do /home/$USER/.komix.log"
}

#################################################

function komiks
{
  sleep 4
  spr_pol
  pobierz
  wyswietl
}

#################################################

while getopts ":a :h :v" opt 
do
	case "$opt"
	in
	h) pomoc >&2 ; exit;;
	v) wer >&2 ; exit;;
	a) autor >&2 ; exit;;
	\?) echo "Invalid option: -$OPTARG" >&2 ; exit;;
	esac
done

trap komiks EXIT >> /home/$USER/.komix.log 2>&1
