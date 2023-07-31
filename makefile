CC = leanc
CFLAGS = -I /usr/include -I /usr/include/x86_64-linux-gnu/ 

LEANFILE1 = SCL.lean
LEANFILE2 = Main.lean

CFILE1 = scl.c
CFILE2 = main.c

c : 
	lean -c $(CFILE1) $(LEANFILE1)
	lean -c $(CFILE2) $(LEANFILE2)

leancMake.o :
	rm -f leancMake.o
	$(CC) -o $@ $(CFILE1) $(CFILE2) $(CFLAGS)

clean : 
	rm -f *.c
	rm -f leancMake.o

all : c leancMake.o 

