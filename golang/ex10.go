package main

import (
	"fmt"
)

type Animal interface{
	Say() // 動物が「鳴く」ってぴったりの英語ないんだね
}

type Dog struct{}
func(dog *Dog) Say(){
	fmt.Println("わんわん")
}

type Cat struct{}
func(cat *Cat) Say(){
	fmt.Println("にゃんにゃん")
}

func MakeSay(animal Animal){
	animal.Say()
}

func main(){
	dog := &Dog{}
	cat := &Cat{}

	MakeSay(dog)
	MakeSay(cat)
}