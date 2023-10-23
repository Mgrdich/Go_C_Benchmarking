package main

import "fmt"

func main() {
	n := 10000000000
	sum := int64(0)
	for i := 1; i <= n; i++ {
		sum += int64(i)
	}
	fmt.Printf("Sum of the first %d positive integers: %d\n", n, sum)
}
