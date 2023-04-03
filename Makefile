CC	= gcc
CFLAGS	= -Wall $(shell pkg-config --cflags libosu) -g
LFLAGS	= $(shell pkg-config --libs libosu)
TARGET	= osu-compress

all:	$(TARGET)

$(TARGET):
	$(CC) main.c -o $@ $(CFLAGS) $(LFLAGS)
