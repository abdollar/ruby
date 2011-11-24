make clean
find . -name "*.o" -exec rm {} \;
./configure-iphone 5.0 -t os -- --host=arm-apple-darwin9 --target=arm-apple-darwin9 --with-static-linked-ext --disable-pthread --disable-ipv6
make
find . -name "*.o" | xargs ar -r libruby-static.a
mv libruby-static.a libruby-static-device.a
#lipo -create libruby-static-device.a ext/extinit.o ext/openssl/openssl.a ext/socket/socket.a ext/zlib/zlib.a ext/bigdecimal/bigdecimal.a ext/curses/curses.a ext/dbm/dbm.a ext/digest/digest.a ext/digest/bubblebabble/bubblebabble.a ext/digest/md5/md5.a ext/digest/rmd160/rmd160.a ext/digest/sha1/sha1.a ext/dl/dl.a ext/etc/etc.a ext/fcntl/fcntl.a ext/iconv/iconv.a ext/io/wait/wait.a ext/nkf/nkf.a ext/pty/pty.a ext/racc/cparse/cparse.a ext/readline/readline.a ext/sdbm/sdbm.a ext/stringio/stringio.a ext/strscan/strscan.a ext/syck/syck.a ext/syslog/syslog.a ext/thread/thread.a -output libruby-static-device.a

make clean
find . -name "*.o" -exec rm {} \;
./configure-iphone 5.0 -- --host=i386-apple-darwin --target=i386-apple-darwin --with-static-linked-ext --disable-pthread
make
find . -name "*.o" | xargs ar -r libruby-static.a
mv libruby-static.a libruby-static-simulator.a
#lipo -create libruby-static-simulator.a ext/extinit.o ext/openssl/openssl.a ext/socket/socket.a ext/zlib/zlib.a ext/bigdecimal/bigdecimal.a ext/curses/curses.a ext/dbm/dbm.a ext/digest/digest.a ext/digest/bubblebabble/bubblebabble.a ext/digest/md5/md5.a ext/digest/rmd160/rmd160.a ext/digest/sha1/sha1.a ext/dl/dl.a ext/etc/etc.a ext/fcntl/fcntl.a ext/iconv/iconv.a ext/io/wait/wait.a ext/nkf/nkf.a ext/pty/pty.a ext/racc/cparse/cparse.a ext/readline/readline.a ext/sdbm/sdbm.a ext/stringio/stringio.a ext/strscan/strscan.a ext/syck/syck.a ext/syslog/syslog.a ext/thread/thread.a -output libruby-static-simulator.a

lipo -create -arch armv7 libruby-static-device.a -arch i386 libruby-static-simulator.a -output libruby-static.a
