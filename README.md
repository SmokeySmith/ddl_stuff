# DLL Attack Demo

This repository demonstrates building, using, and "attacking" dynamic libraries (DLLs/shared libraries) in Go and C. It provides example scripts to compile libraries, run Go executables that import these libraries, and simulate a binary-level attack by patching library files.

## Quick Start

### 1. Build everything
```sh
./build.sh
```
This compiles the C and Go libraries and two example Go executables into the `bin/` directory.

### 2. Run the examples
```sh
./run.sh
```
- Runs `example1` (Go project importing a Go library)
- Runs `example2` (Go project importing a C library)

### 3. Simulate an attack
```sh
./attack.sh
```
This script demonstrates patching a compiled C library binary with malicious content.

### 4. Re-run to see impact
```sh
./run.sh
```

## Binary Diff & Editing Tips

- To compare two binaries in a readable way:
  ```sh
  colordiff -y <(xxd <binary_1>) <(xxd <binary_2>)
  ```
- Use `hexedit` as a tool for viewing and editing binary files directly.

## Scripts Overview

- `build.sh` — Cleans and builds all libraries and executables.
- `run.sh` — Runs Go executables that use the built libraries.
- `attack.sh` — Simulates a binary patch on the C library.
- `clean.sh` — Cleans the build output.
- `getExt.sh` / `setLibPath.sh` — Handle platform-specific library extensions and paths.

## Requirements

- Go
- GCC
- Bash

## Purpose

This repo is for educational/demo purposes, showing how dynamic libraries are built, loaded, and can be attacked or patched at the binary level.
