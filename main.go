package main

/*
#include "prime.c"
*/
import "C"
import "fmt"

func main() {
	result := C.IsPrime(C.int(10))

	fmt.Println(C.int(10), result)
}
