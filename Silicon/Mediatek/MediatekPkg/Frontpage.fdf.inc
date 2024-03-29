  INF MsGraphicsPkg/GopOverrideDxe/GopOverrideDxe.inf
  INF MsCorePkg/MuCryptoDxe/MuCryptoDxe.inf
  INF DfciPkg/SettingsManager/SettingsManagerDxe.inf
  INF MsGraphicsPkg/MsUiTheme/Dxe/MsUiThemeProtocol.inf
  INF MsGraphicsPkg/RenderingEngineDxe/RenderingEngineDxe.inf
  INF MsGraphicsPkg/DisplayEngineDxe/DisplayEngineDxe.inf
  INF OemPkg/BootMenu/BootMenu.inf
  INF MediatekPkg/Applications/FrontPage/FrontPage.inf
  INF PcBdsPkg/MsBootPolicy/MsBootPolicy.inf
  INF MdeModulePkg/Universal/BootManagerPolicyDxe/BootManagerPolicyDxe.inf
!if $(ARCH) == AARCH64
  INF MdeModulePkg/Universal/RegularExpressionDxe/RegularExpressionDxe.inf
!endif
  INF DfciPkg/DfciManager/DfciManager.inf
  INF MsGraphicsPkg/OnScreenKeyboardDxe/OnScreenKeyboardDxe.inf
  INF MsGraphicsPkg/SimpleWindowManagerDxe/SimpleWindowManagerDxe.inf
  INF MsGraphicsPkg/MsEarlyGraphics/Dxe/MsEarlyGraphics.inf

  INF MsWheaPkg/HwErrBert/HwErrBert.inf
  INF MsWheaPkg/MsWheaReport/Dxe/MsWheaReportDxe.inf

  # Hardware Health (Menu) application
  INF MsWheaPkg/HwhMenu/HwhMenu.inf

  INF MsCorePkg/AcpiRGRT/AcpiRgrt.inf

  INF MediatekPkg/Applications/DfciMenu/DfciMenu.inf

  FILE FREEFORM = PCD(gOemPkgTokenSpaceGuid.PcdLogoFile) {
    SECTION RAW = OemPkg/FrontPage/Resources/BootLogo.bmp
    SECTION UI = "Logo"
  }

  FILE APPLICATION = PCD(gPcBdsPkgTokenSpaceGuid.PcdShellFile) {
    SECTION PE32 = $(OUTPUT_DIRECTORY)/$(TARGET)_$(TOOL_CHAIN_TAG)/$(ARCH)/Shell.efi
    SECTION UI = "Shell"
  }

  FILE FREEFORM = PCD(gMediatekPkgTokenSpaceGuid.PcdNoBootOSFile) {
    SECTION RAW = MediatekPkg/Include/Resources/NoBootOS.bmp
  }

  FILE FREEFORM = PCD(gOemPkgTokenSpaceGuid.PcdFrontPageLogoFile) {
    SECTION RAW = MediatekPkg/Applications/FrontPage/Resources/FrontpageLogo.bmp
  }

  FILE FREEFORM = PCD(gOemPkgTokenSpaceGuid.PcdLowBatteryFile) {
    SECTION RAW = MediatekPkg/Include/Resources/LBAT.bmp
  }

  FILE FREEFORM = PCD(gOemPkgTokenSpaceGuid.PcdThermalFile) {
    SECTION RAW = MediatekPkg/Include/Resources/THOT.bmp
  }

  FILE FREEFORM = PCD(gOemPkgTokenSpaceGuid.PcdVolumeUpIndicatorFile) {
    SECTION RAW = MediatekPkg/Applications/FrontPage/Resources/VolumeUp.bmp
  }

  FILE FREEFORM = PCD(gOemPkgTokenSpaceGuid.PcdFirmwareSettingsIndicatorFile) {
    SECTION RAW = MediatekPkg/Applications/FrontPage/Resources/FirmwareSettings.bmp
  }

  FILE FREEFORM = PCD(gOemPkgTokenSpaceGuid.PcdBootFailIndicatorFile) {
    SECTION RAW = MediatekPkg/Applications/FrontPage/Resources/NoBoot.bmp
  }

!if $(ARCH) == AARCH64
!if $(PRECOMPILED_CRYPTO_BINARIES) == 1
  INF CryptoPkg/Driver/Bin/CryptoDriverBin_STANDARD_Dxe_$(TARGET)_AARCH64.inf
!endif
!endif
