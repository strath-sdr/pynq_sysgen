#ifndef AUDIO_GAIN__H
#define AUDIO_GAIN__H
#ifdef __cplusplus
extern "C" {
#endif
/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "audio_gain_hw.h"
/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
#else
typedef struct {
    u16 DeviceId;
    u32 audio_gain_BaseAddress;
} audio_gain_Config;
#endif
/**
* The audio_gain driver instance data. The user is required to
* allocate a variable of this type for every audio_gain device in the system.
* A pointer to a variable of this type is then passed to the driver
* API functions.
*/
typedef struct {
    u32 audio_gain_BaseAddress;
    u32 IsReady;
} audio_gain;
/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define audio_gain_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define audio_gain_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define audio_gain_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define audio_gain_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif
/************************** Function Prototypes *****************************/
#ifndef __linux__
int audio_gain_Initialize(audio_gain *InstancePtr, u16 DeviceId);
audio_gain_Config* audio_gain_LookupConfig(u16 DeviceId);
int audio_gain_CfgInitialize(audio_gain *InstancePtr, audio_gain_Config *ConfigPtr);
#else
int audio_gain_Initialize(audio_gain *InstancePtr, const char* InstanceName);
int audio_gain_Release(audio_gain *InstancePtr);
#endif
/**
* Write to right_gain_in gateway of audio_gain. Assignments are LSB-justified.
*
* @param	InstancePtr is the right_gain_in instance to operate on.
* @param	Data is value to be written to gateway right_gain_in.
*
* @return	None.
*
* @note    .
*
*/
void audio_gain_right_gain_in_write(audio_gain *InstancePtr, u8 Data);
/**
* Read from right_gain_in gateway of audio_gain. Assignments are LSB-justified.
*
* @param	InstancePtr is the right_gain_in instance to operate on.
*
* @return	u8
*
* @note    .
*
*/
u8 audio_gain_right_gain_in_read(audio_gain *InstancePtr);
/**
* Write to left_gain_in gateway of audio_gain. Assignments are LSB-justified.
*
* @param	InstancePtr is the left_gain_in instance to operate on.
* @param	Data is value to be written to gateway left_gain_in.
*
* @return	None.
*
* @note    .
*
*/
void audio_gain_left_gain_in_write(audio_gain *InstancePtr, u8 Data);
/**
* Read from left_gain_in gateway of audio_gain. Assignments are LSB-justified.
*
* @param	InstancePtr is the left_gain_in instance to operate on.
*
* @return	u8
*
* @note    .
*
*/
u8 audio_gain_left_gain_in_read(audio_gain *InstancePtr);
#ifdef __cplusplus
}
#endif
#endif
