package main

import (
	"fmt"
)

func main(){
	mySlice := []string{"hoge", "fuga"}
	mySlice = append(mySlice, "piyo")
	fmt.Println(mySlice)

	myArr := [4]string{"foo", "bar", "baz", "qux"}
	mySlice2 := myArr[2:4]
	fmt.Println(mySlice2)
	myArr[2] = "bazbaz"
	fmt.Println(mySlice2)

	mySlice3 := make([]string, 2)
	mySlice3[0] = "spam"
	mySlice3[1] = "ham"
	fmt.Println(mySlice3)
	// mySlice3[2] = "eggs" ←これはpanicになる
}