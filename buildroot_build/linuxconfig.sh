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

make -j$(nproc) -C ../buildroot linux-menuconfig

PATH=$ORINAL_PATH
echo "PATH restored"
