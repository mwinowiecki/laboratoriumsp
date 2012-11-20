Zad. 1
```sh
find . -maxdepth 1 -mtime -10 -type f
```
//maxdepth musi byc na poczatku

Zad. 2
```sh
find  /etc -name \*config\* -type f 2> /dev/null
```

Zad. 3
```sh
find ~/ \( -type d -name ".git" -prune \) -o \( -type f -print \) 
```
// praktyczniejsza wersja z mtime(modify time)

albo

```sh
find . -path '*/.git/*' -prune -o -print
```

albo

```sh
find -mtime -20 | egrep -v '\.git'
```

albo

```sh
find . -not -iwholename '*/.git/*'
```

albo

```sh
find . ! -regex ".*/\.git/.*"
```

Zad. 4
```sh
find /etc \( -type f -and -name a* \) -or \( -type d -and ! -empty \) 2> /dev/null
```

Zad. 5
```sh
rm x??
```

Zad. 6
```sh
mkdir date +%Y-%m-%d
```
