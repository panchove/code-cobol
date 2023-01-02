BLANK :=
BSLASH := \$(BLANK)

ifeq ($(OS),Windows_NT) 
	DETECTED_OS := Windows
	BINDIR		:= .\bin$(BSLASH)
	OBJDIR		:= .\obj$(BSLASH)
	SRCDIR		:= .\src$(BSLASH)
	CPYDIR		:= C:\lang\cobol3\copy
	CPYLOC      := .\cpy$(BSLASH)
	TARGET 		:= $(BINDIR)test.exe
	CMDRM		:= del
else #LINUX
    DETECTED_OS := $(shell sh -c 'uname 2>/dev/null || echo Unknown')
	BINDIR		:= bin/
	OBJDIR		:= obj/
	SRCDIR		:= src/
	CPYDIR		:= /usr/local/share/gnucobol/copy/ 
	CPYLOC		:= cpy/
	TARGET 		:= $(BINDIR)test
	CMDRM		:= rm
endif

COBSTD		:= rm
CC			:= cobc
COBMAIN		:= $(SRCDIR)main.cob
COBFLAGS	:= -std=$(COBSTD) -I $(CPYLOC) -I $(CPYDIR)

OBJS		:=  \
				$(OBJDIR)fun-centerpos.o \
				$(OBJDIR)fun-lentrim.o \
				$(OBJDIR)sub-cls.o \
				$(OBJDIR)screen-main-menu.o

all: $(TARGET)

# Solo el main tiene extension COB
$(TARGET): $(OBJS) 
	$(CC) $(COBFLAGS) -x -o $@ $(COBMAIN) $^

#La extension CBL, se usa para compilarlo como objeto
$(OBJDIR)%.o : $(SRCDIR)%.cbl
	$(CC) $(COBFLAGS) -c $^ -o $@

.PHONY: cl
cl:
	$(CMDRM) $(OBJS) $(TARGET) 

.PHONY: run
run:
ifeq ($(OS),Windows_NT) 
	./$(TARGET)
else
	$(TARGET)
endif