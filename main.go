package main

/*
#include <stdbool.h>
bool IsPrime(int num) {
    if (num <= 1) {
        return false;
    }
    if (num <= 3) {
        return true;
    }
    if (num % 2 == 0 || num % 3 == 0) {
        return false;
    }

    int i = 5;
    while (i * i <= num) {
        if (num % i == 0 || num % (i + 2) == 0) {
            return false;
        }
        i += 6;
    }

    return true;
}
*/
import "C"
import "fmt"

func main() {
	fmt.Println(C.IsPrime(69))
}
