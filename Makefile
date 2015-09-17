CC=nvcc


all: Func_Test

Func_Test: Func_Test.o

%: %.o
	$(CC) $(LDFLAGS) $^ $(LDLIBS) -o $@

%.o: %.cu
	$(CC) $(CFLAGS) -c -o $@ $^

%.dis: %.o
	objdump --source $^ > $@

clean:
	rm -f *.o

