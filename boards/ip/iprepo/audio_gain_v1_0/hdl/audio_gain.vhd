-- Generated from Simulink block audio_gain_struct
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity audio_gain_struct is
  port (
    bclk_in : in std_logic_vector( 1-1 downto 0 );
    lrclk_in : in std_logic_vector( 1-1 downto 0 );
    left_gain_in : in std_logic_vector( 4-1 downto 0 );
    right_gain_in : in std_logic_vector( 4-1 downto 0 );
    sdata_in : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    clk_16 : in std_logic;
    ce_16 : in std_logic;
    clk_32 : in std_logic;
    ce_32 : in std_logic;
    clk_1024 : in std_logic;
    ce_1024 : in std_logic;
    bclk_out : out std_logic_vector( 1-1 downto 0 );
    lrclk_out : out std_logic_vector( 1-1 downto 0 );
    sdata_out : out std_logic_vector( 1-1 downto 0 )
  );
end audio_gain_struct;
architecture structural of audio_gain_struct is 
  signal lrclk_delay_1_q_net : std_logic_vector( 1-1 downto 0 );
  signal lrclk_downsample_q_net : std_logic_vector( 1-1 downto 0 );
  signal lrclk_further_downsample_q_net : std_logic_vector( 1-1 downto 0 );
  signal lrclk_further_up_sample_q_net : std_logic_vector( 1-1 downto 0 );
  signal lrclk_up_sample_q_net : std_logic_vector( 1-1 downto 0 );
  signal lrclk_delay_991_q_net : std_logic_vector( 1-1 downto 0 );
  signal lrclk_register_q_net : std_logic_vector( 1-1 downto 0 );
  signal inverter1_op_net : std_logic_vector( 1-1 downto 0 );
  signal left_channel_slice_y_net : std_logic_vector( 31-1 downto 0 );
  signal serial_to_parallel_left_dout_net : std_logic_vector( 32-1 downto 0 );
  signal left_gain_p_net : std_logic_vector( 32-1 downto 0 );
  signal left_gain_register_q_net : std_logic_vector( 4-1 downto 0 );
  signal reinterpret_left_channel_output_port_net : std_logic_vector( 31-1 downto 0 );
  signal serial_to_parallel_right_dout_net : std_logic_vector( 32-1 downto 0 );
  signal parallel_to_serial_dout_net : std_logic_vector( 1-1 downto 0 );
  signal sdata_delay_q_net : std_logic_vector( 1-1 downto 0 );
  signal sdata_register_q_net : std_logic_vector( 1-1 downto 0 );
  signal right_channel_slice_y_net : std_logic_vector( 31-1 downto 0 );
  signal reinterpret_right_channel_output_port_net : std_logic_vector( 31-1 downto 0 );
  signal mux_y_net : std_logic_vector( 32-1 downto 0 );
  signal right_gain_p_net : std_logic_vector( 32-1 downto 0 );
  signal right_gain_register_q_net : std_logic_vector( 4-1 downto 0 );
  signal left_gain_in_net : std_logic_vector( 4-1 downto 0 );
  signal clk_net_x2 : std_logic;
  signal ce_net_x1 : std_logic;
  signal clk_net_x0 : std_logic;
  signal bclk_output_register_q_net : std_logic_vector( 1-1 downto 0 );
  signal bclk_in_net : std_logic_vector( 1-1 downto 0 );
  signal lrclk_output_register_q_net : std_logic_vector( 1-1 downto 0 );
  signal lrclk_in_net : std_logic_vector( 1-1 downto 0 );
  signal sdata_in_net : std_logic_vector( 1-1 downto 0 );
  signal right_gain_in_net : std_logic_vector( 4-1 downto 0 );
  signal clk_net_x1 : std_logic;
  signal sdata_output_register_q_net : std_logic_vector( 1-1 downto 0 );
  signal ce_net_x2 : std_logic;
  signal ce_net_x0 : std_logic;
  signal bclk_up_sample_q_net : std_logic_vector( 1-1 downto 0 );
  signal bclk_delay_2_q_net : std_logic_vector( 1-1 downto 0 );
  signal bclk_downsample_q_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal bclk_delay_991_q_net : std_logic_vector( 1-1 downto 0 );
  signal bclk_register_q_net : std_logic_vector( 1-1 downto 0 );
  signal bclk_delay_64_q_net : std_logic_vector( 1-1 downto 0 );
  signal ce_net : std_logic;
  signal bclk_delay_64_q_net_x0 : std_logic_vector( 1-1 downto 0 );
  signal sdata_down_sample_q_net : std_logic_vector( 1-1 downto 0 );
  signal sdata_up_sample_q_net : std_logic_vector( 1-1 downto 0 );
