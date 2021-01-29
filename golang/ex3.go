package main

import (
	"fmt"
)

func main(){
	var hoge = "hogeという文字列"
	var fuga *string // stringへのポインタ変数

	fmt.Printf("hogeの参照番地は、%pです\n", &hoge)
	fmt.Printf("fugaの参照番地は、%pです\n", fuga)

	fuga = &hoge
	fmt.Printf("fugaは、%sです\n", *fuga)
}