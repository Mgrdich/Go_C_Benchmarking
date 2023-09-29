goExecFileName := go-exec-main
cExecFileName := c-exec-main

build-main-go: main.go build-main-c-linker
	go build -o $(goExecFileName) main.go

build-main-c-linker: main.c prime.c
	gcc -c prime.c -o prime.o

build-main-c: main.c prime.c
	gcc -o $(cExecFileName) main.c prime.c

run-main-go: $(goExecFileName)
	./$(goExecFileName)

run-main-c: $(cExecFileName)
	./$(cExecFileName)

clean:
	rm -rf *.o $(goExecFileName) $(cExecFileName)