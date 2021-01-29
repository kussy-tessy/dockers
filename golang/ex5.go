package main

import (
	"fmt"
)

type Car struct{
	gasoline int
}

func(car *Car) run(){
	if car.gasoline >= 10 {
		fmt.Println("ぷっぷー")
		car.gasoline -= 10
	} else {
		fmt.Println("走れないよ！")
	}
}

func NewCar() Car{
	car := Car{gasoline: 100}
	return car
}

func main(){
	car1 := NewCar()
	for i := 0; i <= 12; i++ {
		car1.run()
	}
	car2 := NewCar()
	fmt.Println(&car1)
	fmt.Println(&car2)

}