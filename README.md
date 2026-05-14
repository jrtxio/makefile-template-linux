# makefile-template-linux

A Makefile template for Linux/macOS C and C++ projects.

The example project converts a binary file to Intel HEX format.

## Features

- Automatic source file discovery (`find`-based)
- Automatic dependency tracking (`.d` files via `-MMD -MP`)
- Separate build directory (`build/`)
- Supports C, C++, and assembly sources
- VS Code build/debug tasks included

## Usage

```bash
# Build
make

# Run the example
./build/bin2hex input.bin output.hex

# Clean
make clean
```

## Project Structure

```
.
├── Makefile
├── src/          # Source files
│   ├── main.c
│   ├── bin2hex.c
│   └── bin2hex.h
└── build/        # Build output (generated)
```
