package main

/*
#cgo CFLAGS: -I../bin
#cgo LDFLAGS: -L../bin -lmyLib_c

#include "myLib_c.h"
*/
import "C"
import "fmt"

func main() {
    C.OkMessage()
    fmt.Println("Imported into a go project.")
}
