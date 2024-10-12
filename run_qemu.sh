# arm-none-eabi-gcc -g -mcpu=cortex-m7 -mthumb -o hello.elf main.c syscalls.c startup.c -T linker_script.ld -nostartfiles

# compile application
arm-none-eabi-gcc -g -mcpu=cortex-m3 -mthumb -o app.elf main.c syscalls.c startup.c -T linker_script.ld -nostartfiles
#Run emulator
qemu-system-arm -machine lm3s6965evb -nographic -kernel app.elf -s -S -d in_asm,cpu

# -s: This option starts a GDB server on port 1234. It allows you to connect GDB to the QEMU instance for remote debugging.
# -S: This option pauses the CPU at startup, allowing you to connect GDB before the program starts executing.
# -g: This option will compile with debugging symbols. 
