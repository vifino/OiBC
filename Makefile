CFLAGS += -DHAVE_GETEUID -Wall
PREFIX ?= /usr/local

OIBC_OBJS = oibc.o
LIBRARIES = -lusb-1.0 -lpthread -lreadline

ifeq ($(DEBUG),YES)
        CFLAGS += -ggdb
endif

all: oibc

oibc: $(OIBC_OBJS)
	$(CC) $(CFLAGS) $(OIBC_OBJS) $(LIBRARIES) -o $@

install: oibc
	install -d $(DESTDIR)/$(PREFIX)/bin
	install oibc $(DESTDIR)/$(PREFIX)/bin

uninstall:
	rm -f $(DESTDIR)/$(PREFIX)/oibc

clean:
	rm -f oibc *.o
