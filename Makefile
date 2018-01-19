
PWD := $(shell pwd)
CROSS :=$(PWD)/cross-compiler-mips/bin/mips-


all:
	$(CROSS)as helloWorld.S -o helloWorld.o
	$(CROSS)ld -o helloWorld helloWorld.o


clean:
	rm *.o
	rm helloWorld
