proc generate {drv_handle} {
    xdefine_include_file $drv_handle "xparameters.h" "audio_gain" "NUM_INSTANCES" "DEVICE_ID" "C_AUDIO_GAIN_S_AXI_BASEADDR" "C_AUDIO_GAIN_S_AXI_HIGHADDR" 
    xdefine_config_file $drv_handle "audio_gain_g.c" "audio_gain" "DEVICE_ID" "C_AUDIO_GAIN_S_AXI_BASEADDR" 
    xdefine_canonical_xpars $drv_handle "xparameters.h" "audio_gain" "DEVICE_ID" "C_AUDIO_GAIN_S_AXI_BASEADDR" "C_AUDIO_GAIN_S_AXI_HIGHADDR" 

}