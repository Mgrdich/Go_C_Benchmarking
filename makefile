goExecFileName := go-exec-main
goNativeExecFileName := go-native-exec-main
cExecFileName := c-exec-main
goMainFile := main.go
goNativeMainFile := native-main.go
cMainFile := main.c
cLibFile := prime.c


build-main-go: $(goMainFile)
	go build -o $(goExecFileName) $(goMainFile)

build-native-main-go: $(goNativeMainFile)
	go build -o $(goNativeExecFileName) $(goNativeMainFile)

build-main-c-linker: $(cLibFile)
	gcc -c prime.c -o prime.o

build-main-c: $(cMainFile) $(cLibFile)
	gcc -o $(cExecFileName) $(cMainFile) $(cLibFile)

run-main-go: $(goExecFileName)
	./$(goExecFileName)

run-main-c: $(cExecFileName)
	./$(cExecFileName)

start-benchmarking-c:
	./benchmarking.sh  "gcc -o $(cExecFileName) $(cMainFile) $(cLibFile)"  output_c_compiler
	./benchmarking.sh  ./$(cExecFileName) output_c

start-benchmarking-go:
	./benchmarking.sh  "go build -o $(goExecFileName) $(goMainFile)" output_go_compiler
	./benchmarking.sh  ./$(goExecFileName) output_go

start-benchmarking-go-native:
	./benchmarking.sh  "go build -o $(goNativeExecFileName) $(goNativeMainFile)" output_go_compiler
	./benchmarking.sh  ./$(goNativeExecFileName) output_go

clean:
	rm -rf *.o $(goExecFileName) $(cExecFileName) $(goNativeExecFileName)