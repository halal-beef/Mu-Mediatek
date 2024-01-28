#!/bin/bash

cat ./BootShim/AARCH64/BootShim.bin "./Build/achilles6Pkg-AARCH64/${_TARGET_BUILD_MODE}_CLANG38/FV/ACHILLES6_UEFI.fd" > "./ImageResources/bootpayload.bin"||exit 1

gzip -f ./ImageResources/bootpayload.bin||_error "\nFailed to compress payload!\n"

python3 ./ImageResources/mkbootimg.py \
  --tags_offset 0x07808000 \
  --second_offset 0xbff88000 \
  --ramdisk_offset 0x11a88000 \
  --pagesize 2048 \
  --kernel_offset 0x00008000 \
  --header_version 2  \
  --dtb_offset 0x07808000 \
  --cmdline "bootopt=64S3,32N2,64N2" \
  --base 0x40078000 \
  --ramdisk "./ImageResources/ramdisk" \
  --dtb "./ImageResources/DTBs/achilles6.dtb" \
  --kernel "./ImageResources/bootpayload.bin.gz" \
  -o "Mu-achilles6.img" \
  ||_error "\nFailed to create Android Boot Image!\n"
