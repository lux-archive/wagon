#!/bin/bash

echo "This is an example using Lua 5.3"

source ../bin/wagon 5.3

lua ../bin/wagon-deps.lua example.rockspec

lua example.lua && echo "Success!"

