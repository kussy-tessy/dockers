package main

import (
	"fmt"
)

func main(){
	mySlice := GetSlice(3, 3)
	mySlice_x := mySlice
	mySlice[0] = 1
	mySlice_x[1] = 2
	mySlice[2] = 3
	fmt.Println(mySlice, mySlice_x)
	mySlice = append(mySlice, 4)
	mySlice_x[1] = 0
	fmt.Println(mySlice, mySlice_x)
}

func GetSlice(len, cap int) []int{
	return make([]int, len, cap)
}