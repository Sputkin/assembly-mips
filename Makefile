
PWD := $(shell pwd)
CROSS :=$(PWD)/cross-compiler-mips/bin/mips-

all:
	$(CROSS)as src/helloWorld.S -o src/helloWorld.o
	$(CROSS)as src/arrayExample0.S -o src/arrayExample0.o

	$(CROSS)ld -o helloWorld src/helloWorld.o
	$(CROSS)ld -o arrayExample0 src/arrayExample0.o



clean:
	rm src/*.o
