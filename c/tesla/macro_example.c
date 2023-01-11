
#include <stdio.h>
#define FOO 0
#define MORE 1

int main() {
    #if defined FOO && MORE
        // will compile this since MORE and FOO together are not 0
        printf("#if works\n");
    #endif
    #ifdef FOO
        // will compile this
        printf("#ifdef works\n");
    #endif

    return 0;
}
