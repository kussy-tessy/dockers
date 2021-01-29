package main

import (
	"fmt"
)

func main() {
	slice := []int {0, 1, 2, 3, 4}
	slice = delete(slice, 2)
	
	for i, v := range slice{
		fmt.Println(i, v)
	}
}

func delete(slice []int, removeAt int) []int {
	return append(slice[:removeAt], slice[removeAt+1:]...)
}