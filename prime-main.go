package main

/*
#cgo CFLAGS: -O2
void PrintPrimesUpToN(int n);
#include "prime.c"
*/
import "C"

func main() {
	C.PrintPrimesUpToN(C.int(100000000))
}
