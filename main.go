package main

// #cgo CFLAGS: -g -Wall
// #include <stdlib.h>
// #include "prime.h"
import "C"
import "fmt"

func main() {
	fmt.Println(C.IsPrime(69))
}
