package main

/*
void PrintPrimesUpToN(int n);
#include "prime.c"
*/
import "C"

func main() {
	C.PrintPrimesUpToN(C.int(10000000))
}