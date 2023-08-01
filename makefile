CC = leanc
CFLAGS = -I /usr/include -I /usr/include/x86_64-linux-gnu/ 

LEANFILE1 = lake-packages/cryptolib4/Cryptolib4/ElTest.lean
LEANFILE2 = SCL.lean
LEANFILE3 = Main.lean

CFILE1 = eltest.c
CFILE2 = scl.c
CFILE3 = main.c

# SOURCES := $(wildcard build/ir/*.c)
SOURCES := $(shell find . -name "*.c")
# SOURCES := $(shell find . -name "*.c" | paste -sd " ")
# SOURCES := ()
# SOURCES=$(wildcard *.c)

c : 
	lean -c $(CFILE1) $(LEANFILE1)
	lean -c $(CFILE2) $(LEANFILE2)
	lean -c $(CFILE3) $(LEANFILE3)
	perl -pi -e 's/lake_x2dpackages_cryptolib4_//g' $(CFILE1)

leancMake.o : $(SOURCES)
	rm -f leancMake.o
#	$(CC) -o $@ $^ $(CFLAGS)
#	$(CC) -o $@  cfiles.txt $(CFLAGS)
#	$(CC) -o $@  lake-packages/cryptolib4/build/ir/Cryptolib4/ElTest2.c lake-packages/cryptolib4/build/ir/Cryptolib4/ElTest.c build/ir/SCL.c build/ir/Main.c $(CFLAGS)
	
#	$(CC) -o $@  lake-packages/cryptolib4/build/ir/Cryptolib4/ElTest2.c $(CFILE1) $(CFILE2) $(CFILE3) $(CFLAGS)

clean : 
	rm -f *.c
	rm -f leancMake.o

all : c leancMake.o 

## Important commands from lake build -v:

# The first compiles the c, and it does for each dependency. It also allows me to modify it and fix it
# The second makes te executable as sCL

# leanc -c -o ./build/ir/Main.o ./build/ir/Main.c -O3 -DNDEBUG -I /usr/include -I /usr/include/x86_64-linux-gnu/
# leanc -o ./sCL ./build/ir/Main.o ./build/ir/SCL.o ./lake-packages/cryptolib4/build/ir/Cryptolib4/ElTest2.o ./lake-packages/cryptolib4/build/ir/Cryptolib4/ElTest.o