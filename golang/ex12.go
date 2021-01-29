package main

import (
	"fmt"
)

type Animal struct {
	name string
}

type Cat struct{
	ownerName string
}

func NewAnimalPointer(name string) *Animal {
	animal := &Animal{}
	return animal
}

func NewAnimalStruct(name string) Animal{
	animal := Animal{}
	return animal
}

func(animal Animal) setNameS(name string) {
	animal.name = name
}

func(animal *Animal) setNameP(name string) {
	animal.name = name
}

func main(){
	// Animalについて
	// var animals Animal = NewAnimalStruct("ANIMAL-X") // Animal型の変数
	// fmt.Println(animals)
	// animals.setNameS("ANIMAL-Y")
	// fmt.Println(animals)

	// var animalp *Animal = NewAnimalPointer("ANIMAL-A") // Animal*型の変数
	// animalp.setNameP("ANIMAL-B")
	// fmt.Println(animalp)

	// var animald Animal = Animal{}
	// animald.name = "ほげ"
	// fmt.Println(animald)

	// animald2 := func(animal Animal) *Animal {
	// 	animal.name = "ふが"
	// 	return &animal
	// }(animald)

	// fmt.Println(animald2)

	animal := &Animal{"foo"}
	animal2 := func(animal *Animal) *Animal{
		fmt.Println(animal)
		animal.name = "bar"
		return animal
	}(animal)
	fmt.Println(animal2)
}