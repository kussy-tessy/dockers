package main

import (
	"fmt"
	"math/rand"
	"time"
)

func main(){
	ch1 := make(chan bool)
	ch2 := make(chan bool)
	rand.Seed(time.Now().UnixNano())

	go func(ch chan bool) {
		for i := 0; i < 5; i++{
			fmt.Println("チャネル1")
			time.Sleep(1 * time.Second)
		}
		ch1 <- true
	}(ch1)

	go func(ch chan bool) {
		for i := 0; i < 3; i++ {
			fmt.Println("チャネル2")
			time.Sleep(1 * time.Second)
		}
		ch2 <- true
	}(ch2)

	done1 := false
	done2 := false

	for {
		select{
			case done1 = <- ch1: {
				fmt.Println("チャンネル1の値を受信した！")
			}
			case done2 = <- ch2: {
				fmt.Println("チャンネル2の値を受信した！")
			}
			default: {
				if done1 && done2 {
					fmt.Println("終わった！")
					return
				}
				// fmt.Println("まだかなー")
			}
		}
	}
}