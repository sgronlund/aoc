// This package should contain any helper functions used to manipulate the the input read in aoc
// For future usage all functions have to defined with a capital letter at the start of the function name
package aoc

import (
	"bufio"
	"log"
	"os"
)

// Reads file and puts all the lines into an array
func ConvFileToArr(fileName string) []string {
	file, err := os.Open(fileName)
	var arr []string
	if err != nil {
		log.Fatal(err)
	}
	defer file.Close()
	scanner := bufio.NewScanner(file)
	for scanner.Scan() {
		arr = append(arr, scanner.Text())
	}
	return arr
}
