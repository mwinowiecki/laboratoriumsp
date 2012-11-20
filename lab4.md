Zad. 1
```sh
ls | tr a-z A-Z
```

Zad. 2
```sh
ls -l | cut -b 1-10,33-37,51-
```

Zad. 3
```sh
ls -lS
```

Zad. 4
```sh
cat /etc/passwd | sort -r --field-separator=":" -n -k 3
```

Zad. 5
```sh
cat /etc/passwd | sort -r --field-separator=":" -n -k 4,3
```

Zad. 6
```sh
find /katalog -printf "%u\n" 2> /dev/null | sort | uniq -c
```

Zad. 7
```sh
find -printf "%m\n" | sort | uniq -c
```