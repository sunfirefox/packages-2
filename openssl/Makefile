#
#	Build openssl
#

LATEST		:= openssl-1.0.1c
BLD_OS		:= $(shell ../getos)
BLD_ARCH	:= $(shell ../getarch)

ifeq ($(BLD_OS),WIN)
PATH		:= $(PWD)/../bin:$(PATH)
export 		PATH

ifeq ($(BLD_ARCH), x64)
CONFIG      := VC-WIN64A
DOSCRIPT    := do_win64a
else
CONFIG      := VC-WIN32
DOSCRIPT    := do_ms
endif
endif

all:
	rm -f latest ; ln -s $(LATEST) latest
ifeq ($(BLD_OS),WIN)
	@echo BUILDING for $(BLD_ARCH)
	cd latest ; \
	rm -f libcrypto.lib libeay32.dll libssl.lib ssleay32.dll ; \
	rm -f out32dll/*.exe out32dll/*.dll out32dll/*.lib tmp32dll/* ; \
	perl Configure $(CONFIG) ; \
	cmd /c ms\\$(DOSCRIPT) ; \
	unset MAKEFLAGS ; nmake -f ms/ntdll.mak 
else
ifeq ($(BLD_OS),MACOSX)
	cd latest ; ./Configure darwin64-x86_64-cc shared ; make
else
	cd latest ; ./config shared ; make
	[ -x /usr/bin/execstack ] && execstack -c latest/*.so ; true
endif
endif

clean:
	make -C latest clean

prep:
	apt-get install execstack
