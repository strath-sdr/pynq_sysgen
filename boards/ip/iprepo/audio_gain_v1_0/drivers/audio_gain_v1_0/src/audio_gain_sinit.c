/**
* @file audio_gain_sinit.c
*
* The implementation of the audio_gain driver's static initialzation
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
#include "audio_gain.h"
extern audio_gain_Config audio_gain_ConfigTable[];
/**
* Lookup the device configuration based on the unique device ID.  The table
* ConfigTable contains the configuration info for each device in the system.
*
* @param DeviceId is the device identifier to lookup.
*
* @return
*     - A pointer of data type audio_gain_Config which
*    points to the device configuration if DeviceID is found.
*    - NULL if DeviceID is not found.
*
* @note    None.
*
*/
audio_gain_Config *audio_gain_LookupConfig(u16 DeviceId) {
    audio_gain_Config *ConfigPtr = NULL;
    int Index;
    for (Index = 0; Index < XPAR_AUDIO_GAIN_NUM_INSTANCES; Index++) {
        if (audio_gain_ConfigTable[Index].DeviceId == DeviceId) {
            ConfigPtr = &audio_gain_ConfigTable[Index];
            break;
        }
    }
    return ConfigPtr;
}
int audio_gain_Initialize(audio_gain *InstancePtr, u16 DeviceId) {
    audio_gain_Config *ConfigPtr;
    Xil_AssertNonvoid(InstancePtr != NULL);
    ConfigPtr = audio_gain_LookupConfig(DeviceId);
    if (ConfigPtr == NULL) {
        InstancePtr->IsReady = 0;
        return (XST_DEVICE_NOT_FOUND);
    }
    return audio_gain_CfgInitialize(InstancePtr, ConfigPtr);
}
#endif
