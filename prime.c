#include "prime.h"
#include <stdio.h>

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

void PrintPrimesUpToN(int n) {
    if (n >= 2) {
        printf("2\n");
    }
    for (int i = 3; i <= n; i += 2) {
        if (IsPrime(i)) {
            printf("%d\n", i);
        }
    }
}