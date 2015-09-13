#!/bin/bash

sudo losetup /dev/loop0 HDD.img -o $((63 * 512))
sleep .10s
sudo mount /dev/loop0 /mnt2
sleep .10s

cd MODULES/ELF
make
cd ../TEST
make
cd ../../KERNEL
make
cd ../BOOT16
sudo nasm OSLOADER/osloader.s -o /mnt2/osloader.sys
cd ..
sudo cp MODULES/ELF/BIN/ELF.BIN /mnt2/bin/elf.bin
sudo cp MODULES/TEST/BIN/TEST.ELF /mnt2/bin/test.elf
sudo cp KERNEL/BIN/KERNEL.ELF /mnt2/bin/kernel.elf
sudo cp BOOT.CFG /mnt2/boot/boot.cfg

sleep .10s
sudo umount /dev/loop0
sleep .10s
sudo losetup -d /dev/loop0
sleep .10s
