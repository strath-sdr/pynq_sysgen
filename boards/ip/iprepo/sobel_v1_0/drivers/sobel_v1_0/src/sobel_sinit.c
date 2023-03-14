/**
* @file sobel_sinit.c
*
* The implementation of the sobel driver's static initialzation
* functionality.
*
* @note
*
* None
*
*/
#ifndef __linux__
#include "xstatus.h"
#include "xparameters.h"
#include "sobel.h"
extern sobel_Config sobel_ConfigTable[];
/**
* Lookup the device configuration based on the unique device ID.  The table
* ConfigTable contains the configuration info for each device in the system.
*
* @param DeviceId is the device identifier to lookup.
*
* @return
*     - A pointer of data type sobel_Config which
*    points to the device configuration if DeviceID is found.
*    - NULL if DeviceID is not found.
*
* @note    None.
*
*/
sobel_Config *sobel_LookupConfig(u16 DeviceId) {
    sobel_Config *ConfigPtr = NULL;
    int Index;
    for (Index = 0; Index < XPAR_SOBEL_NUM_INSTANCES; Index++) {
        if (sobel_ConfigTable[Index].DeviceId == DeviceId) {
            ConfigPtr = &sobel_ConfigTable[Index];
            break;
        }
    }
    return ConfigPtr;
}
int sobel_Initialize(sobel *InstancePtr, u16 DeviceId) {
    sobel_Config *ConfigPtr;
    Xil_AssertNonvoid(InstancePtr != NULL);
    ConfigPtr = sobel_LookupConfig(DeviceId);
    if (ConfigPtr == NULL) {
        InstancePtr->IsReady = 0;
        return (XST_DEVICE_NOT_FOUND);
    }
    return sobel_CfgInitialize(InstancePtr, ConfigPtr);
}
#endif
