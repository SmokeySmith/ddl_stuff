#!/bin/bash

case "$OSTYPE" in
  linux* | bsd*)   
      if [$LD_LIBARY_PATH == ""]; then
          export LD_LIBRARY_PATH=$PWD/bin:$LD_LIBRARY_PATH
      fi
      ;;
  darwin*)
      if [$DYLD_LIBRARY_PATH == ""]; then
          export DYLD_LIBRARY_PATH=$PWD/bin:$DYLD_LIBRARY_PATH
      fi
      ;;
  msys* | cygwin* | win* | *)
      echo "unknown OSTYPE"
      ;;
esac
