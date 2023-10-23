# prime
goExecFileNamePrime := go-exec-main-prime
goNativeExecFileNamePrime := go-native-exec-main-prime
cExecFileNamePrime := c-exec-main-prime
cExecFileNameOptimizedPrime := c-exec-optimzed-main-prime

goMainFilePrime := prime-main.go
goNativeMainFilePrime := prime-native-main.go

cMainFilePrime := prime-main.c
cLibFilePrime := prime.c


build-main-go-prime: $(goMainFilePrime)
	go build -o $(goExecFileNamePrime) $(goMainFilePrime)

build-native-main-go-prime: $(goNativeMainFilePrime)
	go build -o $(goNativeExecFileNamePrime) $(goNativeMainFilePrime)

build-main-c-linker-prime: $(cLibFilePrime)
	gcc -c prime.c -o prime.o

build-main-c-prime: $(cMainFilePrime) $(cLibFilePrime)
	gcc -o $(cExecFileNamePrime) $(cMainFilePrime) $(cLibFilePrime)

build-main-c-optimized-prime: $(cMainFilePrime) $(cLibFilePrime)
	gcc -O3 -o $(cExecFileNameOptimizedPrime) $(cMainFilePrime) $(cLibFilePrime)

run-main-go-prime: $(goExecFileNamePrime)
	./$(goExecFileNamePrime)

run-main-c-prime: $(cExecFileNamePrime)
	./$(cExecFileNamePrime)

run-native-main-go-prime: $(goNativeExecFileNamePrime)
	./$(goNativeExecFileNamePrime)

build-all-prime-exec:
	make build-main-go-prime
	make build-native-main-go-prime
	make build-main-c-prime
	make build-main-c-optimized-prime

benchmark-c-prime:
	./benchmarking.sh  "gcc -o $(cExecFileNamePrime) $(cMainFilePrime) $(cLibFilePrime)"  output_c_compiler_prime
	./benchmarking.sh  ./$(cExecFileNamePrime) output_c_prime

benchmark-c-prime:
	./benchmarking.sh  "gcc -O3 -o $(cExecFileNameOptimizedPrime) $(cMainFilePrime) $(cLibFilePrime)"  output_c_optimized_compiler_prime
	./benchmarking.sh  ./$(cExecFileNameOptimizedPrime) output_c_optimized_prime

benchmark-go-prime:
	./benchmarking.sh  "go build -o $(goExecFileNamePrime) $(goMainFilePrime)" output_go_compiler_prime --size
	./benchmarking.sh  ./$(goExecFileNamePrime) output_go_prime

benchmark-go-native-prime:
	./benchmarking.sh  "go build -o $(goNativeExecFileNamePrime) $(goNativeMainFilePrime)" output_go_native_compiler_prime --size
	./benchmarking.sh  ./$(goNativeExecFileNamePrime) output_go_native_prime



# sum
goNativeExecFileNameSum := go-native-exec-main-sum
cExecFileNameSum := c-exec-main-sum
cExecFileNameOptimizedSum := c-exec-optimized-main-sum

goNativeMainFileSum := sum-native-main.go
cMainFileSum := sum-main.c

build-native-main-go-sum: $(goNativeMainFileSum)
	go build -o $(goNativeExecFileNameSum) $(goNativeMainFileSum)

build-main-c-sum: $(cMainFileSum)
	gcc -o $(cExecFileNameSum) $(cMainFileSum)

build-main-c-optimized-sum: $(cMainFileSum)
	gcc -O3 -o $(cExecFileNameOptimizedSum) $(cMainFileSum)

run-native-main-go-sum: $(goExecFileNameSum)
	./$(goNativeExecFileNameSum)

run-main-c-sum: $(cExecFileNameSum)
	./$(cExecFileNameSum)

build-all-sum-exec:
	make build-native-main-go-sum
	make build-main-c-sum
	make build-main-c-optimized-sum

benchmark-c-sum:
	./benchmarking.sh  "gcc -o $(cExecFileNameSum) $(cMainFileSum)"  output_c_compiler_sum "$(cExecFileNameSum)"
	./benchmarking.sh  ./$(cExecFileNameSum) output_c_sum

benchmark-c-optimized-sum:
	./benchmarking.sh  "gcc -O3 -o $(cExecFileNameOptimizedSum) $(cMainFileSum)"  output_c_optimized_compiler_sum "$(cExecFileNameOptimizedSum)"
	./benchmarking.sh  ./$(cExecFileNameOptimizedSum) output_c_optimized_sum

benchmark-go-native-sum:
	./benchmarking.sh  "go build -o $(goNativeExecFileNameSum) $(goNativeMainFileSum)" output_go_native_compiler_sum "$(goNativeExecFileNameSum)"
	./benchmarking.sh  ./$(goNativeExecFileNameSum) output_go_native_sum

clean:
	rm -rf *.o $(goExecFileNamePrime) $(cExecFileNamePrime) $(goNativeExecFileNamePrime) $(goExecFileNameSum) $(cExecFileNameSum) $(goNativeExecFileNameSum)