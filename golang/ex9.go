package main

import (
	"fmt"
)

func main(){
	myMap := make(map[string]string)
	myMap["北海道"] = "札幌市"
	myMap["宮城県"] = "仙台市"
	myMap["神奈川県"] = "横浜市"

	fmt.Println(myMap["北海道"])

	for k, v := range myMap{
		fmt.Println(k, v)
	}
}