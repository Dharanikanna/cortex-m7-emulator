#setting debugger path
export PATH=$PATH:/home/uif02672/qemu/emulator_setup/cortex-m7-emulator/arm-gnu-toolchain-13.3.rel1-x86_64-arm-none-eabi/bin

#loading application on debugger
arm-none-eabi-gdb app.elf

#after gdb enables run the below command to run target port
target remote localhost:1234