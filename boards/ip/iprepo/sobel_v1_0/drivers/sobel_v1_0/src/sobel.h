#ifndef SOBEL__H
#define SOBEL__H
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
#include "sobel_hw.h"
/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
#else
typedef struct {
    u16 DeviceId;
    u32 sobel_BaseAddress;
} sobel_Config;
#endif
/**
* The sobel driver instance data. The user is required to
* allocate a variable of this type for every sobel device in the system.
* A pointer to a variable of this type is then passed to the driver
* API functions.
*/
typedef struct {
    u32 sobel_BaseAddress;
    u32 IsReady;
} sobel;
/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define sobel_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define sobel_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define sobel_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define sobel_ReadReg(BaseAddress, RegOffset) \
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
int sobel_Initialize(sobel *InstancePtr, u16 DeviceId);
sobel_Config* sobel_LookupConfig(u16 DeviceId);
int sobel_CfgInitialize(sobel *InstancePtr, sobel_Config *ConfigPtr);
#else
int sobel_Initialize(sobel *InstancePtr, const char* InstanceName);
int sobel_Release(sobel *InstancePtr);
#endif
/**
* Write to thresh_reg gateway of sobel. Assignments are LSB-justified.
*
* @param	InstancePtr is the thresh_reg instance to operate on.
* @param	Data is value to be written to gateway thresh_reg.
*
* @return	None.
*
* @note    .
*
*/
void sobel_thresh_reg_write(sobel *InstancePtr, u32 Data);
/**
* Read from thresh_reg gateway of sobel. Assignments are LSB-justified.
*
* @param	InstancePtr is the thresh_reg instance to operate on.
*
* @return	u32
*
* @note    .
*
*/
u32 sobel_thresh_reg_read(sobel *InstancePtr);
#ifdef __cplusplus
}
#endif
#endif
