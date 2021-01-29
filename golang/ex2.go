package main

import (
	"fmt"
	"time"
	"math/rand"
)

func main(){
	rand.Seed(time.Now().UnixNano())
	var score int
	for i := 0; i < 10; i++ {
		score = rand.Intn(101)
		if border := 60; score >= border{
			fmt.Println("合格")
		} else {
			fmt.Println("不合格")
		}
	}
}