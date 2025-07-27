package main

/*
#cgo CFLAGS: -I../bin
#cgo LDFLAGS: -L../bin -lmyLib_c

#include "myLib_c.h"
*/
import "C"

func main() {
    C.OkMessage()
}
