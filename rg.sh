#!/bin/bash

#Program: Cuboids 
#Author: Elizabeth Orellana, Section 07
#Email: eorellana96@csu.fullerton.edu


#Purpose: script file to run the program files together.
#Clear any previously compiled outputs
rm *.o
rm *.o
rm *.lis

echo "Assemble volume.asm"
nasm -f elf64 -l volume.lis -o volume.o volume.asm -g -gdwarf

echo "compile geometry.cpp using the g++ compiler standard 2017"
g++ -c -Wall -no-pie -m64 -std=c++17 -o cube.o cube.cpp -g

echo "Link object files using the gcc Linker standard 2017"
g++ -m64 -no-pie -o final.out volume.o cube.o -std=c++17 -g

echo "Run the Triangle Program:"
gdb ./final.out 



echo "Script file has terminated."

#Clean up after program is run
rm *.o
rm *.out
rm *.lis