package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
	"time"
)

func main() {
	if len(os.Args) != 2 {
		panic("parameter of the executable is wrong")
	}
	file, err := os.Open(os.Args[1])
	if err != nil {
		panic(err)
	}
	defer func(file *os.File) {
		err := file.Close()
		if err != nil {
			panic(err)
		}
	}(file)

	scanner := bufio.NewScanner(file)

	sums := make(map[string]time.Duration)
	counts := make(map[string]int)

	for scanner.Scan() {
		line := scanner.Text()

		if strings.HasPrefix(line, "user") || strings.HasPrefix(line, "real") || strings.HasPrefix(line, "sys") {
			fields := strings.Fields(line)
			fieldName := fields[0]
			valueStr := fields[1]

			if strings.HasSuffix(valueStr, "s") {
				parsedTime, err := time.ParseDuration(valueStr)
				if err == nil {
					sums[fieldName] = sums[fieldName] + parsedTime
					counts[fieldName]++
				}
			}

		}
	}

	for fieldName, total := range sums {
		count := counts[fieldName]
		if count > 0 {
			average := total / time.Duration(count)
			fmt.Printf("Total Duration: %v\n", total)
			fmt.Printf("Average Duration: %v\n", average)
		} else {
			fmt.Printf("No data found for %s\n", fieldName)
		}
	}
}
