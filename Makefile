obj-m := i8k.o

VERSION=$(shell uname -r)
HEADERS	:= /usr/src/linux-headers-$(VERSION)

PWD := $(shell pwd)
default:
	$(MAKE) -C $(HEADERS) M=$(PWD) modules

install:
	cp i8k.ko /lib/modules/$(VERSION)/kernel/drivers/char
	depmod

clean:
	$(MAKE) -C $(HEADERS) M=$(PWD) clean
