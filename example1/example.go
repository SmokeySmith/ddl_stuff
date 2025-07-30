package main

/*
#cgo CFLAGS: -I../bin
#cgo LDFLAGS: -L../bin -lmyLib

#include "libmyLib.h"
*/
import "C"
import "fmt"

func main() {
    C.OkMessage()
    fmt.Println("And imported into a go project.")
}
