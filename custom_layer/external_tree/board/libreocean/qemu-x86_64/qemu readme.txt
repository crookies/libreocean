This is the qemu command line I am using:

qemu-system-x86_64 -M pc -kernel output/images/bzImage -drive file=output/images/rootfs.ext2,if=virtio,format=raw -append root=/dev/vda -net nic,model=virtio -net user,hostfwd=tcp::5555-:22 -vga vmware -m 2Gexi
