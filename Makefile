AR = ar
CC = gcc
CFLAGS = -g -Wall -fPIC 

OUTPUT := ./libslab.a

INCS_HEAD := ./

LIB_PATH := 
LIBS := -lpthread -lrt

SOURCE := $(wildcard  *.c)
OBJS := $(patsubst %.c, %.o, $(SOURCE))
#LIBOBJS := $(filter-out x.o , $(OBJS))


%.o:%.c
	$(CC) $(CFLAGS) $(addprefix -I,$(INCS_HEAD)) -c $< -o $@

all:$(OUTPUT)


./libeasy.a : $(OBJS) 
	$(AR) rcs  $@ $^

clean:
	-rm -f $(OBJS)
	-rm -f $(OUTPUT)
