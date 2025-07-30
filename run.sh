#!/bin/bash
source ./setLibPath.sh

echo "Example using go library imported into go project"
./bin/example1
echo "\n"

echo "Example using C library imported into go project"
./bin/example2
echo "\n"
