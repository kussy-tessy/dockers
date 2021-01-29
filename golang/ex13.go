package main

import (
	"fmt"
	"time"
	"sync"
)

func main(){
	test3()
}

func test3(){
	wg := &sync.WaitGroup{}
	for i := 0; i < 3; i++ {
		go func() {
			wg.Add(1)
			defer wg.Done()
			fmt.Println("test")
			time.Sleep(time.Second * 1)
        }()
	}
	wg.Wait()
}

func test2(){
	// ch := make(chan interface{})

	// for i := 0; i < 5; i++{
	// 	fmt.Println(i)
	// 	go func(){
	// 		<-ch
	// 		fmt.Println(i)
	// 	}()
	// }

	// close(ch)
	// time.Sleep(time.Second * 2)

	done := make(chan interface{})

    for i := 0; i < 5; i++ {
        go func() {
            <-done
            fmt.Println("end", i)
			// time.Sleep(time.Second * 1)
        }()
    }

	close(done)
	time.Sleep(time.Second * 2)
}

func test1(){
	ch := make(chan interface{})

	go func() {
		defer fmt.Println("チャネルはcloseしました")
		defer close(ch)
		for i := 0; i < 3; i++{
			ch <- i
		}
	}()

	for num := range ch {
		fmt.Println("chの内容は、", num)
		time.Sleep(time.Second * 1)
	}
}