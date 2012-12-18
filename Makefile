#
#	Top level master make to build all packages
#
PACKAGES	:= matrixssl openssl php

all: 
	@for p in $(PACKAGES) ; do \
		echo Building $$p ; \
		$(MAKE) -C $$p ; \
	done

clean:
	for p in $(PACKAGES) ; do $(MAKE) -C $$p clean ; done


#
#	Required packages on linux
#
prep:
	@for p in $(PACKAGES) ; do \
		echo Building $$p ; \
		make -C $$p ; \
	done
