#!/bin/bash

# Define a variable for the dynamic library extension
DL_EXT=""

# Check the operating system type
case "$OSTYPE" in
  linux*)   DL_EXT="so" ;;          # Linux
  darwin*)  DL_EXT="dylib" ;;       # macOS (Darwin)
  cygwin*)  DL_EXT="dll" ;;         # Cygwin (Windows-like environment)
  msys*)    DL_EXT="dll" ;;         # Git Bash/MSYS2 (Windows-like environment)
  win*)     DL_EXT="dll" ;;         # Native Windows (e.g., WSL when running Windows binaries or specific shells)
  bsd*)     DL_EXT="so" ;;          # FreeBSD, OpenBSD, NetBSD (often .so, sometimes .a for static)
  *)        DL_EXT="so" ;;          # Default for unknown or other Unix-like systems
esac

echo "Using .${DL_EXT} as the dynamic library extension"
