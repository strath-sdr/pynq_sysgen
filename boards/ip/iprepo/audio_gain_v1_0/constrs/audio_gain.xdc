set rateCeaudio_gain16 audio_gain_default_clock_driver/clockdriver_x1/pipelined_ce.ce_pipeline[1].ce_reg/latency_gt_0.fd_array[1].reg_comp/fd_prim_array[0].bit_is_0.fdre_comp
set rateCellsaudio_gain16 [get_cells -of [filter [all_fanout -flat -endpoints [get_pins $rateCeaudio_gain16/Q]] IS_ENABLE]]
set rateCeaudio_gain32 audio_gain_default_clock_driver/clockdriver_x0/pipelined_ce.ce_pipeline[1].ce_reg/latency_gt_0.fd_array[1].reg_comp/fd_prim_array[0].bit_is_0.fdre_comp
set rateCellsaudio_gain32 [get_cells -of [filter [all_fanout -flat -endpoints [get_pins $rateCeaudio_gain32/Q]] IS_ENABLE]]
set rateCeaudio_gain1024 audio_gain_default_clock_driver/clockdriver/pipelined_ce.ce_pipeline[1].ce_reg/latency_gt_0.fd_array[1].reg_comp/fd_prim_array[0].bit_is_0.fdre_comp
set rateCellsaudio_gain1024 [get_cells -of [filter [all_fanout -flat -endpoints [get_pins $rateCeaudio_gain1024/Q]] IS_ENABLE]]
set_multicycle_path -from $rateCellsaudio_gain16 -to $rateCellsaudio_gain16 -setup 16
set_multicycle_path -from $rateCellsaudio_gain16 -to $rateCellsaudio_gain16 -hold 15
set_multicycle_path -from $rateCellsaudio_gain16 -to $rateCellsaudio_gain32 -setup 16
set_multicycle_path -from $rateCellsaudio_gain16 -to $rateCellsaudio_gain32 -hold 15
set_multicycle_path -from $rateCellsaudio_gain16 -to $rateCellsaudio_gain1024 -setup 16
set_multicycle_path -from $rateCellsaudio_gain16 -to $rateCellsaudio_gain1024 -hold 15
set_multicycle_path -from $rateCellsaudio_gain32 -to $rateCellsaudio_gain16 -setup 16
set_multicycle_path -from $rateCellsaudio_gain32 -to $rateCellsaudio_gain16 -hold 15
set_multicycle_path -from $rateCellsaudio_gain32 -to $rateCellsaudio_gain32 -setup 32
set_multicycle_path -from $rateCellsaudio_gain32 -to $rateCellsaudio_gain32 -hold 31
set_multicycle_path -from $rateCellsaudio_gain32 -to $rateCellsaudio_gain1024 -setup 32
set_multicycle_path -from $rateCellsaudio_gain32 -to $rateCellsaudio_gain1024 -hold 31
set_multicycle_path -from $rateCellsaudio_gain1024 -to $rateCellsaudio_gain16 -setup 16
set_multicycle_path -from $rateCellsaudio_gain1024 -to $rateCellsaudio_gain16 -hold 15
set_multicycle_path -from $rateCellsaudio_gain1024 -to $rateCellsaudio_gain32 -setup 32
set_multicycle_path -from $rateCellsaudio_gain1024 -to $rateCellsaudio_gain32 -hold 31
set_multicycle_path -from $rateCellsaudio_gain1024 -to $rateCellsaudio_gain1024 -setup 1024
set_multicycle_path -from $rateCellsaudio_gain1024 -to $rateCellsaudio_gain1024 -hold 1023
