# Zadania

Lab. 2

zad2. Wyświetl na ekran 4 ostatnie wiersze pliku *program.c*:

```sh
tail -n 4 program.c
```

Laboratorium 3.

Zad. 7. Kazde slowo pliku wyswietlane w osobnej linii

```sh
cat plik.txt | tr " " "\n"
```

Zad 8. Zlicz wszystkie pliki znajdujące się w katalogu /etc i jego podkatalogach.

```sh
find etc -type f -follow | wc -l
```

Zad. 9 Zlicz ilosc znakow z 3 pierwszych lini pliku /etc/passwd
```sh
cat /etc/passwd/ | head -n 3 | wc -m
```