begin
  bclk_in_net <= bclk_in;
  bclk_out <= bclk_output_register_q_net;
  lrclk_in_net <= lrclk_in;
  lrclk_out <= lrclk_output_register_q_net;
  left_gain_in_net <= left_gain_in;
  right_gain_in_net <= right_gain_in;
  sdata_in_net <= sdata_in;
  sdata_out <= sdata_output_register_q_net;
  clk_net_x1 <= clk_1;
  ce_net_x2 <= ce_1;
  clk_net_x2 <= clk_16;
  ce_net_x1 <= ce_16;
  clk_net_x0 <= clk_32;
  ce_net_x0 <= ce_32;
  clk_net <= clk_1024;
  ce_net <= ce_1024;
  bclk_delay_2 : entity xil_defaultlib.audio_gain_xldelay 
  generic map (
    latency => 64,
    reg_retiming => 0,
    reset => 0,
    width => 1
  )
  port map (
    en => '1',
    rst => '0',
    d => bclk_delay_64_q_net_x0,
    clk => clk_net_x2,
    ce => ce_net_x1,
    q => bclk_delay_2_q_net
  );
  bclk_delay_64 : entity xil_defaultlib.audio_gain_xldelay 
  generic map (
    latency => 64,
    reg_retiming => 0,
    reset => 0,
    width => 1
  )
  port map (
    en => '1',
    rst => '0',
    d => bclk_downsample_q_net,
    clk => clk_net_x2,
    ce => ce_net_x1,
    q => bclk_delay_64_q_net_x0
  );
  bclk_delay_64_x0 : entity xil_defaultlib.audio_gain_xldelay 
  generic map (
    latency => 64,
    reg_retiming => 0,
    reset => 0,
    width => 1
  )
  port map (
    en => '1',
    rst => '0',
    d => bclk_delay_2_q_net,
    clk => clk_net_x2,
    ce => ce_net_x1,
    q => bclk_delay_64_q_net
  );
  bclk_delay_991 : entity xil_defaultlib.audio_gain_xldelay 
  generic map (
    latency => 991,
    reg_retiming => 0,
    reset => 0,
    width => 1
  )
  port map (
    en => '1',
    rst => '0',
    d => bclk_register_q_net,
    clk => clk_net_x1,
    ce => ce_net_x2,
    q => bclk_delay_991_q_net
  );
  bclk_downsample : entity xil_defaultlib.audio_gain_xldsamp 
  generic map (
    d_arith => xlUnsigned,
    d_bin_pt => 0,
    d_width => 1,
    ds_ratio => 16,
    latency => 2,
    phase => 15,
    q_arith => xlUnsigned,
    q_bin_pt => 0,
    q_width => 1
  )
  port map (
    src_clr => '0',
    dest_clr => '0',
    en => "1",
    rst => "0",
    d => bclk_delay_991_q_net,
    src_clk => clk_net_x1,
    src_ce => ce_net_x2,
    dest_clk => clk_net_x2,
    dest_ce => ce_net_x1,
    q => bclk_downsample_q_net
  );
  bclk_output_register : entity xil_defaultlib.audio_gain_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    en => "1",
    rst => "0",
    d => bclk_up_sample_q_net,
    clk => clk_net_x1,
    ce => ce_net_x2,
    q => bclk_output_register_q_net
  );
  bclk_register : entity xil_defaultlib.audio_gain_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    en => "1",
    rst => "0",
    d => bclk_in_net,
    clk => clk_net_x1,
    ce => ce_net_x2,
    q => bclk_register_q_net
  );
  bclk_up_sample : entity xil_defaultlib.audio_gain_xlusamp 
  generic map (
    copy_samples => 1,
    d_arith => xlUnsigned,
    d_bin_pt => 0,
    d_width => 1,
    latency => 0,
    q_arith => xlUnsigned,
    q_bin_pt => 0,
    q_width => 1
  )
  port map (
    src_clr => '0',
    dest_clr => '0',
    en => "1",
    d => bclk_delay_64_q_net,
    src_clk => clk_net_x2,
    src_ce => ce_net_x1,
    dest_clk => clk_net_x1,
    dest_ce => ce_net_x2,
    q => bclk_up_sample_q_net
  );
  inverter1 : entity xil_defaultlib.sysgen_inverter_688b6b80f1 
  port map (
    clr => '0',
    ip => lrclk_downsample_q_net,
    clk => clk_net_x0,
    ce => ce_net_x0,
    op => inverter1_op_net
  );
  lrclk_delay_1 : entity xil_defaultlib.audio_gain_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 1
  )
  port map (
    en => '1',
    rst => '0',
    d => lrclk_further_downsample_q_net,
    clk => clk_net,
    ce => ce_net,
    q => lrclk_delay_1_q_net
  );
  lrclk_delay_991 : entity xil_defaultlib.audio_gain_xldelay 
  generic map (
    latency => 991,
    reg_retiming => 0,
    reset => 0,
    width => 1
  )
  port map (
    en => '1',
    rst => '0',
    d => lrclk_register_q_net,
    clk => clk_net_x1,
    ce => ce_net_x2,
    q => lrclk_delay_991_q_net
  );
  lrclk_downsample : entity xil_defaultlib.audio_gain_xldsamp 
  generic map (
    d_arith => xlUnsigned,
    d_bin_pt => 0,
    d_width => 1,
    ds_ratio => 32,
    latency => 1,
    phase => 31,
    q_arith => xlUnsigned,
    q_bin_pt => 0,
    q_width => 1
  )
  port map (
    src_clr => '0',
    dest_clr => '0',
    en => "1",
    rst => "0",
    d => lrclk_delay_991_q_net,
    src_clk => clk_net_x1,
    src_ce => ce_net_x2,
    dest_clk => clk_net_x0,
    dest_ce => ce_net_x0,
    q => lrclk_downsample_q_net
  );
  lrclk_further_downsample : entity xil_defaultlib.audio_gain_xldsamp 
  generic map (
    d_arith => xlUnsigned,
    d_bin_pt => 0,
    d_width => 1,
    ds_ratio => 32,
    latency => 1,
    phase => 31,
    q_arith => xlUnsigned,
    q_bin_pt => 0,
    q_width => 1
  )
  port map (
    src_clr => '0',
    dest_clr => '0',
    en => "1",
    rst => "0",
    d => lrclk_downsample_q_net,
    src_clk => clk_net_x0,
    src_ce => ce_net_x0,
    dest_clk => clk_net,
    dest_ce => ce_net,
    q => lrclk_further_downsample_q_net
  );
  lrclk_further_up_sample : entity xil_defaultlib.audio_gain_xlusamp 
  generic map (
    copy_samples => 1,
    d_arith => xlUnsigned,
    d_bin_pt => 0,
    d_width => 1,
    latency => 0,
    q_arith => xlUnsigned,
    q_bin_pt => 0,
    q_width => 1
  )
  port map (
    src_clr => '0',
    dest_clr => '0',
    en => "1",
    d => lrclk_up_sample_q_net,
    src_clk => clk_net_x0,
    src_ce => ce_net_x0,
    dest_clk => clk_net_x1,
    dest_ce => ce_net_x2,
    q => lrclk_further_up_sample_q_net
  );
  lrclk_output_register : entity xil_defaultlib.audio_gain_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    en => "1",
    rst => "0",
    d => lrclk_further_up_sample_q_net,
    clk => clk_net_x1,
    ce => ce_net_x2,
    q => lrclk_output_register_q_net
  );
  lrclk_register : entity xil_defaultlib.audio_gain_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    en => "1",
    rst => "0",
    d => lrclk_in_net,
    clk => clk_net_x1,
    ce => ce_net_x2,
    q => lrclk_register_q_net
  );
  lrclk_up_sample : entity xil_defaultlib.audio_gain_xlusamp 
  generic map (
    copy_samples => 1,
    d_arith => xlUnsigned,
    d_bin_pt => 0,
    d_width => 1,
    latency => 1,
    q_arith => xlUnsigned,
    q_bin_pt => 0,
    q_width => 1
  )
  port map (
    src_clr => '0',
    dest_clr => '0',
    en => "1",
    d => lrclk_delay_1_q_net,
    src_clk => clk_net,
    src_ce => ce_net,
    dest_clk => clk_net_x0,
    dest_ce => ce_net_x0,
    q => lrclk_up_sample_q_net
  );
  left_channel_slice : entity xil_defaultlib.audio_gain_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 30,
    x_width => 32,
    y_width => 31
  )
  port map (
    x => serial_to_parallel_left_dout_net,
    y => left_channel_slice_y_net
  );
  left_gain : entity xil_defaultlib.audio_gain_xlmult 
  generic map (
    a_arith => xlUnsigned,
    a_bin_pt => 3,
    a_width => 4,
    b_arith => xlSigned,
    b_bin_pt => 30,
    b_width => 31,
    c_a_type => 1,
    c_a_width => 4,
    c_b_type => 0,
    c_b_width => 31,
    c_baat => 4,
    c_output_width => 35,
    c_type => 0,
    core_name0 => "audio_gain_mult_gen_v12_0_i0",
    extra_registers => 1,
    multsign => 2,
    overflow => 2,
    p_arith => xlSigned,
    p_bin_pt => 31,
    p_width => 32,
    quantization => 1
  )
  port map (
    clr => '0',
    core_clr => '1',
    en => "1",
    rst => "0",
    a => left_gain_register_q_net,
    b => reinterpret_left_channel_output_port_net,
    clk => clk_net,
    ce => ce_net,
    core_clk => clk_net,
    core_ce => ce_net,
    p => left_gain_p_net
  );
  left_gain_register : entity xil_defaultlib.audio_gain_xlregister 
  generic map (
    d_width => 4,
    init_value => b"0000"
  )
  port map (
    en => "1",
    rst => "0",
    d => left_gain_in_net,
    clk => clk_net,
    ce => ce_net,
    q => left_gain_register_q_net
  );
  mux : entity xil_defaultlib.sysgen_mux_60af2b6f23 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => lrclk_delay_1_q_net,
    d0 => left_gain_p_net,
    d1 => right_gain_p_net,
    y => mux_y_net
  );
  parallel_to_serial : entity xil_defaultlib.audio_gain_xlp2s 
  generic map (
    din_arith => xlSigned,
    din_bin_pt => 31,
    din_width => 32,
    dout_arith => xlUnsigned,
    dout_bin_pt => 0,
    dout_width => 1,
    latency => 32,
    lsb_first => 0,
    num_outputs => 32
  )
  port map (
    src_clr => '0',
    dest_clr => '0',
    en => "1",
    rst => "0",
    din => mux_y_net,
    src_clk => clk_net,
    src_ce => ce_net,
    dest_clk => clk_net_x0,
    dest_ce => ce_net_x0,
    dout => parallel_to_serial_dout_net
  );
  reinterpret_left_channel : entity xil_defaultlib.sysgen_reinterpret_09e52a23b1 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => left_channel_slice_y_net,
    output_port => reinterpret_left_channel_output_port_net
  );
  reinterpret_right_channel : entity xil_defaultlib.sysgen_reinterpret_09e52a23b1 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => right_channel_slice_y_net,
    output_port => reinterpret_right_channel_output_port_net
  );
  right_channel_slice : entity xil_defaultlib.audio_gain_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 30,
    x_width => 32,
    y_width => 31
  )
  port map (
    x => serial_to_parallel_right_dout_net,
    y => right_channel_slice_y_net
  );
  right_gain : entity xil_defaultlib.audio_gain_xlmult 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 30,
    a_width => 31,
    b_arith => xlUnsigned,
    b_bin_pt => 3,
    b_width => 4,
    c_a_type => 0,
    c_a_width => 31,
    c_b_type => 1,
    c_b_width => 4,
    c_baat => 31,
    c_output_width => 35,
    c_type => 0,
    core_name0 => "audio_gain_mult_gen_v12_0_i1",
    extra_registers => 1,
    multsign => 2,
    overflow => 2,
    p_arith => xlSigned,
    p_bin_pt => 31,
    p_width => 32,
    quantization => 1
  )
  port map (
    clr => '0',
    core_clr => '1',
    en => "1",
    rst => "0",
    a => reinterpret_right_channel_output_port_net,
    b => right_gain_register_q_net,
    clk => clk_net,
    ce => ce_net,
    core_clk => clk_net,
    core_ce => ce_net,
    p => right_gain_p_net
  );
  right_gain_register : entity xil_defaultlib.audio_gain_xlregister 
  generic map (
    d_width => 4,
    init_value => b"0000"
  )
  port map (
    en => "1",
    rst => "0",
    d => right_gain_in_net,
    clk => clk_net,
    ce => ce_net,
    q => right_gain_register_q_net
  );
  sdata_delay : entity xil_defaultlib.audio_gain_xldelay 
  generic map (
    latency => 991,
    reg_retiming => 0,
    reset => 0,
    width => 1
  )
  port map (
    en => '1',
    rst => '0',
    d => sdata_register_q_net,
    clk => clk_net_x1,
    ce => ce_net_x2,
    q => sdata_delay_q_net
  );
  sdata_down_sample : entity xil_defaultlib.audio_gain_xldsamp 
  generic map (
    d_arith => xlUnsigned,
    d_bin_pt => 0,
    d_width => 1,
    ds_ratio => 32,
    latency => 1,
    phase => 31,
    q_arith => xlUnsigned,
    q_bin_pt => 0,
    q_width => 1
  )
  port map (
    src_clr => '0',
    dest_clr => '0',
    en => "1",
    rst => "0",
    d => sdata_delay_q_net,
    src_clk => clk_net_x1,
    src_ce => ce_net_x2,
    dest_clk => clk_net_x0,
    dest_ce => ce_net_x0,
    q => sdata_down_sample_q_net
  );
  sdata_output_register : entity xil_defaultlib.audio_gain_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    en => "1",
    rst => "0",
    d => sdata_up_sample_q_net,
    clk => clk_net_x1,
    ce => ce_net_x2,
    q => sdata_output_register_q_net
  );
  sdata_register : entity xil_defaultlib.audio_gain_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    en => "1",
    rst => "0",
    d => sdata_in_net,
    clk => clk_net_x1,
    ce => ce_net_x2,
    q => sdata_register_q_net
  );
  sdata_up_sample : entity xil_defaultlib.audio_gain_xlusamp 
  generic map (
    copy_samples => 1,
    d_arith => xlUnsigned,
    d_bin_pt => 0,
    d_width => 1,
    latency => 0,
    q_arith => xlUnsigned,
    q_bin_pt => 0,
    q_width => 1
  )
  port map (
    src_clr => '0',
    dest_clr => '0',
    en => "1",
    d => parallel_to_serial_dout_net,
    src_clk => clk_net_x0,
    src_ce => ce_net_x0,
    dest_clk => clk_net_x1,
    dest_ce => ce_net_x2,
    q => sdata_up_sample_q_net
  );
  serial_to_parallel_left : entity xil_defaultlib.audio_gain_xls2p 
  generic map (
    din_arith => xlUnsigned,
    din_bin_pt => 0,
    din_width => 1,
    dout_arith => xlUnsigned,
    dout_bin_pt => 0,
    dout_width => 32,
    latency => 1,
    lsb_first => 0,
    num_inputs => 32
  )
  port map (
    src_clr => '0',
    dest_clr => '0',
    rst => "0",
    din => sdata_down_sample_q_net,
    en => inverter1_op_net,
    src_clk => clk_net_x0,
    src_ce => ce_net_x0,
    dest_clk => clk_net,
    dest_ce => ce_net,
    dout => serial_to_parallel_left_dout_net
  );
  serial_to_parallel_right : entity xil_defaultlib.audio_gain_xls2p 
  generic map (
    din_arith => xlUnsigned,
    din_bin_pt => 0,
    din_width => 1,
    dout_arith => xlUnsigned,
    dout_bin_pt => 0,
    dout_width => 32,
    latency => 1,
    lsb_first => 0,
    num_inputs => 32
  )
  port map (
    src_clr => '0',
    dest_clr => '0',
    rst => "0",
    din => sdata_down_sample_q_net,
    en => lrclk_downsample_q_net,
    src_clk => clk_net_x0,
    src_ce => ce_net_x0,
    dest_clk => clk_net,
    dest_ce => ce_net,
    dout => serial_to_parallel_right_dout_net
  );
