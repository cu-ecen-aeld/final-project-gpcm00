#!/bin/bash

curr_dir=$(realpath $(dirname $0))

make -C ../buildroot savedefconfig BR2_DEFCONFIG=$curr_dir/configs/custom_rpi_defconfig && echo "Saved defconfig"
