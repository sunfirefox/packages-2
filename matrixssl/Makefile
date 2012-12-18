#
#	Build matrixssl 
#

LATEST		:= matrixssl-3-3-1-open
BLD_OS		:= $(shell ../getos)
BLD_ARCH	:= $(shell ../getarch)

export BLD_OS BLD_ARCH

all:
	rm -f latest ; ln -s $(LATEST) latest
ifeq ($(BLD_OS),WIN)
	cd latest ; make -f ../Makefile.win
else
	make -C latest
endif

clean:
	make -C latest clean
