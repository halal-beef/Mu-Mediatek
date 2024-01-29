## @file
#
#  Copyright (c) 2011-2015, ARM Limited. All rights reserved.
#  Copyright (c) 2014, Linaro Limited. All rights reserved.
#  Copyright (c) 2015 - 2016, Intel Corporation. All rights reserved.
#  Copyright (c) 2018, Bingxing Wang. All rights reserved.
#
#  SPDX-License-Identifier: BSD-2-Clause-Patent
#
##

################################################################################
#
# Defines Section - statements that will be processed to create a Makefile.
#
################################################################################
[Defines]
  PLATFORM_NAME                  = achilles6
  PLATFORM_GUID                  = f54e021f-3f08-4971-9860-56892e7e78cb
  PLATFORM_VERSION               = 0.1
  DSC_SPECIFICATION              = 0x00010005
  OUTPUT_DIRECTORY               = Build/achilles6Pkg-$(ARCH)
  SUPPORTED_ARCHITECTURES        = AARCH64
  BUILD_TARGETS                  = DEBUG|RELEASE
  SKUID_IDENTIFIER               = DEFAULT
  FLASH_DEFINITION               = achilles6Pkg/achilles6.fdf

[LibraryClasses.common]
  PlatformMemoryMapLib|achilles6Pkg/Library/PlatformMemoryMapLib/PlatformMemoryMapLib.inf

[PcdsFixedAtBuild.common]
  # Platform-specific
  gArmTokenSpaceGuid.PcdSystemMemoryBase|0x80000000         # Starting address
!if $(RAM_SIZE) == 2
  gArmTokenSpaceGuid.PcdSystemMemorySize|0x80000000         # 2GB Size
!elseif $(RAM_SIZE) == 4
  gArmTokenSpaceGuid.PcdSystemMemorySize|0x100000000         # 4GB Size
!else
!error "Invaild RAM Size! Use 2 or 4."
!endif

  gEfiMdeModulePkgTokenSpaceGuid.PcdFirmwareVendor|L"UsrBinLuna"   # Device Maintainer

  gArmTokenSpaceGuid.PcdCpuVectorBaseAddress|0x42080000

  gEmbeddedTokenSpaceGuid.PcdPrePiStackBase|0x42030000
  gEmbeddedTokenSpaceGuid.PcdPrePiStackSize|0x00040000      # 256K stack

  # SmBios
  gMediatekPkgTokenSpaceGuid.PcdSmbiosSystemVendor|"Lenovo"
  gMediatekPkgTokenSpaceGuid.PcdSmbiosSystemModel|"Tab M10 FHD Plus 2nd Gen"
  gMediatekPkgTokenSpaceGuid.PcdSmbiosSystemRetailModel|"TB-X606"
  gMediatekPkgTokenSpaceGuid.PcdSmbiosSystemRetailSku|"Tab_M10_FHD_TB-x606"
  gMediatekPkgTokenSpaceGuid.PcdSmbiosBoardModel|"Tab M10 FHD Plus 2nd Gen"

  # Simple FrameBuffer
  gMediatekPkgTokenSpaceGuid.PcdMipiFrameBufferWidth|1216
  gMediatekPkgTokenSpaceGuid.PcdMipiFrameBufferHeight|1920
  gMediatekPkgTokenSpaceGuid.PcdMipiFrameBufferPixelBpp|32

[PcdsDynamicDefault.common]
  gEfiMdeModulePkgTokenSpaceGuid.PcdVideoHorizontalResolution|1216
  gEfiMdeModulePkgTokenSpaceGuid.PcdVideoVerticalResolution|1920
  gEfiMdeModulePkgTokenSpaceGuid.PcdSetupVideoHorizontalResolution|1216
  gEfiMdeModulePkgTokenSpaceGuid.PcdSetupVideoVerticalResolution|1920
  gEfiMdeModulePkgTokenSpaceGuid.PcdSetupConOutColumn|90
  gEfiMdeModulePkgTokenSpaceGuid.PcdSetupConOutRow|80
  gEfiMdeModulePkgTokenSpaceGuid.PcdConOutColumn|90
  gEfiMdeModulePkgTokenSpaceGuid.PcdConOutRow|80

!include MT6765Pkg/MT6765Pkg.dsc.inc
