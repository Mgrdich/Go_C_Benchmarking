package main

/*
int GetM() {
    return 1;
}
*/
import "C"
import "fmt"

func main() {
	result := C.GetM()

	fmt.Printf("Result: %d\n", result)
}
