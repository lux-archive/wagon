#!/bin/bash

../bin/wagon build

../bin/wagon load example.rockspec

../bin/wagon drive lua example.lua && echo "Success!"

