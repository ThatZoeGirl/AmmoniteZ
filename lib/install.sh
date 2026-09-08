#! /usr/bin/env bash

if [ "$(dirname "$0")" = "." ]; then
  rm -rf build
  cmake -S . -B build -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
  sudo cmake --install build
else
  echo "Excute this script in the lib directory!"
fi
