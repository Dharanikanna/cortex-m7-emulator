#setting debugger path
export PATH=$PATH:/usr/src/embedded_emulator/data/emulator/cortex-m7-emulator/arm-gnu-toolchain-13.3.rel1-x86_64-arm-none-eabi/bin

#loading application on debugger
# arm-none-eabi-gdb app.elf
arm-none-eabi-gdb /usr/src/embedded_emulator/data/emulator/cortex-m7-emulator/renode_application/data/renode/build/src/STM32F4Template.elf

#after gdb enables run the below command to run target port
target remote localhost:1234