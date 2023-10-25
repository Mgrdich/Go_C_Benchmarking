# Benchmarking with C and Go

This is a simple benchmarking app , with scripts and make commands to build any 
arbitrary file and benchmark it's speed and performance


## How to use it 

### To Build a binary
let's take the case of cgo for prime numbers
* `make build-main-go-prime`
* `go-exec-main-prime` exec file with this name by default , you can edit the makefile to put your custom names all the other make commands are with variables they will pick it up automatically
* `make build-all-prime-exec` this one builds all the prime related exec


### Test and Benchmark it
There is two bash scripts that take care of this one is and they create logs
you can change the log files name by changing the variables for the logs in the makefile

Here is an example

`outCPrimeFile:=output_c_prime`

`outCCompilerPrimeFile:=output_c_compiler_prime`

* `benchmarking.sh` for time it will redirect it to your upper configure file
* `benchmarkMemoryStdOut.sh` to it will redirect to your upper configure file
* `parse-native-data.go` that create an executable to calculate the average over those logs file

to run a particular benchmark

`make benchmark-c-sum` it will run all the benchmarking necessary and create log files

Once the Log files are created

you can run
`make print-c-prime-data` which in its turn will compile the `parse-native-data.go`
if it is not compiled and calculate the averages that those file did generate.

Everything is automated you can customize and and add new stuff to it.