BINDIR		:= bin/
OBJDIR		:= obj/
SRCDIR		:= src/
CPYDIR		:= cpy/

INCDIR		:= /usr/local/share/gnucobol/copy

CC			:= cobc
COBFLAGS	:= -v -std=rm -I$(INCDIR)

OBJS		:= $(OBJDIR)utils-clean-screen.o

COBMAIN		:= $(SRCDIR)test-keys.cob

TARGET 		:= $(BINDIR)teclado

all: $(TARGET)

# Solo el main tiene extension COB
$(TARGET): $(OBJS) 
	$(CC) $(COBGLAGS) -x -o $@ $(COBMAIN) $^ 

#La extension CBL, se usa para compilarlo como objeto
$(OBJDIR)%.o:$(SRCDIR)%.cbl
	$(CC) $(COBFLAGS) -c $^ -o $@ 
	
#CLEAN
.PHONY: cl
cl:
	rm $(TARGET) $(OBJS) 

#RUN
.PHONY: r
r:
	./$(TARGET)
