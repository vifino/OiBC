OIBC_OBJS = oibc.o
LIBRARIES = -lusb-1.0 -lpthread -lreadline
CFLAGS += -DHAVE_GETEUID -Wall

ifeq ($(DEBUG),YES)
        CFLAGS += -ggdb
endif

all: oibc

oibc: $(OIBC_OBJS)
	$(CC) $(CFLAGS) $(OIBC_OBJS) $(LIBRARIES) -o $@

clean:
	rm -f oibc *.o
