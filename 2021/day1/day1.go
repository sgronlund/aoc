package main

import (
	"bufio"
	"fmt"
	"log"
	"os"
	"strconv"
)

func main() {
	//fmt.Println("hello")
	file, err := os.Open("input.txt")
	size, _ := file.Stat()
	beep := size.Size()
	arr := make([]int, beep) //need to use make to create array with size calculated at runtime
	if err != nil {
		log.Fatal(err)
	}
	defer file.Close()
	scanner := bufio.NewScanner(file)
	localMax, numOfIncs, index := 10000000000, 0, 0
	for scanner.Scan() {
		line := scanner.Text()
		// handle input text
		i, err := strconv.Atoi(line)
		if err != nil {
			log.Fatal(err)
		}
		if i > localMax {
			numOfIncs++
		}
		localMax = i
		arr[index] = i
		index++
	}
	numOfSums := 0
	for i := 0; i < len(arr); i++ {
		if i > 2 {
			firstSum := arr[i-2] + arr[i-1] + arr[i]
			secondSum := arr[i-3] + arr[i-2] + arr[i-1]
			if firstSum > secondSum {
				numOfSums++
			}
		}
	}
	fmt.Printf("Part 1: %d\n", numOfIncs)
	fmt.Printf("Part 2: %d\n", numOfSums)

}
