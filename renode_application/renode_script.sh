#demo application
# $ git clone https://github.com/PhanCuong91/data.git
$ cd data/renode
# $ .\build.bat
# mkdir build
cd build && cmake -G "Unix Makefiles" -D "CMAKE_TOOLCHAIN_FILE=../CMake/GNU-ARM-Toolchain.cmake" ../
cmake . > cmake_log.txt 2>&1
make > build_log.txt 2>&1
# Final result is ./build/src/STM32F4Template.elf that was generated.
# start Renode
$ renode