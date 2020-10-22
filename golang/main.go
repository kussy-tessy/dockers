package main

import (
    "fmt";
    "strconv"
)

func main() {
    sli := []string {}

    for i := 0; i <= 100; i++{
        if canDevide(i, 15){
            sli = append(sli, "FizzBuzz")
        } else if p := 3; canDevide(i, p) {
            sli = append(sli, "Fizz")
        } else if p := 5; canDevide(i, p) {
            sli = append(sli, "Buzz")
        } else {
            sli = append(sli, strconv.Itoa(i))
        }
    }

    for _, val := range sli {
        fmt.Println(val)
    }
}

func canDevide(n int, mod int) bool{
    return n % mod == 0
}