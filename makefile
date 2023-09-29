goExecFileName := go-exec-main
cExecFileName := c-exec-main
goMainFile := main.go
cMainFile := main.c
cLibFile := prime.c


build-main-go: $(goMainFile)
	go build -o $(goExecFileName) $(goMainFile)

build-main-c-linker: $(cLibFile)
	gcc -c prime.c -o prime.o

build-main-c: $(cMainFile) $(cLibFile)
	gcc -o $(cExecFileName) $(cMainFile) $(cLibFile)

run-main-go: $(goExecFileName)
	./$(goExecFileName)

run-main-c: $(cExecFileName)
	./$(cExecFileName)

clean:
	rm -rf *.o $(goExecFileName) $(cExecFileName)