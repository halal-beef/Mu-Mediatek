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
  PLATFORM_NAME                  = WSP
  PLATFORM_GUID                  = f54e021f-3f08-4971-9860-56892e7e78cb
  PLATFORM_VERSION               = 0.1
  DSC_SPECIFICATION              = 0x00010005
  OUTPUT_DIRECTORY               = Build/WSPPkg-$(ARCH)
  SUPPORTED_ARCHITECTURES        = AARCH64
  BUILD_TARGETS                  = DEBUG|RELEASE
  SKUID_IDENTIFIER               = DEFAULT
  FLASH_DEFINITION               = WSPPkg/WSP.fdf
  BROKEN_CNTFRQ_EL0              = 0
  DISPLAY_USES_RGBA              = 0
  HAS_SPECIAL_BUTTON             = 0

[BuildOptions.common]
  *_*_*_CC_FLAGS = -DDISPLAY_USES_RGBA=$(DISPLAY_USES_RGBA) -DHAS_SPECIAL_BUTTON=$(HAS_SPECIAL_BUTTON) -DBROKEN_CNTFRQ_EL0=$(BROKEN_CNTFRQ_EL0)

[LibraryClasses.common]
  PlatformMemoryMapLib|WSPPkg/Library/PlatformMemoryMapLib/PlatformMemoryMapLib.inf

[PcdsFixedAtBuild.common]
  # Platform-specific
  gArmTokenSpaceGuid.PcdSystemMemoryBase|0x80000000         # Starting address
!if $(RAM_SIZE) == 2
  gArmTokenSpaceGuid.PcdSystemMemorySize|0x80000000         # 2GB Size
!elseif $(RAM_SIZE) == 3
  gArmTokenSpaceGuid.PcdSystemMemorySize|0xC0000000         # 3GB Size
!else
!error "Invaild RAM Size! Use 2 or 3."
!endif

  gEfiMdeModulePkgTokenSpaceGuid.PcdFirmwareVendor|L"halal-beef"   # Device Maintainer

  gArmTokenSpaceGuid.PcdCpuVectorBaseAddress|0x40C40000

  gEmbeddedTokenSpaceGuid.PcdPrePiStackBase|0x40C00000
  gEmbeddedTokenSpaceGuid.PcdPrePiStackSize|0x00040000      # 256K stack

  # SmBios
  gMediatekPkgTokenSpaceGuid.PcdSmbiosSystemVendor|"HMD Global Oy"
  gMediatekPkgTokenSpaceGuid.PcdSmbiosSystemModel|"Nokia 2.2"
  gMediatekPkgTokenSpaceGuid.PcdSmbiosSystemRetailModel|"TA-1188"
  gMediatekPkgTokenSpaceGuid.PcdSmbiosSystemRetailSku|"Nokia_2.2_TA-1188"
  gMediatekPkgTokenSpaceGuid.PcdSmbiosBoardModel|"Nokia 2.2"

  # Simple FrameBuffer
  gMediatekPkgTokenSpaceGuid.PcdMipiFrameBufferWidth|736
  gMediatekPkgTokenSpaceGuid.PcdMipiFrameBufferHeight|1520
  gMediatekPkgTokenSpaceGuid.PcdMipiFrameBufferPixelBpp|32

[PcdsDynamicDefault.common]
  gEfiMdeModulePkgTokenSpaceGuid.PcdVideoHorizontalResolution|736
  gEfiMdeModulePkgTokenSpaceGuid.PcdVideoVerticalResolution|1520
  gEfiMdeModulePkgTokenSpaceGuid.PcdSetupVideoHorizontalResolution|736
  gEfiMdeModulePkgTokenSpaceGuid.PcdSetupVideoVerticalResolution|1520
  gEfiMdeModulePkgTokenSpaceGuid.PcdSetupConOutColumn|90
  gEfiMdeModulePkgTokenSpaceGuid.PcdSetupConOutRow|80
  gEfiMdeModulePkgTokenSpaceGuid.PcdConOutColumn|90
  gEfiMdeModulePkgTokenSpaceGuid.PcdConOutRow|80

!include MT6765Pkg/MT6765Pkg.dsc.inc
