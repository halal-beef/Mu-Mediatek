#include <PiPei.h>

#include <Library/IoLib.h>
#include <Library/PlatformPrePiLib.h>

#include "PlatformUtils.h"

VOID PlatformInitialize(VOID)
{
  // Disable WDT
  MmioWrite32(0x10007000, 0x22000000);
}
