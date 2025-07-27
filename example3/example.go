package main

/*
#cgo CFLAGS: -I../bin
#cgo LDFLAGS: -L../bin -lmyAttackedLib_c

#include "myLib_c.h"
*/
import "C"

func main() {
    C.OkMessage()
}

