//
// Build: g++ cpu_load.cpp -lpthread -lrt -o cpu_load -static -Wl,--build-id=none -s
//
// Usage: ./cpu_load <cpu_cores> <cpu_usage>
//

#include <stdio.h>
#include <pthread.h>
#include <time.h>
#include <math.h>
#include <unistd.h>

typedef long long int int64;
int num_threads = 1; // CPU core nums set cores
int cpu_usage = 10; // CPU utilization rate
int INTERVAL = 100;

// time unit is "ms"
int64 GetTickCount()
{
    timespec now;
    int64 sec, nsec;

    clock_gettime(CLOCK_MONOTONIC, &now);
    sec = now.tv_sec;
    nsec = now.tv_nsec;

    return sec * 1000 + nsec / 1000000;
}

void* CPUCost(void *args)
{
    int busyTime = INTERVAL * cpu_usage / 100;
    int idleTime = INTERVAL - busyTime;
    int64 startTime = 0;

    printf("[core] set core usage to %d\n", cpu_usage);

    /*
     * within INTERVAL ms, INTERVAL = busyTime + idleTime,
     * spend busyTime ms to let cpu busy,
     * spend idleTime ms top let cpu idle
     */
    while (true) {
        startTime = GetTickCount();
        while((GetTickCount() - startTime) <= busyTime);
        usleep(idleTime * 1000);
    }
}

int main(int argc, char *argv[])
{
    printf("[main] set cpu core to: %s\n", argv[1]);
    printf("[main] set cpu usage to: %s\n", argv[2]);

    num_threads = atoi(argv[1]);
    cpu_usage = atoi(argv[2]);
    pthread_t t[num_threads];
    int ret;

    for(int i = 0; i < num_threads; i++) {
        ret = pthread_create(&t[i], NULL, CPUCost, NULL);
        if(ret) {
            printf("thread create error.\n");
        }
    }

    pthread_exit(NULL);
    return 0;
}
