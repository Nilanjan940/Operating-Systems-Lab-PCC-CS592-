#Write a C program to create a child process and print the PID & PPID from both the parent and child processes.
 Also verify the output of your program with the 'ps' command.

#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>

int main() {
    pid_t pid;

    // Create a child process
    pid = fork();

    if (pid < 0) {
        // Fork failed
        printf("Error: Fork failed\n");
        return 1;
    }

    if (pid == 0) {
        // Child process
        printf("Child Process:\n");
        printf("PID : %d\n", getpid());   // Child's PID
        printf("PPID: %d\n", getppid());  // Parent's PID
        sleep(10); // Keep child alive for verification
    } else {
        // Parent process
        printf("Parent Process:\n");
        printf("PID : %d\n", getpid());   // Parent's PID
        printf("PPID: %d\n", getppid());  // Parent's parent PID (usually shell)
        sleep(10); // Keep parent alive for verification
    }

    return 0;
}
