//Program: Cuboids 
//Author: Elizabeth Orellana, Section 07
//Email: eorellana96@csu.fullerton.edu

#include <cstdio>

extern "C" double cube();

int main()
{
    printf("Welcome to cuboids programmed by Elizabeth Orellana\n");
    double ret = cube();
    printf("\nFunction main recieved this number: %.2lf and will view it.\n", ret);
    printf("\nWe strive to please the customer. Enjoy your cuboids\n");
    return 0;
}