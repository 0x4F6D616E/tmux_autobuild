# tmux_autobuild
Build tmux on CTF machines with non-superuser permissions ASAP.

It's tedious to have multiple shells connecting from your target. This is script just to automate the installation of tmux on CTF machines without having root access.

To install, open a web server from your machine on the `packages` folder:
```
python3 -m http.server 9999
```

Download the packages from the target machine:
```
target@ctf ~/tmp/ $ for package in "libevent-2.1.12-stable.tar.gz" "ncurses.tar.gz" "tmux-3.1c.tar.gz"; do wget http://10.
10.14.2:9999/$package ; done
```


Move install.sh and put it on the same directory which those packages are in so that the directory looks like:

```
target@ctf ~/tmp/ $ ls
install.sh  libevent-2.1.12-stable.tar.gz  ncurses.tar.gz  tmux-3.1c.tar.gz
```

Launch install:
```
target@ctf ~/tmp/ $ bash install.sh
```

Once it's done without errors, tmux should be installed on `~/.local/bin`.
