CC	= gcc
CFLAGS	= -Wall $(shell pkg-config --cflags libosu)
LFLAGS	= $(shell pkg-config --libs libosu)
TARGET	= osu-compress
EXTNSN	= 

all:	CFLAGS += -g
all:	$(TARGET)

unix64:	CFLAGS += -m64
unix64:	$(TARGET)

unix32:	CFLAGS += -m32
unix32:	$(TARGET)

win64:	EXTNSN = .exe
win64:	CC = x86_64-w64-mingw32-gcc
win64:	LFLAGS += -static-libgcc -L.
win64:	$(TARGET)

win32:	EXTNSN = .exe
win32:	CC = i686-w64-mingw32-gcc
win32:	LFLAGS += -static-libgcc -static-libstdc++ -L.
win32:	$(TARGET)

$(TARGET):
	$(CC) -o $@$(EXTNSN) main.c $(CFLAGS) $(LFLAGS)

