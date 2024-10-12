#include <stdint.h>
#include <stdio.h>

// Function prototype for _write
int _write(int file, char *ptr, int len);

int main(void) {
    const char *message = "Hello, Bare Metal!\n";
    _write(0, (char *)message, 14); // Call write function to send message

    while (1) {
        // Infinite loop
    }
    return 0;
}
