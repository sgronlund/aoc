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
	lenFile := 0
	scanner := bufio.NewScanner(file)
	intArr := make([]int, 12) //len 5 for bit seq in test, 12 in input
	for scanner.Scan() {
		row := scanner.Text()
		parts := strings.Split(row, "")
		for i := 0; i < len(parts); i++ {
			val, _ := strconv.Atoi(parts[i])
			intArr[i] = intArr[i] + val
		}
		lenFile++
	}
	fmt.Println(lenFile / 2)
	fmt.Println(intArr)
	bitSeq, revBitSeq := "", ""
	for i := 0; i < len(intArr); i++ {
		if intArr[i] >= lenFile/2 {
			bitSeq += "1"
			revBitSeq += "0"
		} else {
			bitSeq += "0"
			revBitSeq += "1"
		}
	}
	bitSeqVal, _ := strconv.ParseInt(bitSeq, 2, 64)
	revBitSeqVal, _ := strconv.ParseInt(revBitSeq, 2, 64)
	fmt.Println(bitSeqVal)
	fmt.Printf("Part 1: %d\n", bitSeqVal*revBitSeqVal)
}
