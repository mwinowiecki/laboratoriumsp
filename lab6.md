Zad. 1
```sh
grep . plik.txt
```

Zad. 2
```sh
grep ^[0-9] pl*
```
lub
```sh
egrep ^[[:digit:]] pl*
```

Zad. 3
```sh
grep -E ^.{8}r *
```
Tego wyrażenia nie trzeba umieszczać w apostrofach.

Zad. 4
```sh
grep -c bash /etc/passwd
```
Jest dobrze, ale jezeli zrobimy sobie pod górkę to:
```sh
grep -c /bash$ /etc/passwd
```

Zad. 5
dziala czesciowo
```sh
egrep -iw [IVXLCDM]+ plik.txt
```
