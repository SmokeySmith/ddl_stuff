package main

import "C"
import "fmt"

//export OkMessage
func OkMessage() {
    fmt.Println("Nice happy message")
}

func main(){}
