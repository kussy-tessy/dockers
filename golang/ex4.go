package main

import(
	"fmt"
)

type Human struct{
	name string
	age int
}

type Employee struct{
	Human
	job string
}

func main(){
	var human1 Human
	human1.name = "ほげ太郎"
	human1.age = 2

	human2 := Human{"ぴよ太郎", 20}
	human3 := Human{name: "ふが次郎", age: 50}

	fmt.Println(human1)
	fmt.Println(human2)
	fmt.Println(human3)

	// これは失敗する
	// employee := Employee{name: "櫛田", age: 30, job: "プログラマ"}
	employee := Employee{
		Human : Human{
			name: "櫛田",
			age: 30,
		},
		job: "プログラマ",
	}

	var employee2 Employee
	employee2.name = "櫛田2"
	employee2.age = 31
	employee2.job = "エンジニア"

	fmt.Println(employee)
	fmt.Println(employee2)
}