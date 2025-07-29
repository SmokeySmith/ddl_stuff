#include <stdio.h>

// Does this mean i can put hacker on my linkedin profile ?
void someNewFunction() {
    printf("Some new function an attack has injected !!!\n");
    printf("Now I do evil thing and crash your program hahahah\n");

    // de-referncing a NULL pointer basically refer to uninitialized memory usually causing an instance crash
    int *ptr = NULL;
    *ptr = 10;

    printf("MUHAHHAHA\n");
}

void OkMessage() {
    printf("All you programs are belong to us!!!\n");
    someNewFunction();
}
