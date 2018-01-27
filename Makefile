
PWD := $(shell pwd)
CROSS :=$(PWD)/cross-compiler-mips/bin/mips-

all:
	$(CROSS)as example/helloWorld.S -o example/helloWorld.o
	$(CROSS)as example/arrayExample0.S -o example/arrayExample0.o

	$(CROSS)ld -o helloWorld example/helloWorld.o
	$(CROSS)ld -o arrayExample0 example/arrayExample0.o



clean:
	rm example/*.o
