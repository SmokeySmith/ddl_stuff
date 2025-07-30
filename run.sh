#!/bin/bash
source ./setLibPath.sh

red="\033[31m"
reset="\033[0m"

echo -e "${red}Example using go library imported into go project${reset}"
./bin/example1
echo ""

echo -e "${red}Example using C library imported into go project${reset}"
./bin/example2
echo ""
