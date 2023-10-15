#include <Library/BaseLib.h>
#include <Library/PlatformMemoryMapLib.h>

static ARM_MEMORY_REGION_DESCRIPTOR_EX gDeviceMemoryDescriptorEx[] = {
    //
    // Name, Address, Length, HobOption,
    // ResourceAttribute, ArmAttributes,
    // ResourceType, MemoryType
    //

    // DDR Regions
    {"HLOS 0", 0x80000000, 0x00C00000, AddMem,
     EFI_RESOURCE_SYSTEM_MEMORY, SYSTEM_MEMORY_RESOURCE_ATTR_CAPABILITIES,
     EfiConventionalMemory, ARM_MEMORY_REGION_ATTRIBUTE_WRITE_BACK},

    {"UEFI Stack", 0x80C00000, 0x00040000, AddMem,
     EFI_RESOURCE_SYSTEM_MEMORY, SYSTEM_MEMORY_RESOURCE_ATTR_CAPABILITIES,
     EfiBootServicesData, ARM_MEMORY_REGION_ATTRIBUTE_WRITE_BACK},

    {"CPU Vectors", 0x80C40000, 0x00010000, AddMem,
     EFI_RESOURCE_SYSTEM_MEMORY, SYSTEM_MEMORY_RESOURCE_ATTR_CAPABILITIES,
     EfiBootServicesCode, ARM_MEMORY_REGION_ATTRIBUTE_WRITE_BACK},

    {"HLOS 1", 0x80C50000, 0x39EB0000, AddMem,
     EFI_RESOURCE_SYSTEM_MEMORY, SYSTEM_MEMORY_RESOURCE_ATTR_CAPABILITIES,
     EfiConventionalMemory, ARM_MEMORY_REGION_ATTRIBUTE_WRITE_BACK},

    // Memory Hole: 0xBAB00000 -> 0xC0000000 (0x05500000)

    {"UEFI FD", 0xC0000000, 0x00300000, AddMem,
     EFI_RESOURCE_SYSTEM_MEMORY, SYSTEM_MEMORY_RESOURCE_ATTR_CAPABILITIES,
     EfiBootServicesData, ARM_MEMORY_REGION_ATTRIBUTE_WRITE_BACK},

    {"DXE Heap", 0xC0300000, 0x07C00000, AddMem,
     EFI_RESOURCE_SYSTEM_MEMORY, SYSTEM_MEMORY_RESOURCE_ATTR_CAPABILITIES,
     EfiConventionalMemory, ARM_MEMORY_REGION_ATTRIBUTE_WRITE_BACK},

    {"Display Reserved",  0xCA000000, 0x02166000, AddMem,
     EFI_RESOURCE_MEMORY_RESERVED, SYSTEM_MEMORY_RESOURCE_ATTR_CAPABILITIES,
     EfiReservedMemoryType, ARM_MEMORY_REGION_ATTRIBUTE_WRITE_THROUGH},

    {"PStore", 0xEB308000, 0x00008000, AddMem,
     EFI_RESOURCE_MEMORY_RESERVED, SYSTEM_MEMORY_RESOURCE_ATTR_CAPABILITIES,
     EfiReservedMemoryType, ARM_MEMORY_REGION_ATTRIBUTE_WRITE_THROUGH},

    {"EL2 EarlyMem",  0xFD800000, 0x02800000, AddMem,
     EFI_RESOURCE_MEMORY_RESERVED, EFI_RESOURCE_ATTRIBUTE_UNCACHEABLE,
     EfiReservedMemoryType, ARM_MEMORY_REGION_ATTRIBUTE_UNCACHED_UNBUFFERED},

    // RAM partition regions
    {"RAM Partition", 0x880000000, 0x80000000, AddMem,
     EFI_RESOURCE_SYSTEM_MEMORY, SYSTEM_MEMORY_RESOURCE_ATTR_CAPABILITIES,
     EfiConventionalMemory, ARM_MEMORY_REGION_ATTRIBUTE_WRITE_BACK},

    // Register regions
    {"Periphs", 0x00000000, 0x20000000, AddDev,
     EFI_RESOURCE_MEMORY_MAPPED_IO, EFI_RESOURCE_ATTRIBUTE_UNCACHEABLE,
     EfiMemoryMappedIO, ARM_MEMORY_REGION_ATTRIBUTE_NONSECURE_DEVICE},

    // Terminator for MMU
    {"Terminator", 0, 0, 0, 0, 0, 0, 0}};

ARM_MEMORY_REGION_DESCRIPTOR_EX *GetPlatformMemoryMap()
{
    return gDeviceMemoryDescriptorEx;
}