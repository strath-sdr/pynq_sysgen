#include "audio_gain.h"
#ifndef __linux__
int audio_gain_CfgInitialize(audio_gain *InstancePtr, audio_gain_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->audio_gain_BaseAddress = ConfigPtr->audio_gain_BaseAddress;

    InstancePtr->IsReady = 1;
    return XST_SUCCESS;
}
#endif
void audio_gain_right_gain_in_write(audio_gain *InstancePtr, u8 Data) {

    Xil_AssertVoid(InstancePtr != NULL);

    audio_gain_WriteReg(InstancePtr->audio_gain_BaseAddress, 4, Data);
}
u8 audio_gain_right_gain_in_read(audio_gain *InstancePtr) {

    u8 Data;
    Xil_AssertVoid(InstancePtr != NULL);

    Data = audio_gain_ReadReg(InstancePtr->audio_gain_BaseAddress, 4);
    return Data;
}
void audio_gain_left_gain_in_write(audio_gain *InstancePtr, u8 Data) {

    Xil_AssertVoid(InstancePtr != NULL);

    audio_gain_WriteReg(InstancePtr->audio_gain_BaseAddress, 0, Data);
}
u8 audio_gain_left_gain_in_read(audio_gain *InstancePtr) {

    u8 Data;
    Xil_AssertVoid(InstancePtr != NULL);

    Data = audio_gain_ReadReg(InstancePtr->audio_gain_BaseAddress, 0);
    return Data;
}
