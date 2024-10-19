# After turning in renode server try below commands for board specific testing and simuation

# to create machine architecture first time
mach create
machine LoadPlatformDescription @platforms/boards/stm32f4_discovery-kit.repl
# you have to copy location of .\build\src\STM32F4Template.elf
# sysbus LoadELF -> load the elf
sysbus LoadELF "/usr/src/embedded_emulator/data/emulator/cortex-m7-emulator/renode_application/data/renode/build/src/STM32F4Template.elf"
# open a terminal to display UART data
showAnalyzer sysbus.usart2
# run our simulation
start


# macro reset
# """
#     sysbus LoadELF $bin_path
# """

# runMacro $reset

# Command to debug the application with GDB
 machine StartGdbServer 3333