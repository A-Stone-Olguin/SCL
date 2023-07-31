CC = leanc
CFLAGS = -I /usr/include -I /usr/include/x86_64-linux-gnu/ 

LEANFILE1 = lake-packages/cryptolib4/Cryptolib4/ElTest.lean
LEANFILE2 = SCL.lean
LEANFILE3 = Main.lean

CFILE1 = eltest.c
CFILE2 = scl.c
CFILE3 = main.c

c : 
	lean -c $(CFILE1) $(LEANFILE1)
	lean -c $(CFILE2) $(LEANFILE2)
	lean -c $(CFILE3) $(LEANFILE3)
	perl -pi -e 's/lake_x2dpackages_cryptolib4_//g' $(CFILE1)

leancMake.o :
	rm -f leancMake.o
	$(CC) -o $@  lake-packages/cryptolib4/build/ir/Cryptolib4/ElTest2.c $(CFILE1) $(CFILE2) $(CFILE3) $(CFLAGS)

clean : 
	rm -f *.c
	rm -f leancMake.o

all : c leancMake.o 

