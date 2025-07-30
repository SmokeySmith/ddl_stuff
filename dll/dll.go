package main

import "C"
import "fmt"

//export OkMessage
func OkMessage() {
    fmt.Println("Hello I am a dynamic library built in go.")
}

func main(){}
