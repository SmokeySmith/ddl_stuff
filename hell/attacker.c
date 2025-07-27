#include <stdio.h>

void someNewFunction() {
    printf("Some new function an attack has injected !!!\n");
    printf("Now I do evil thing and crash your program hahahah\n");

    // de-referncing a NULL pointer basically really bad thing don't do this
    int *ptr = NULL;
    *ptr = 10;

    printf("MUHAHHAHA\n");
}

void OkMessage() {
    printf("All you programs are belong to us!!!\n");
    someNewFunction();
}
