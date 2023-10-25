package main

import (
	"bufio"
	"fmt"
	"os"
	"sort"
	"strings"
	"time"
)

func main() {
	if len(os.Args) != 2 {
		panic("parameter of the executable is wrong")
	}
	fileDir := os.Args[1]
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

	fmt.Println("---------------------------------")
	fmt.Println("File Name:", fileDir)
	fmt.Println()

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

	keys := make([]string, 0, len(sums))
	for k := range sums {
		keys = append(keys, k)
	}

	sort.Strings(keys)

	for _, fieldName := range keys {
		count, countOk := counts[fieldName]
		total, ok := sums[fieldName]
		if countOk && count > 0 && ok {
			average := total / time.Duration(count)
			fmt.Println("Total", fieldName, "Duration:", total)
			fmt.Println("Average", fieldName, "Duration:", average)
			fmt.Println()
		} else {
			fmt.Printf("No data found for %s\n", fieldName)
		}
	}

	fmt.Println("---------------------------------")
}
