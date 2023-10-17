package prime

import "fmt"

func IsPrime(num int64) bool {
	if num <= 1 {
		return false
	}
	if num <= 3 {
		return true
	}
	if num%2 == 0 || num%3 == 0 {
		return false
	}

	var i int64 = 5
	for i*i <= num {
		if num%i == 0 || num%(i+2) == 0 {
			return false
		}
		i += 6
	}

	return true
}

func PrintPrimesUpToN(n int) {
	if n >= 2 {
		fmt.Println(2)
	}
	for i := 3; i <= n; i += 2 {
		if IsPrime(int64(i)) {
			fmt.Println(i)
		}
	}
}
