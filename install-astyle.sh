#!/bin/bash
cd /astyle/astyle
mkdir as-gcc-exe
cd as-gcc-exe
cmake ..
make
make install
rm -rf /astyle