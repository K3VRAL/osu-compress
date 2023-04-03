CC	= gcc
CFLAGS	= -Wall $(shell pkg-config --cflags libosu)
LFLAGS	= $(shell pkg-config --libs libosu)
TARGET	= osu-compress

all:	CFLAGS += -g
all:	$(TARGET)

unix:	$(TARGET)

$(TARGET):
	$(CC) main.c -o $@ $(CFLAGS) $(LFLAGS)

TARGET_WIN	= osu-compress.exe

win64:	CC = x86_64-w64-mingw32-gcc
win64:	$(TARGET_WIN)

win32:	CC = i686-w64-mingw32-gcc
win32:	$(TARGET_WIN)

$(TARGET_WIN):
	$(CC) main.c -o $@ $(CFLAGS) $(LFLAGS)
