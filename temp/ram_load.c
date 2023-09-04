//
// Build: gcc ram_load.c -o ram_load -static -Wl,--build-id=none -s
//
// Usage: ./ram_load [assign_mb_size]
//
// Reference:
//   https://www.linuxatemyram.com/play.html
//   https://unix.stackexchange.com/questions/48668/how-to-increase-memory-usage-manually
//

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

int main(int argc, char** argv) {
    int max = 128;
    int mb = 0;
    char* buffer;

    if(argc > 1)
        max = atoi(argv[1]);

    while((buffer=malloc(1024*1024)) != NULL && mb != max) {
        memset(buffer, 0, 1024*1024);
        mb++;
    }
    printf("Allocated %d MB\n", mb);
    pause();
    return 0;
}
