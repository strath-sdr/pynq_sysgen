#include "sobel.h"
#ifndef __linux__
int sobel_CfgInitialize(sobel *InstancePtr, sobel_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->sobel_BaseAddress = ConfigPtr->sobel_BaseAddress;

    InstancePtr->IsReady = 1;
    return XST_SUCCESS;
}
#endif
void sobel_thresh_reg_write(sobel *InstancePtr, u32 Data) {

    Xil_AssertVoid(InstancePtr != NULL);

    sobel_WriteReg(InstancePtr->sobel_BaseAddress, 0, Data);
}
u32 sobel_thresh_reg_read(sobel *InstancePtr) {

    u32 Data;
    Xil_AssertVoid(InstancePtr != NULL);

    Data = sobel_ReadReg(InstancePtr->sobel_BaseAddress, 0);
    return Data;
}
