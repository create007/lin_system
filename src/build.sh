#!/bin/bash




# 使用dd命令创建指定大小的空白镜像文件
dd if=boot.bin of=master.img bs=512 count=1 conv=notrunc

echo "镜像创建完成！"
