#
#	Makefile for PHP
#

BLD_OS      := $(shell ../getos)
BLD_ARCH    := $(shell ../getarch)
LATEST	    := php-5.4.10
OPTIONS		:= 	--disable-debug --disable-rpath --disable-cli --enable-bcmath --enable-calendar \
			   	--enable-maintainer-zts --enable-embed=shared --enable-ftp \
			   	--enable-inline-optimization --enable-sockets --enable-wddx --sysconfdir=/etc/appweb \
			   	--with-pic --with-regex=system --with-pear --with-xmlrpc --with-zlib --with-curl
WIN_OPTIONS	:= 	--disable-debug --without-gd --disable-bcmath --disable-calendar --disable-com-dotnet --disable-filter \
			   	--disable-json --disable-ipv6 --disable-odbc --disable-tokenizer \
			   	--disable-zlib --disable-ftp --enable-embed --enable-zts --without-dom --without-libxml \
				--without-iconv --without-simplexml --without-xml
# MORE_OPTIONS:=	--with-mysql=/usr/local/mysql-client
export 		BLD_OS BLD_ARCH

ifeq ($(BLD_OS),WIN)
PATH		:= $(PWD)/../bin:$(PATH)
export 		PATH
endif
all:
	rm -f latest ; ln -s $(LATEST) latest
ifeq ($(BLD_OS),WIN)
	set -e ; cd latest ; \
	/bin/find . -name '*.obj' -print | xargs rm -f ; \
	rm -fr Debug_TS Release_TS ; \
	cmd /c buildconf.bat ; \
	cscript /nologo configure.js $(WIN_OPTIONS) ; \
	unset MAKEFLAGS ; nmake
endif
ifeq ($(BLD_OS),MACOSX)
	MACOSX_DEPLOYMENT_TARGET=10.5 ; \
    if [ "$(BLD_ARCH)" = 'x64' ] ; then \
        GCC_ARCH="x86_64" ; \
    else \
        GCC_ARCH="i686" ; \
    fi ; \
	CC=/usr/bin/gcc; \
	CCFLAGS="-arch $${GCC_ARCH}" ; \
	CCFLAGS="$CFLAGS" ; \
	LDFLAGS="-Wl,-install_name,@rpath/libphp5.dylib -arch $${GCC_ARCH} -bind_at_load -lresolv" ; \
	export CC LDFLAGS CFLAGS CCFLAGS MACOSX_DEPLOYMENT_TARGET ; \
	cd latest ; ./configure --build=$${GCC_ARCH}-apple-darwin10.0.0 $(OPTIONS) $(MORE_OPTIONS); \
	cp Makefile Makefile.new ; \
	sed 's/EXTRA_LDFLAGS = -avoid-version -module/EXTRA_LDFLAGS = -avoid-version/' < Makefile.new > Makefile ; \
	make clean ; make
endif
ifeq ($(BLD_OS),LINUX)
	cd latest ; ./configure $(OPTIONS) ; make clean ; make
endif

clean:
	make -C latest clean

prep:
	apt-get install libxml2-dev curl libdb-dev libz-dev
	apt-get install php5-curl 
    apt-get install libcurl4-openssl-dev
	# apt-get install libcurl3 libcurl3-dev

#
#	Mac 32 bit build
make32:
	rm -f latest ; ln -s $(LATEST) latest
	MACOSX_DEPLOYMENT_TARGET=10.5 ; \
	CFLAGS="-arch i386"; \
	CCFLAGS="$CFLAGS" ; \
	LDFLAGS="-Wl,-install_name,@rpath/libphp5.dylib -arch i386 -bind_at_load -lresolv" ; \
	export LDFLAGS CFLAGS CCFLAGS MACOSX_DEPLOYMENT_TARGET ; \
	cd latest ; ./configure --host=i386-apple-darwin10.0.0 $(OPTIONS) ; \
	cp Makefile Makefile.new ; \
	sed 's/EXTRA_LDFLAGS = -avoid-version -module/EXTRA_LDFLAGS = -avoid-version/' < Makefile.new > Makefile ; \
	make clean ; make

