#include <stdint.h>

// Forward declaration of the default fault handlers.
void Reset_Handler(void);
void Default_Handler(void);

// The stack pointer (top of the stack)
extern uint32_t _estack;

// Vector Table
__attribute__((section(".isr_vector")))
void (* const g_pfnVectors[])(void) = {
    (void (*)(void))((uint32_t)&_estack), // Initial stack pointer
    Reset_Handler,                        // Reset handler
    Default_Handler,                      // NMI handler
    Default_Handler,                      // Hard Fault handler
    // Add other handlers as needed
};

// The reset handler
void Reset_Handler(void) {
    extern int main(void);
    main(); // Call the main function
}

// Default handler
void Default_Handler(void) {
    while (1);
}
