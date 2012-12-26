External Third-Party Packages for use with Appweb and Ejscript

Build Notes:

For some reason the build from the top with ./Makefile fails on windows in openssl.
However, the following works:
	. ./bashrc ; cd openssl ; make

For debian systems, you need the packages:
apt-get install build-essential curl mercurial libxml2-dev libdb-dev libz-dev libmysqlclient15-dev

NOTE: PHP currently does notsupport VS 2010
