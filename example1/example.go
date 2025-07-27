package main

/*
#cgo CFLAGS: -I../bin
#cgo LDFLAGS: -L../bin -lmyLib

#include "libmyLib.h"
*/
import "C"

func main() {
    C.OkMessage()
}
