# Compiler settings 🪓
CXX := "clang++"
NVCC := "nvcc"
CXXFLAGS := "-std=c++17 -Wall -Wextra -O2"
CUDAFLAGS := "-arch=sm_70 -O2"

# Main source files 🧺
SRC := "main.cpp"
CU_SRC := "kernel.cu"
OUT := "main"

# Initialize project structure 🧺
init:
    echo "🌾 Creating project ..."
    mkdir -p ./src ./include ./build
    echo "// main.cpp" > ./src/main.cpp
    echo "// kernel.cu" > ./src/kernel.cu
    echo "// utils.h" > ./include/utils.h
    touch ./README.md
    echo "🐄 Project initialized."

# Build C++ only 🐄
build:
    echo "🌾 Building C++ project..."
    {{CXX}} {{CXXFLAGS}} {{SRC}} -o {{OUT}}

# Build CUDA project 🐖
build-cuda:
    echo "🪓 Building CUDA project..."
    {{NVCC}} {{CUDAFLAGS}} {{CU_SRC}} -o {{OUT}}

# Run executable 🐑
run:
    echo "🐓 Running ./{{OUT}}..."
    ./{{OUT}}

# Format C++ files 🪚
fmt:
    echo "🧺 Formatting C++ files..."
    clang-format -i *.cpp *.h *.cu

# Clean build files 🐖
clean:
    echo "🪓 Cleaning build artifacts..."
    rm -f {{OUT}}

# Debug with gdb 🐄
debug:
    echo "🌾 Launching gdb..."
    gdb ./{{OUT}}

# Debug with cuda-gdb (for CUDA builds) 🐑
cuda-debug:
    echo "🐓 Launching cuda-gdb..."
    cuda-gdb ./{{OUT}}