end structural;
-- Generated from Simulink block 
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity audio_gain_default_clock_driver is
  port (
    audio_gain_sysclk : in std_logic;
    audio_gain_sysce : in std_logic;
    audio_gain_sysclr : in std_logic;
    audio_gain_clk1 : out std_logic;
    audio_gain_ce1 : out std_logic;
    audio_gain_clk16 : out std_logic;
    audio_gain_ce16 : out std_logic;
    audio_gain_clk32 : out std_logic;
    audio_gain_ce32 : out std_logic;
    audio_gain_clk1024 : out std_logic;
    audio_gain_ce1024 : out std_logic
  );
end audio_gain_default_clock_driver;
architecture structural of audio_gain_default_clock_driver is 
begin
  clockdriver_x2 : entity xil_defaultlib.xlclockdriver 
  generic map (
    period => 1,
    log_2_period => 1
  )
  port map (
    sysclk => audio_gain_sysclk,
    sysce => audio_gain_sysce,
    sysclr => audio_gain_sysclr,
    clk => audio_gain_clk1,
    ce => audio_gain_ce1
  );
  clockdriver_x1 : entity xil_defaultlib.xlclockdriver 
  generic map (
    period => 16,
    log_2_period => 5
  )
  port map (
    sysclk => audio_gain_sysclk,
    sysce => audio_gain_sysce,
    sysclr => audio_gain_sysclr,
    clk => audio_gain_clk16,
    ce => audio_gain_ce16
  );
  clockdriver_x0 : entity xil_defaultlib.xlclockdriver 
  generic map (
    period => 32,
    log_2_period => 6
  )
  port map (
    sysclk => audio_gain_sysclk,
    sysce => audio_gain_sysce,
    sysclr => audio_gain_sysclr,
    clk => audio_gain_clk32,
    ce => audio_gain_ce32
  );
  clockdriver : entity xil_defaultlib.xlclockdriver 
  generic map (
    period => 1024,
    log_2_period => 11
  )
  port map (
    sysclk => audio_gain_sysclk,
    sysce => audio_gain_sysce,
    sysclr => audio_gain_sysclr,
    clk => audio_gain_clk1024,
    ce => audio_gain_ce1024
  );
