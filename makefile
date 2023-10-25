# prime
goExecFileNamePrime := go-exec-main-prime
goNativeExecFileNamePrime := go-native-exec-main-prime
cExecFileNamePrime := c-exec-main-prime
cExecFileNameOptimizedPrime := c-exec-optimized-main-prime

goMainFilePrime := prime-main.go
goNativeMainFilePrime := prime-native-main.go

cMainFilePrime := prime-main.c
cLibFilePrime := prime.c

outCPrimeFile:=output_c_prime
outCCompilerPrimeFile:=output_c_compiler_prime

outCOptimizedPrimeFile:=output_c_optimized_prime
outCOptimizedCompilerPrimeFile:=output_c_optimized_compiler_prime

outGoPrimeFile:=output_go_prime
outGoCompilerPrimeFile:=output_go_compiler_prime

outNativeGoPrimeFile:=output_go_native_prime
outNativeGoCompilerPrimeFile:=output_go_native_compiler_prime


build-main-go-prime: $(goMainFilePrime)
	go build -ldflags "-s -w" -o $(goExecFileNamePrime) $(goMainFilePrime)

build-native-main-go-prime: $(goNativeMainFilePrime)
	go build -ldflags "-s -w" -o $(goNativeExecFileNamePrime) $(goNativeMainFilePrime)

build-main-c-linker-prime: $(cLibFilePrime)
	gcc -c prime.c -o prime.o

build-main-c-prime: $(cMainFilePrime) $(cLibFilePrime)
	gcc -o $(cExecFileNamePrime) $(cMainFilePrime) $(cLibFilePrime)

build-main-c-optimized-prime: $(cMainFilePrime) $(cLibFilePrime)
	gcc -O2 -o $(cExecFileNameOptimizedPrime) $(cMainFilePrime) $(cLibFilePrime)

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
	./benchmarking.sh  "gcc -o $(cExecFileNamePrime) $(cMainFilePrime) $(cLibFilePrime)"  $(outCCompilerPrimeFile) "$(cExecFileNamePrime)"
	./benchmarking.sh  ./$(cExecFileNamePrime) $(outCPrimeFile)
	./benchmarkMemoryStdOut.sh "$(cExecFileNamePrime)" output_c_out_stdout_memory_prime

benchmark-c-optimized-prime:
	./benchmarking.sh  "gcc -O2 -o $(cExecFileNameOptimizedPrime) $(cMainFilePrime) $(cLibFilePrime)"  $(outCOptimizedCompilerPrimeFile) "$(cExecFileNameOptimizedPrime)"
	./benchmarking.sh  ./$(cExecFileNameOptimizedPrime) $(outCOptimizedPrimeFile)
	./benchmarkMemoryStdOut.sh "$(cExecFileNameOptimizedPrime)" output_c_optimized_stdout_memory_prime

benchmark-go-prime:
	./benchmarking.sh  "go build -ldflags \"-s -w\" -o $(goExecFileNamePrime) $(goMainFilePrime)" $(outGoCompilerPrimeFile) "$(goExecFileNamePrime)"
	./benchmarking.sh  ./$(goExecFileNamePrime) $(outGoPrimeFile)
	./benchmarkMemoryStdOut.sh "$(goExecFileNamePrime)" output_go_stdout_memory_prime

benchmark-go-native-prime:
	./benchmarking.sh  "go build -ldflags \"-s -w\" -o $(goNativeExecFileNamePrime) $(goNativeMainFilePrime)" $(outNativeGoCompilerPrimeFile) "$(goNativeExecFileNamePrime)"
	./benchmarking.sh  ./$(goNativeExecFileNamePrime) $(outNativeGoPrimeFile)
	./benchmarkMemoryStdOut.sh "$(goNativeExecFileNamePrime)" output_go_native_stdout_memory_prime



# sum
goNativeExecFileNameSum := go-native-exec-main-sum
cExecFileNameSum := c-exec-main-sum
cExecFileNameOptimizedSum := c-exec-optimized-main-sum

goNativeMainFileSum := sum-native-main.go
cMainFileSum := sum-main.c

outCSumFile:=output_c_sum
outCCompilerSumFile:=output_c_compiler_sum

outCOptimizedSumFile:=output_c_optimized_sum
outCOptimizedCompilerSumFile:=output_c_optimized_compiler_sum

outNativeGoSumFile:=output_go_native_sum
outNativeGoCompilerSumFile:=output_go_native_compiler_sum

build-native-main-go-sum: $(goNativeMainFileSum)
	go build  -o $(goNativeExecFileNameSum) $(goNativeMainFileSum)

build-main-c-sum: $(cMainFileSum)
	gcc -o $(cExecFileNameSum) $(cMainFileSum)

