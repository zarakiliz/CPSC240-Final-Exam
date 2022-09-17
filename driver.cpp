//Program: Blank Program
//Author: Elizabeth Orellana, Section 07
//Email: eorellana96@csu.fullerton.edu

#include <cstdio>

extern "C" double blank();

int main()
{
    //printf("Please enter a float: \n");
    double ret = blank();
    printf("\nFunction main recieved this number: %.2lf and will view it.\n", ret);
    //printf("\nWe strive to please the customer. Enjoy your cuboids\n");
    return 0;
}