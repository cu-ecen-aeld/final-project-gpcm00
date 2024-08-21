curr_dir=$(realpath $(dirname $0))

output_image=$curr_dir/../buildroot/output/images

echo $output_image

qemu-system-aarch64 \
    -M raspi3b -nographic \
    -kernel $output_image/zImage \
    -dtb $output_image/bcm2710-rpi-3-b.dtb \
    -sd $output_image/sdcardqemu.img \
    -m 1G \
	-append "console=ttyAMA0 root=/dev/mmcblk0p2 rootfstype=ext4 rw" \
	-serial stdio		\
    -device usb-net,netdev=net0 -netdev user,id=net0,hostfwd=tcp::5555-:22
	#-netdev user,id=eth0,hostfwd=tcp::552-:22 \
	#-device virtio-net-device,netdev=eth0 
