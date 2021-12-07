package main //linter warns here???

import (
	"bufio"
	"fmt"
	"log"
	"os"
	"strconv"
	"strings"
)

func main() {
	file, err := os.Open("input.txt")
	if err != nil {
		log.Fatal(err)
	}
	defer file.Close()
	horizontal, depth, newDepth, aim := 0, 0, 0, 0
	scanner := bufio.NewScanner(file)
	for scanner.Scan() {
		row := scanner.Text()
		parts := strings.Split(row, " ")
		value, _ := strconv.Atoi(parts[1])
		switch parts[0] {
		case "forward":
			horizontal += value
			newDepth += aim * value
		case "up":
			depth -= value
			aim -= value
		case "down":
			depth += value
			aim += value
		}
	}
	fmt.Printf("Horizontal position: %d\n", depth*horizontal)
	fmt.Printf("Horizontal position part 2: %d\n", newDepth*horizontal)
	//fmt.Println("test")
}
