proc generate {drv_handle} {
    xdefine_include_file $drv_handle "xparameters.h" "sobel" "NUM_INSTANCES" "DEVICE_ID" "C_SOBEL_S_AXI_BASEADDR" "C_SOBEL_S_AXI_HIGHADDR" 
    xdefine_config_file $drv_handle "sobel_g.c" "sobel" "DEVICE_ID" "C_SOBEL_S_AXI_BASEADDR" 
    xdefine_canonical_xpars $drv_handle "xparameters.h" "sobel" "DEVICE_ID" "C_SOBEL_S_AXI_BASEADDR" "C_SOBEL_S_AXI_HIGHADDR" 

}