# Write a C program to create an Orphan process and verify the output of your program with the 'ps' command.

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main() {
    int pid;

    // Create a child process
    pid = fork();

    if (pid < 0) {
        // Fork failed
        perror("Fork failed"); // Prints error message to stderr
        exit(1);               // Exit program with failure status
    }
    else if (pid == 0) {
        // Child process
        // At this point, child has been created successfully
        printf("Child process (PID: %d) started. Parent PID is: %d\n", getpid(), getppid());

        sleep(5); // Wait to let parent terminate (demonstrates orphan process)

        // After parent exits, child becomes an orphan and is adopted by init/systemd (PID usually 1)
        printf("Child process (PID: %d) is now an orphan. New parent PID is: %d\n", getpid(), getppid());

        sleep(10); // Keep child alive for observation
        exit(0);   // Child process exits successfully
    }
    else {
        // Parent process
        printf("Parent process (PID: %d) created child with PID: %d\n", getpid(), pid);

        // Parent is terminating immediately
        printf("Parent process (PID: %d) is terminating.\n", getpid());
        exit(0); // Parent process exits
    }

    return 0; // End of program (never reached in this case)
}
