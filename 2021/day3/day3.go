package main

import (
	"aoc"
	"fmt"
	"strconv"
	"strings"
)

func part1(fileName string) int64 {
	fileArr := aoc.ConvFileToArr(fileName)
	intArr := make([]int, len(fileArr[0])) //len 5 for bit seq in test, 12 in input
	for i := 0; i < len(fileArr); i++ {
		parts := strings.Split(fileArr[i], "")
		for i := 0; i < len(parts); i++ {
			val, _ := strconv.Atoi(parts[i])
			intArr[i] = intArr[i] + val
		}
	}
	bitSeq, revBitSeq := "", ""
	for i := 0; i < len(intArr); i++ {
		if intArr[i] >= len(fileArr)/2 {
			bitSeq += "1"
			revBitSeq += "0"
		} else {
			bitSeq += "0"
			revBitSeq += "1"
		}
	}
	bitSeqVal, _ := strconv.ParseInt(bitSeq, 2, 64)
	revBitSeqVal, _ := strconv.ParseInt(revBitSeq, 2, 64)
	return bitSeqVal * revBitSeqVal
}

//https://github.com/golang/go/wiki/SliceTricks, has neat deletion thing used in this code
func part2(fileName string) int {
	ans := 0
	fileArr := aoc.ConvFileToArr(fileName)
	fileArr2 := aoc.ConvFileToArr(fileName)
	for i := 0; i < len(fileArr[0]); i++ {
		intArr := make([]int, len(fileArr[0]))
		for j := 0; j < len(fileArr); j++ {
			parts := strings.Split(fileArr[j], "")
			for k := 0; k < len(parts); k++ {
				val, _ := strconv.Atoi(parts[k])
				intArr[k] = intArr[k] + val
			}
		}
		//Need to fix this condition
		bit := "0"
		if intArr[i] > len(fileArr)/2 {
			bit = "1"
		}
		fmt.Println(intArr[i])
		fmt.Println(len(fileArr))
		for l := 1; l < len(fileArr); l++ { // needed to change loop index to work with neat deletion
			chars := strings.Split(fileArr[l], "")
			if chars[i] == bit {
				fileArr = append(fileArr[:l-1], fileArr[l:]...)
			} else {
				fileArr2 = append(fileArr2[:l-1], fileArr2[l:]...)
			}
		}
	}
	fmt.Println(fileArr)  // should be one elem
	fmt.Println(fileArr2) // same here
	return ans
}

func main() {
	testIn := "test.txt"
	actualIn := "input.txt"
	test1 := part1(testIn)
	sol1 := part1(actualIn)
	fmt.Printf("Could solve example solution for part 1: %t\n", test1 == 198)
	fmt.Printf("Part 1: %d\n", sol1)
	test2 := part2(testIn)
	//sol2 := part2(actualIn)
	fmt.Printf("Could solve example solution for part 2: %t\n", test2 == 230)
	//fmt.Printf("Part 2: %d\n", sol2)
}