build-main-c-optimized-sum: $(cMainFileSum)
	gcc -O2 -o $(cExecFileNameOptimizedSum) $(cMainFileSum)

run-native-main-go-sum: $(goExecFileNameSum)
	./$(goNativeExecFileNameSum)

run-main-c-sum: $(cExecFileNameSum)
	./$(cExecFileNameSum)

build-all-sum-exec:
	make build-native-main-go-sum
	make build-main-c-sum
	make build-main-c-optimized-sum

benchmark-c-sum:
	./benchmarking.sh  "gcc -o $(cExecFileNameSum) $(cMainFileSum)" $(outCCompilerSumFile) "$(cExecFileNameSum)"
	./benchmarking.sh  ./$(cExecFileNameSum) $(outCSumFile)
	./benchmarkMemoryStdOut.sh "$(cExecFileNameSum)" output_c_stdout_memory_sum

benchmark-c-optimized-sum:
	./benchmarking.sh  "gcc -O2 -o $(cExecFileNameOptimizedSum) $(cMainFileSum)" $(outCOptimizedCompilerSumFile) "$(cExecFileNameOptimizedSum)"
	./benchmarking.sh  ./$(cExecFileNameOptimizedSum) $(outCOptimizedSumFile)
	./benchmarkMemoryStdOut.sh "$(cExecFileNameOptimizedSum)" output_c_optimized_stdout_memory_sum

benchmark-go-native-sum:
	./benchmarking.sh  "go build -o $(goNativeExecFileNameSum) $(goNativeMainFileSum)" $(outNativeGoCompilerSumFile) "$(goNativeExecFileNameSum)"
	./benchmarking.sh  ./$(goNativeExecFileNameSum) $(outNativeGoSumFile)
	./benchmarkMemoryStdOut.sh "$(goNativeExecFileNameSum)" output_go_native_stdout_memory_sum


parsedExecData:=print_data
parsedFileData:=parse-file-data

make-parse-data: $(parsedFileData)
	go build -o $(parsedExecAverage) $(parseFileData)

# prime results
print-c-prime-data: $(parsedExecData) $(outCPrimeFile)
	./$(parsedExecData) $(outCPrimeFile)

print-c-compiler-prime-data: $(parsedExecData) $(outCCompilerPrimeFile)
	./$(parsedExecData) $(outCCompilerPrimeFile)

print-c-optimized-prime-data: $(parsedExecData) $(outCOptimizedPrimeFile)
	./$(parsedExecData) $(outCOptimizedPrimeFile)

print-c-optimized-compiler-prime-data: $(parsedExecData) $(outCOptimizedCompilerPrimeFile)
	./$(parsedExecData) $(outCOptimizedCompilerPrimeFile)

print-go-prime-data: $(parsedExecData) $(outGoPrimeFile)
	./$(parsedExecData) $(outGoPrimeFile)

print-go-compiler-prime-data: $(parsedExecData) $(outGoCompilerPrimeFile)
	./$(parsedExecData) $(outGoCompilerPrimeFile)

print-native-go-prime-data: $(parsedExecData) $(outNativeGoPrimeFile)
	./$(parsedExecData) $(outNativeGoPrimeFile)

print-native-go-compiler-prime-data: $(parsedExecData) $(outNativeGoCompilerPrimeFile)
	./$(parsedExecData) $(outNativeGoCompilerPrimeFile)


# sum results
print-c-sum-data: $(parsedExecData) $(outCSumFile)
	./$(parsedExecData) $(outCSumFile)

print-c-compiler-sum-data: $(parsedExecData) $(outCCompilerSumFile)
	./$(parsedExecData) $(outCCompilerSumFile)

print-c-optimized-sum-data: $(parsedExecData) $(outCOptimizedSumFile)
	./$(parsedExecData) $(outCOptimizedSumFile)

print-c-optimized-compiler-sum-data: $(parsedExecData) $(outCOptimizedCompilerSumFile)
	./$(parsedExecData) $(outCOptimizedCompilerSumFile)

print-native-go-sum-data: $(parsedExecData) $(outNativeGoSumFile)
	./$(parsedExecData) $(outNativeGoSumFile)

print-native-go-compiler-sum-data: $(parsedExecData) $(outNativeGoCompilerSumFile)
	./$(parsedExecData) $(outNativeGoCompilerSumFile)

clean:
	rm -rf *.o $(goExecFileNamePrime) $(cExecFileNamePrime) $(goNativeExecFileNamePrime) $(goExecFileNameSum) $(cExecFileNameSum) $(goNativeExecFileNameSum) $(cExecFileNameOptimizedSum) $(cExecFileNameOptimizedPrime)