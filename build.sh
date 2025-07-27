#!/bin/bash
source ./getExt.sh
# DL_EXT=$(./getExt.sh)
./clean.sh

cp ./hell/myLib_c.h ./bin/
if [$LD_LIBARY_PATH == ""]; then
    export LD_LIBRARY_PATH=/home/joey/dev/dll_stuff/bin:$LD_LIBRARY_PATH
fi
# build our C binaries
gcc -shared -fPIC -o "./bin/libmyLib_c.${DL_EXT}" ./hell/mylib.c
# make a clone of mylib to demonstrate that the same binary is produced
gcc -shared -fPIC -o "./bin/libmyLib_clone_c.${DL_EXT}" ./hell/mylib.c
gcc -shared -fPIC -o "./bin/libmyAttackedLib_c.${DL_EXT}" ./hell/attacker.c
go build -o "./bin/libmyLib.${DL_EXT}" -buildmode=c-shared ./dll/dll.go
# build our examples
go build -o ./bin/example1 ./example1/example.go
go build -o ./bin/example2 ./example2/example.go
