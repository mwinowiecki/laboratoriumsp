Zad. 1
``sh
find ~/ -maxdepth 1 -mtime -10
```

Zad. 2
``sh
find  / -name \*config\* -type f 2> /dev/null
```

Zad. 3
``sh
find ~/ -atime 20
```

Zad. 4
``sh
find /etc \( -type f -and -name a* \) -or \( -type d -and ! -empty \) 2> /dev/null
```

Zad. 5
``sh
mkdir date +%Y-%m-%d
```
