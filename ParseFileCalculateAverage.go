package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

func main() {
	file, err := os.Open("output_c_sum")
	if err != nil {
		fmt.Println(err)
		return
	}
	defer func(file *os.File) {
		err := file.Close()
		if err != nil {

		}
	}(file)

	scanner := bufio.NewScanner(file)

	sums := make(map[string]float64)
	counts := make(map[string]int)

	for scanner.Scan() {
		line := scanner.Text()

		if strings.HasPrefix(line, "user") || strings.HasPrefix(line, "real") || strings.HasPrefix(line, "sys") {
			fields := strings.Fields(line)
			fieldName := fields[0]
			valueStr := fields[1]

			minuteSeconds := strings.Split(valueStr, "m")
			if len(minuteSeconds) == 2 {
				minValue, err := strconv.ParseFloat(minuteSeconds[0], 64)
				secondsValue, err := strconv.ParseFloat(strings.TrimSuffix(minuteSeconds[1], "s"), 64)
				if err == nil {
					sums[fieldName] += minValue*60 + secondsValue
					counts[fieldName]++
				}
			}

		}
	}

	for fieldName, total := range sums {
		count := counts[fieldName]
		if count > 0 {
			average := total / float64(count)
			fmt.Printf("Average %s: %.3f\n", fieldName, average)
		} else {
			fmt.Printf("No data found for %s\n", fieldName)
		}
	}
}
