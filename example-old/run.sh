#!/bin/bash

echo "This is an example using Lua 5.3"

source ../bin/wagon load 5.3

pushd ..
luarocks make
popd

wagon install example.rockspec

lua example.lua && echo "Success!"

