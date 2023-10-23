#include <stdio.h>

int main() {
    int n = 1000000000;
    long long sum = 0;
    for (int i = 1; i <= n; i++) {
        sum += i;
    }
    printf("Sum of the first %d positive integers: %lld\n", n, sum);
    return 0;
}
