package prime1

import "fmt"

func IsPrime3(num int) bool {
	if num <= 1 {
		return false
	}
	if num <= 3 {
		return true
	}
	if num%2 == 0 || num%3 == 0 {
		return false
	}

	i := 5
	for i*i <= num {
		if num%i == 0 || num%(i+2) == 0 {
			return false
		}
		i += 6
	}

	return true
}

func PrintPrimesUpToN4(n int) {
	if n >= 2 {
		fmt.Println(2)
	}
	for i := 3; i <= n; i += 2 {
		if IsPrime3(i) {
			fmt.Println(i)
		}
	}
}