end structural;
-- Generated from Simulink block 
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity audio_gain is
  port (
    bclk_in : in std_logic_vector( 1-1 downto 0 );
    lrclk_in : in std_logic_vector( 1-1 downto 0 );
    sdata_in : in std_logic_vector( 1-1 downto 0 );
    clk : in std_logic;
    audio_gain_aresetn : in std_logic;
    audio_gain_s_axi_awaddr : in std_logic_vector( 3-1 downto 0 );
    audio_gain_s_axi_awvalid : in std_logic;
    audio_gain_s_axi_wdata : in std_logic_vector( 32-1 downto 0 );
    audio_gain_s_axi_wstrb : in std_logic_vector( 4-1 downto 0 );
    audio_gain_s_axi_wvalid : in std_logic;
    audio_gain_s_axi_bready : in std_logic;
    audio_gain_s_axi_araddr : in std_logic_vector( 3-1 downto 0 );
    audio_gain_s_axi_arvalid : in std_logic;
    audio_gain_s_axi_rready : in std_logic;
    bclk_out : out std_logic_vector( 1-1 downto 0 );
    lrclk_out : out std_logic_vector( 1-1 downto 0 );
    sdata_out : out std_logic_vector( 1-1 downto 0 );
    audio_gain_s_axi_awready : out std_logic;
    audio_gain_s_axi_wready : out std_logic;
    audio_gain_s_axi_bresp : out std_logic_vector( 2-1 downto 0 );
    audio_gain_s_axi_bvalid : out std_logic;
    audio_gain_s_axi_arready : out std_logic;
    audio_gain_s_axi_rdata : out std_logic_vector( 32-1 downto 0 );
    audio_gain_s_axi_rresp : out std_logic_vector( 2-1 downto 0 );
    audio_gain_s_axi_rvalid : out std_logic
  );
