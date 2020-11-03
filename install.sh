CWD=`pwd`
tar -xzvf libevent-*.tar.gz                 # libevent's gziped tar.
cd libevent-*/
./configure --prefix=$HOME/.local --enable-shared
make && make install

cd $CWD

tar -xzvf ncurses.tar.gz                    # ncurses's gziped tar.
cd ncurses-*/
./configure --prefix=$HOME/.local --with-shared --with-termlib --enable-pc-files --with-pkg-config-libdir=$HOME/.local/lib/pkgconfig
make && make install

cd $CWD

tar -xzvf tmux-*.tar.gz                     # tmux's gziped tar.
cd tmux-*/
DIR="$HOME/.local"
./configure CFLAGS="-I$DIR/include" LDFLAGS="-L$DIR/lib"
sed 's/ -lncurses/-lncurses -ltinfo/g' Makefile > Makefile.tmp
mv Makefile Makefile.bak
mv Makefile.tmp Makefile
make
mkdir -p ~/.local/bin
cp tmux ~/.local/bin
echo 'LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/.local/lib' >> ~/.profile
echo 'export LD_LIBRARY_PATH' >> ~/.profile
#echo 'export PATH="$PATH:~/bin"' >> ~/.profile
source ~/.profile
