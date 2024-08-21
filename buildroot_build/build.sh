#!/bin/bash

# filters windows paths form PATH
filter_path() {
  IFS=':' read -ra ADDR <<< "$PATH"
  new_path=""
  for i in "${ADDR[@]}"; do
    if [[ "$i" != *"/mnt/c/"* ]] && [[ "$i" != *" "* ]]; then
      new_path="$new_path:$i"
    fi
  done
  new_path="${new_path#:}"
  echo "$new_path"
}

curr_dir=$(realpath $(dirname $0))

ORIGINAL_PATH=$PATH
PATH=$(filter_path)		# ommit this function if not using wsl

cd $curr_dir

if [ ! -e ../buildroot/.config ]
then
	echo "Building with defconfig"
	make -j$(nproc) -C ../buildroot defconfig BR2_EXTERNAL=$curr_dir/rpi_build BR2_DEFCONFIG=$curr_dir/configs/custom_rpi_defconfig
else
	echo "Bulding with external $curr_dir/rpi_build"
	make -j$(nproc) -C ../buildroot BR2_EXTERNAL=$curr_dir/rpi_build
fi

PATH=$ORINAL_PATH
echo "PATH restored"