end audio_gain;
architecture structural of audio_gain is 
  attribute core_generation_info : string;
  attribute core_generation_info of structural : architecture is "audio_gain,sysgen_core_2020_1,{,compilation=IP Catalog,block_icon_display=Default,family=zynq,part=xc7z020,speed=-1,package=clg400,synthesis_language=vhdl,hdl_library=xil_defaultlib,synthesis_strategy=Vivado Synthesis Defaults,implementation_strategy=Vivado Implementation Defaults,testbench=0,interface_doc=0,ce_clr=0,clock_period=10,system_simulink_period=1e-08,waveform_viewer=1,axilite_interface=1,ip_catalog_plugin=0,hwcosim_burst_mode=0,simulation_time=0.00032,delay=7,dsamp=4,inv=1,mult=2,mux=1,p2s=1,register=8,reinterpret=2,s2p=2,slice=2,usamp=4,}";
  signal right_gain_in : std_logic_vector( 4-1 downto 0 );
  signal ce_1_net : std_logic;
  signal clk_1_net : std_logic;
  signal ce_16_net : std_logic;
  signal left_gain_in : std_logic_vector( 4-1 downto 0 );
  signal clk_16_net : std_logic;
  signal clk_32_net : std_logic;
  signal ce_32_net : std_logic;
  signal clk_1024_net : std_logic;
  signal ce_1024_net : std_logic;
  signal clk_net : std_logic;
