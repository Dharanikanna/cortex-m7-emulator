#include <sys/stat.h>
#include <unistd.h>
#include <stdint.h> // Include for uint32_t

// Assume we have a defined _end symbol marking the end of .bss
extern char _end;

// Function prototypes
void uart_write_char(char c);

// UART register structure
typedef struct {
    volatile uint32_t STATUS; // Status register
    volatile uint32_t DATA;   // Data register
    // Other registers can be defined here as needed
} UART_TypeDef;

// Example base address for UART, change as necessary for your MCU
#define UART_BASE ((UART_TypeDef *)0x40011000) // Replace with your actual UART base address
#define UART_TX_READY (1 << 7) // Replace with your UART TX ready bit mask

void* _sbrk(int increment) {
    static char* heap_end = 0;
    char* prev_heap_end;

    if (heap_end == 0) {
        heap_end = (char*)&_end;  // Initialize the heap end pointer
    }

    prev_heap_end = heap_end;
    heap_end += increment; // Move the heap pointer

    return (void*)prev_heap_end; // Return the previous end of the heap
}

void _exit(int status) {
    while (1) {
        // Loop indefinitely, as there is no OS to return to
    }
}

int _close(int file) {
    return -1; // Function not implemented, return -1
}

int _fstat(int file, struct stat *st) {
    st->st_mode = S_IFCHR; // Indicate it's a character device
    return 0;
}

int _isatty(int file) {
    return 1; // Assume all files are terminals
}

int _lseek(int file, int ptr, int dir) {
    return 0; // Do nothing, always return 0 for simplicity
}

int _read(int file, char *ptr, int len) {
    return 0; // Return 0 indicating no data read
}

int _write(int file, char *ptr, int len) {
    for (int i = 0; i < len; i++) {
        uart_write_char(ptr[i]); // Implement your UART transmission here
    }
    return len; // Return the number of characters written
}

void uart_write_char(char c) {
    // Wait until UART is ready to send
    while (!(UART_BASE->STATUS & UART_TX_READY)) {
        // Busy-wait loop
    }
    UART_BASE->DATA = c; // Send character
}
