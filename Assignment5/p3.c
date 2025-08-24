# Write a C program to create a Zombie process and verify the output of your program with the 'ps' command.


#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main() {
    // Create a new process
    int pid = fork();

    if (pid > 0) {
        // Parent process
        // 'pid' contains the child's PID
        printf("Parent (PID: %d) created child (PID: %d)\n", getpid(), pid);
        printf("Parent is sleeping now for 10 seconds\n");
        sleep(10); // Keep parent alive to observe the child has exited
    }
    else if (pid == 0) {
        // Child process
        printf("Child process (PID: %d) exiting immediately\n", getpid());
        exit(0); // Child exits immediately
    }
    else {
        // Fork failed
        perror("Fork Failed"); // Print error message
        exit(1); // Exit with failure
    }

    return 0; // End of program
}
