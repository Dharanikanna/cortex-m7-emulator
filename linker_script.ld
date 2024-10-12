MEMORY
{
    FLASH (rx) : ORIGIN = 0x00000000, LENGTH = 128K  /* Adjust as necessary */
    RAM (rw)   : ORIGIN = 0x20000000, LENGTH = 32K    /* Adjust as necessary */
}

SECTIONS
{
    .text : {
        KEEP(*(.isr_vector))
        *(.text*)
        *(.rodata*)
    } > FLASH

    .data : {
        *(.data*)
    } > RAM

    .bss : {
        *(.bss*)
    } > RAM

    _estack = ORIGIN(RAM) + LENGTH(RAM);
    _end = .;  /* End of .bss */
}
