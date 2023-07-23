
boot.bin: boot.asm
	nasm -f bin boot.asm -o boot.bin

master.img: boot.bin
#这里需要手动敲下命令, 应该是版本问题
	yes | bximage bximage -q -hd 16  -size=512 -mode=flat master.img
	dd if=boot.bin of=master.img bs=512 count=1 conv=notrunc


.PHONY: clean
clean:
	rm -rf *.bin
	rm -rf *.img

.PHONY: usb
usb: boot.bin /dev/sdb
	sudo dd if=/dev/sdb of=tmp.bin bs=512 count=1 conv=notrunc
	cp tmp.bin usb.iso
	sudo rm tmp.bin
	dd if=boot.bin of=usb.iso bs=446 count=1 conv=notrunc
	sudo dd if=usb.iso of=/dev/sdb bs=512 count=1 conv=notrunc
	rm usb.iso

.PHONY: bochs
bochs: master.img
	bochs -q

#
