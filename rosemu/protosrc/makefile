SRCDIR=/src/ros
CC   = g++
SRC += $(SRCDIR)/src/rosproto.cpp 

TARGET = $(SRCDIR)/build/lidarserver

LIBRARY += boost_system
LIBRARY += boost_date_time
LIBRARY += boost_thread
LIBRARY += pthread
LIBRARY += roscpp
LIBRARY += rosconsole
LIBRARY += rostime
#LIBRARY += sqlite3


LIBRARYDIR += /usr/lib
LIBRARYDIR += /opt/ros/indigo/lib
LIBRARYDIR += /usr/lib/arm-linux-gnueabihf


LINK_LIBDIR += /opt/ros/indigo/lib


#NCLUDEDIR += $(SRCDIR)/src
INCLUDEDIR += /opt/ros/indigo/include
INCLUDEDIR += /usr/include


OPT = -std=c++11
DEBUG = -g
WARN= -Wall
PTHREAD= -pthread
LINK    = -Wl,-rpath,

INCDIR  = $(patsubst %,-I%,$(INCLUDEDIR))
LIBDIR  = $(patsubst %,-L%,$(LIBRARYDIR))
LIB    = $(patsubst %,-l%,$(LIBRARY))
LINKDIR = $(patsubst %,$(LINK)%,$(LINK_LIBDIR))

all:
	$(CC) $(SRC) -o $(TARGET) $(INCDIR) $(LIBDIR) $(LINKDIR) $(LIB) 

clean:
	rm -rf $(TARGET)