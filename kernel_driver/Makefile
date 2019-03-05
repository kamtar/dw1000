ccflags-y := -DDEBUG -g
dw1000_mod-y := dw1000.o kcompat.o timehires.o
obj-m += dw1000_mod.o

all:
	make -C /lib/modules/$(shell uname -r)/build/ M=$(PWD) modules
clean:
	make -C /lib/modules/$(shell uname -r)/build/ M=$(PWD) clean