begin
  audio_gain_axi_lite_interface : entity xil_defaultlib.audio_gain_axi_lite_interface 
  port map (
    audio_gain_s_axi_awaddr => audio_gain_s_axi_awaddr,
    audio_gain_s_axi_awvalid => audio_gain_s_axi_awvalid,
    audio_gain_s_axi_wdata => audio_gain_s_axi_wdata,
    audio_gain_s_axi_wstrb => audio_gain_s_axi_wstrb,
    audio_gain_s_axi_wvalid => audio_gain_s_axi_wvalid,
    audio_gain_s_axi_bready => audio_gain_s_axi_bready,
    audio_gain_s_axi_araddr => audio_gain_s_axi_araddr,
    audio_gain_s_axi_arvalid => audio_gain_s_axi_arvalid,
    audio_gain_s_axi_rready => audio_gain_s_axi_rready,
    audio_gain_aresetn => audio_gain_aresetn,
    audio_gain_aclk => clk,
    right_gain_in => right_gain_in,
    left_gain_in => left_gain_in,
    audio_gain_s_axi_awready => audio_gain_s_axi_awready,
    audio_gain_s_axi_wready => audio_gain_s_axi_wready,
    audio_gain_s_axi_bresp => audio_gain_s_axi_bresp,
    audio_gain_s_axi_bvalid => audio_gain_s_axi_bvalid,
    audio_gain_s_axi_arready => audio_gain_s_axi_arready,
    audio_gain_s_axi_rdata => audio_gain_s_axi_rdata,
    audio_gain_s_axi_rresp => audio_gain_s_axi_rresp,
    audio_gain_s_axi_rvalid => audio_gain_s_axi_rvalid,
    clk => clk_net
  );
  audio_gain_default_clock_driver : entity xil_defaultlib.audio_gain_default_clock_driver 
  port map (
    audio_gain_sysclk => clk_net,
    audio_gain_sysce => '1',
    audio_gain_sysclr => '0',
    audio_gain_clk1 => clk_1_net,
    audio_gain_ce1 => ce_1_net,
    audio_gain_clk16 => clk_16_net,
    audio_gain_ce16 => ce_16_net,
    audio_gain_clk32 => clk_32_net,
    audio_gain_ce32 => ce_32_net,
    audio_gain_clk1024 => clk_1024_net,
    audio_gain_ce1024 => ce_1024_net
  );
  audio_gain_struct : entity xil_defaultlib.audio_gain_struct 
  port map (
    bclk_in => bclk_in,
    lrclk_in => lrclk_in,
    left_gain_in => left_gain_in,
    right_gain_in => right_gain_in,
    sdata_in => sdata_in,
    clk_1 => clk_1_net,
    ce_1 => ce_1_net,
    clk_16 => clk_16_net,
    ce_16 => ce_16_net,
    clk_32 => clk_32_net,
    ce_32 => ce_32_net,
    clk_1024 => clk_1024_net,
    ce_1024 => ce_1024_net,
    bclk_out => bclk_out,
    lrclk_out => lrclk_out,
    sdata_out => sdata_out
  );
end structural;
