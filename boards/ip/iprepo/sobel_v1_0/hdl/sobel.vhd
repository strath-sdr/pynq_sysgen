-- Generated from Simulink block sobel/AXI-Lite Communication
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity sobel_axi_lite_communication is
  port (
    thresh_reg : in std_logic_vector( 32-1 downto 0 );
    axi_lite_threshold : out std_logic_vector( 8-1 downto 0 )
  );
end sobel_axi_lite_communication;
architecture structural of sobel_axi_lite_communication is 
  signal thresh_reg_net : std_logic_vector( 32-1 downto 0 );
  signal slice_y_net : std_logic_vector( 8-1 downto 0 );
begin
  axi_lite_threshold <= slice_y_net;
  thresh_reg_net <= thresh_reg;
  slice : entity xil_defaultlib.sobel_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 7,
    x_width => 32,
    y_width => 8
  )
  port map (
    x => thresh_reg_net,
    y => slice_y_net
  );
end structural;
-- Generated from Simulink block sobel/DUT/AXI-Stream Master Interface
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity sobel_axi_stream_master_interface is
  port (
    s_tvalid : in std_logic_vector( 1-1 downto 0 );
    s_tdata : in std_logic_vector( 8-1 downto 0 );
    s_tlast : in std_logic_vector( 1-1 downto 0 );
    m_axis_tready : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    s_tready : out std_logic_vector( 1-1 downto 0 );
    m_axis_tdata : out std_logic_vector( 8-1 downto 0 );
    m_axis_tlast : out std_logic_vector( 1-1 downto 0 );
    m_axis_tvalid : out std_logic_vector( 1-1 downto 0 )
  );
end sobel_axi_stream_master_interface;
architecture structural of sobel_axi_stream_master_interface is 
  signal m_axis_tready_net : std_logic_vector( 1-1 downto 0 );
  signal fifo_tlast_dout_net : std_logic_vector( 1-1 downto 0 );
  signal constant_op_net : std_logic_vector( 8-1 downto 0 );
  signal fifo_tdata_dout_net : std_logic_vector( 8-1 downto 0 );
  signal clk_net : std_logic;
  signal convert_dout_net : std_logic_vector( 1-1 downto 0 );
  signal mux_y_net : std_logic_vector( 8-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 1-1 downto 0 );
  signal register_q_net : std_logic_vector( 1-1 downto 0 );
  signal register_q_net_x0 : std_logic_vector( 1-1 downto 0 );
  signal register1_q_net : std_logic_vector( 1-1 downto 0 );
  signal inverter1_op_net : std_logic_vector( 1-1 downto 0 );
  signal ce_net : std_logic;
  signal fifo_tlast_empty_net : std_logic;
  signal fifo_tdata_full_net : std_logic;
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal fifo_tdata_dcount_net : std_logic_vector( 8-1 downto 0 );
  signal relational_op_net : std_logic_vector( 1-1 downto 0 );
  signal fifo_tlast_full_net : std_logic;
  signal logical2_y_net : std_logic;
  signal fifo_tdata_empty_net : std_logic;
begin
  s_tready <= inverter1_op_net;
  register_q_net_x0 <= s_tvalid;
  mux_y_net <= s_tdata;
  register1_q_net <= s_tlast;
  m_axis_tdata <= fifo_tdata_dout_net;
  m_axis_tlast <= convert1_dout_net;
  m_axis_tready_net <= m_axis_tready;
  m_axis_tvalid <= register_q_net;
  clk_net <= clk_1;
  ce_net <= ce_1;
  constant_x0 : entity xil_defaultlib.sysgen_constant_d9dc37ccbf 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  convert : entity xil_defaultlib.sobel_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 1,
    din_bin_pt => 0,
    din_width => 1,
    dout_arith => 1,
    dout_bin_pt => 0,
    dout_width => 1,
    latency => 0,
    overflow => xlWrap,
    quantization => xlTruncate
  )
  port map (
    clr => '0',
    en => "1",
    din => register1_q_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert_dout_net
  );
  convert1 : entity xil_defaultlib.sobel_xlconvert 
  generic map (
    bool_conversion => 1,
    din_arith => 1,
    din_bin_pt => 0,
    din_width => 1,
    dout_arith => 1,
    dout_bin_pt => 0,
    dout_width => 1,
    latency => 0,
    overflow => xlWrap,
    quantization => xlTruncate
  )
  port map (
    clr => '0',
    en => "1",
    din => fifo_tlast_dout_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert1_dout_net
  );
  fifo_tdata : entity xil_defaultlib.sobel_xlfifogen_u 
  generic map (
    core_name0 => "sobel_fifo_generator_i0",
    data_count_width => 8,
    data_width => 8,
    extra_registers => 0,
    has_ae => 0,
    has_af => 0,
    has_rst => false,
    ignore_din_for_gcd => false,
    percent_full_width => 1
  )
  port map (
    en => '1',
    rst => '0',
    din => mux_y_net,
    we => register_q_net_x0(0),
    re => logical2_y_net,
    clk => clk_net,
    ce => ce_net,
    we_ce => ce_net,
    re_ce => ce_net,
    dout => fifo_tdata_dout_net,
    empty => fifo_tdata_empty_net,
    full => fifo_tdata_full_net,
    dcount => fifo_tdata_dcount_net
  );
  fifo_tlast : entity xil_defaultlib.sobel_xlfifogen_u 
  generic map (
    core_name0 => "sobel_fifo_generator_i1",
    data_count_width => 8,
    data_width => 1,
    extra_registers => 0,
    has_ae => 0,
    has_af => 0,
    has_rst => false,
    ignore_din_for_gcd => false,
    percent_full_width => 1
  )
  port map (
    en => '1',
    rst => '0',
    din => convert_dout_net,
    we => register_q_net_x0(0),
    re => logical2_y_net,
    clk => clk_net,
    ce => ce_net,
    we_ce => ce_net,
    re_ce => ce_net,
    dout => fifo_tlast_dout_net,
    empty => fifo_tlast_empty_net,
    full => fifo_tlast_full_net
  );
  inverter : entity xil_defaultlib.sysgen_inverter_c37737e210 
  port map (
    clr => '0',
    ip(0) => fifo_tdata_empty_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  inverter1 : entity xil_defaultlib.sysgen_inverter_c37737e210 
  port map (
    clr => '0',
    ip => relational_op_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter1_op_net
  );
  logical2 : entity xil_defaultlib.sysgen_logical_4935ffcc5e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => m_axis_tready_net,
    d1 => inverter_op_net,
    y(0) => logical2_y_net
  );
  register_x0 : entity xil_defaultlib.sobel_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    en => "1",
    rst => "0",
    d => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    q => register_q_net
  );
  relational : entity xil_defaultlib.sysgen_relational_7c4a6e0fc0 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => fifo_tdata_dcount_net,
    b => constant_op_net,
    op => relational_op_net
  );
end structural;
-- Generated from Simulink block sobel/DUT/AXI-Stream Slave Interface
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity sobel_axi_stream_slave_interface is
  port (
    m_tready : in std_logic_vector( 1-1 downto 0 );
    s_axis_tdata : in std_logic_vector( 32-1 downto 0 );
    s_axis_tvalid : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    m_tvalid : out std_logic_vector( 1-1 downto 0 );
    m_tdata : out std_logic_vector( 32-1 downto 0 );
    s_axis_tready : out std_logic_vector( 1-1 downto 0 )
  );
end sobel_axi_stream_slave_interface;
architecture structural of sobel_axi_stream_slave_interface is 
  signal inverter1_op_net_x0 : std_logic_vector( 1-1 downto 0 );
  signal s_axis_tvalid_net : std_logic_vector( 1-1 downto 0 );
  signal fifo_tdata_dout_net : std_logic_vector( 32-1 downto 0 );
  signal inverter1_op_net : std_logic_vector( 1-1 downto 0 );
  signal s_axis_tdata_net : std_logic_vector( 32-1 downto 0 );
  signal register_q_net : std_logic_vector( 1-1 downto 0 );
  signal fifo_tdata_empty_net : std_logic;
  signal ce_net : std_logic;
  signal logical2_y_net : std_logic;
  signal clk_net : std_logic;
  signal fifo_tdata_full_net : std_logic;
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal logical1_y_net : std_logic;
begin
  m_tvalid <= register_q_net;
  m_tdata <= fifo_tdata_dout_net;
  inverter1_op_net <= m_tready;
  s_axis_tdata_net <= s_axis_tdata;
  s_axis_tready <= inverter1_op_net_x0;
  s_axis_tvalid_net <= s_axis_tvalid;
  clk_net <= clk_1;
  ce_net <= ce_1;
  fifo_tdata : entity xil_defaultlib.sobel_xlfifogen_u 
  generic map (
    core_name0 => "sobel_fifo_generator_i2",
    data_count_width => 8,
    data_width => 32,
    extra_registers => 0,
    has_ae => 0,
    has_af => 0,
    has_rst => false,
    ignore_din_for_gcd => false,
    percent_full_width => 1
  )
  port map (
    en => '1',
    rst => '0',
    din => s_axis_tdata_net,
    we => logical1_y_net,
    re => logical2_y_net,
    clk => clk_net,
    ce => ce_net,
    we_ce => ce_net,
    re_ce => ce_net,
    dout => fifo_tdata_dout_net,
    empty => fifo_tdata_empty_net,
    full => fifo_tdata_full_net
  );
  inverter : entity xil_defaultlib.sysgen_inverter_c37737e210 
  port map (
    clr => '0',
    ip(0) => fifo_tdata_empty_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  inverter1 : entity xil_defaultlib.sysgen_inverter_c37737e210 
  port map (
    clr => '0',
    ip(0) => fifo_tdata_full_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter1_op_net_x0
  );
  logical1 : entity xil_defaultlib.sysgen_logical_4935ffcc5e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => s_axis_tvalid_net,
    d1 => inverter1_op_net_x0,
    y(0) => logical1_y_net
  );
  logical2 : entity xil_defaultlib.sysgen_logical_4935ffcc5e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => inverter1_op_net,
    d1 => inverter_op_net,
    y(0) => logical2_y_net
  );
  register_x0 : entity xil_defaultlib.sobel_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    en => "1",
    rst => "0",
    d(0) => logical2_y_net,
    clk => clk_net,
    ce => ce_net,
    q => register_q_net
  );
end structural;
-- Generated from Simulink block sobel/DUT/Hardware Accelerator/Coordinate Counter
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity sobel_coordinate_counter is
  port (
    valid : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    x_value : out std_logic_vector( 11-1 downto 0 );
    y_value : out std_logic_vector( 11-1 downto 0 )
  );
end sobel_coordinate_counter;
architecture structural of sobel_coordinate_counter is 
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal constant_op_net : std_logic_vector( 11-1 downto 0 );
  signal x_counter_op_net : std_logic_vector( 11-1 downto 0 );
  signal y_counter_op_net : std_logic_vector( 11-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 1-1 downto 0 );
  signal relational_op_net : std_logic_vector( 1-1 downto 0 );
begin
  x_value <= x_counter_op_net;
  y_value <= y_counter_op_net;
  delay1_q_net <= valid;
  clk_net <= clk_1;
  ce_net <= ce_1;
  constant_x0 : entity xil_defaultlib.sysgen_constant_d8fce9d94c 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  relational : entity xil_defaultlib.sysgen_relational_1ef06172f9 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => constant_op_net,
    b => x_counter_op_net,
    op => relational_op_net
  );
  x_counter : entity xil_defaultlib.sobel_xlcounter_limit 
  generic map (
    cnt_15_0 => 1921,
    cnt_31_16 => 0,
    cnt_47_32 => 0,
    cnt_63_48 => 0,
    core_name0 => "sobel_c_counter_binary_v12_0_i0",
    count_limited => 1,
    op_arith => xlUnsigned,
    op_width => 11
  )
  port map (
    rst => "0",
    clr => '0',
    en => delay1_q_net,
    clk => clk_net,
    ce => ce_net,
    op => x_counter_op_net
  );
  y_counter : entity xil_defaultlib.sobel_xlcounter_limit 
  generic map (
    cnt_15_0 => 1081,
    cnt_31_16 => 0,
    cnt_47_32 => 0,
    cnt_63_48 => 0,
    core_name0 => "sobel_c_counter_binary_v12_0_i0",
    count_limited => 1,
    op_arith => xlUnsigned,
    op_width => 11
  )
  port map (
    rst => "0",
    clr => '0',
    en => relational_op_net,
    clk => clk_net,
    ce => ce_net,
    op => y_counter_op_net
  );
end structural;
-- Generated from Simulink block sobel/DUT/Hardware Accelerator/RGB To Greyscale
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity sobel_rgb_to_greyscale is
  port (
    rgb : in std_logic_vector( 32-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    y : out std_logic_vector( 8-1 downto 0 )
  );
end sobel_rgb_to_greyscale;
architecture structural of sobel_rgb_to_greyscale is 
  signal cmult1_p_net : std_logic_vector( 24-1 downto 0 );
  signal green_y_net : std_logic_vector( 8-1 downto 0 );
  signal clk_net : std_logic;
  signal cmult2_p_net : std_logic_vector( 24-1 downto 0 );
  signal register_q_net : std_logic_vector( 24-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 8-1 downto 0 );
  signal red_y_net : std_logic_vector( 8-1 downto 0 );
  signal blue_y_net : std_logic_vector( 8-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 25-1 downto 0 );
  signal fifo_tdata_dout_net : std_logic_vector( 32-1 downto 0 );
  signal ce_net : std_logic;
  signal cmult_p_net : std_logic_vector( 24-1 downto 0 );
begin
  y <= addsub1_s_net;
  fifo_tdata_dout_net <= rgb;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity xil_defaultlib.sobel_xladdsub 
  generic map (
    a_arith => xlUnsigned,
    a_bin_pt => 15,
    a_width => 24,
    b_arith => xlUnsigned,
    b_bin_pt => 15,
    b_width => 24,
    c_has_c_out => 0,
    c_latency => 1,
    c_output_width => 25,
    core_name0 => "sobel_c_addsub_v12_0_i0",
    extra_registers => 0,
    full_s_arith => 1,
    full_s_width => 25,
    latency => 1,
    overflow => 1,
    quantization => 1,
    s_arith => xlUnsigned,
    s_bin_pt => 15,
    s_width => 25
  )
  port map (
    clr => '0',
    en => "1",
    a => cmult_p_net,
    b => cmult2_p_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity xil_defaultlib.sobel_xladdsub 
  generic map (
    a_arith => xlUnsigned,
    a_bin_pt => 15,
    a_width => 25,
    b_arith => xlUnsigned,
    b_bin_pt => 15,
    b_width => 24,
    c_has_c_out => 0,
    c_latency => 1,
    c_output_width => 26,
    core_name0 => "sobel_c_addsub_v12_0_i1",
    extra_registers => 0,
    full_s_arith => 1,
    full_s_width => 26,
    latency => 1,
    overflow => 1,
    quantization => 1,
    s_arith => xlUnsigned,
    s_bin_pt => 0,
    s_width => 8
  )
  port map (
    clr => '0',
    en => "1",
    a => addsub_s_net,
    b => register_q_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  blue : entity xil_defaultlib.sobel_xlslice 
  generic map (
    new_lsb => 8,
    new_msb => 15,
    x_width => 32,
    y_width => 8
  )
  port map (
    x => fifo_tdata_dout_net,
    y => blue_y_net
  );
  cmult : entity xil_defaultlib.sobel_xlcmult 
  generic map (
    a_arith => xlUnsigned,
    a_bin_pt => 0,
    a_width => 8,
    b_bin_pt => 15,
    c_a_type => 1,
    c_a_width => 8,
    c_b_type => 1,
    c_b_width => 16,
    c_output_width => 24,
    core_name0 => "sobel_mult_gen_v12_0_i0",
    extra_registers => 0,
    multsign => 1,
    overflow => 1,
    p_arith => xlUnsigned,
    p_bin_pt => 15,
    p_width => 24,
    quantization => 1,
    zero_const => 0
  )
  port map (
    clr => '0',
    core_clr => '1',
    en => "1",
    rst => "0",
    a => red_y_net,
    clk => clk_net,
    ce => ce_net,
    core_clk => clk_net,
    core_ce => ce_net,
    p => cmult_p_net
  );
  cmult1 : entity xil_defaultlib.sobel_xlcmult 
  generic map (
    a_arith => xlUnsigned,
    a_bin_pt => 0,
    a_width => 8,
    b_bin_pt => 15,
    c_a_type => 1,
    c_a_width => 8,
    c_b_type => 1,
    c_b_width => 16,
    c_output_width => 24,
    core_name0 => "sobel_mult_gen_v12_0_i1",
    extra_registers => 0,
    multsign => 1,
    overflow => 1,
    p_arith => xlUnsigned,
    p_bin_pt => 15,
    p_width => 24,
    quantization => 1,
    zero_const => 0
  )
  port map (
    clr => '0',
    core_clr => '1',
    en => "1",
    rst => "0",
    a => green_y_net,
    clk => clk_net,
    ce => ce_net,
    core_clk => clk_net,
    core_ce => ce_net,
    p => cmult1_p_net
  );
  cmult2 : entity xil_defaultlib.sobel_xlcmult 
  generic map (
    a_arith => xlUnsigned,
    a_bin_pt => 0,
    a_width => 8,
    b_bin_pt => 15,
    c_a_type => 1,
    c_a_width => 8,
    c_b_type => 1,
    c_b_width => 16,
    c_output_width => 24,
    core_name0 => "sobel_mult_gen_v12_0_i2",
    extra_registers => 0,
    multsign => 1,
    overflow => 1,
    p_arith => xlUnsigned,
    p_bin_pt => 15,
    p_width => 24,
    quantization => 1,
    zero_const => 0
  )
  port map (
    clr => '0',
    core_clr => '1',
    en => "1",
    rst => "0",
    a => blue_y_net,
    clk => clk_net,
    ce => ce_net,
    core_clk => clk_net,
    core_ce => ce_net,
    p => cmult2_p_net
  );
  green : entity xil_defaultlib.sobel_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 7,
    x_width => 32,
    y_width => 8
  )
  port map (
    x => fifo_tdata_dout_net,
    y => green_y_net
  );
  red : entity xil_defaultlib.sobel_xlslice 
  generic map (
    new_lsb => 16,
    new_msb => 23,
    x_width => 32,
    y_width => 8
  )
  port map (
    x => fifo_tdata_dout_net,
    y => red_y_net
  );
  register_x0 : entity xil_defaultlib.sobel_xlregister 
  generic map (
    d_width => 24,
    init_value => b"000000000000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => cmult1_p_net,
    clk => clk_net,
    ce => ce_net,
    q => register_q_net
  );
end structural;
-- Generated from Simulink block sobel/DUT/Hardware Accelerator/Signal Correction
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity sobel_signal_correction is
  port (
    x_value : in std_logic_vector( 11-1 downto 0 );
    y_value : in std_logic_vector( 11-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    valid : out std_logic_vector( 1-1 downto 0 );
    last : out std_logic_vector( 1-1 downto 0 )
  );
end sobel_signal_correction;
architecture structural of sobel_signal_correction is 
  signal x_counter_op_net : std_logic_vector( 11-1 downto 0 );
  signal ce_net : std_logic;
  signal relational2_op_net : std_logic_vector( 1-1 downto 0 );
  signal relational_op_net : std_logic_vector( 1-1 downto 0 );
  signal register_q_net : std_logic_vector( 1-1 downto 0 );
  signal constant_op_net : std_logic_vector( 11-1 downto 0 );
  signal logical_y_net : std_logic_vector( 1-1 downto 0 );
  signal constant1_op_net : std_logic_vector( 11-1 downto 0 );
  signal constant2_op_net : std_logic_vector( 11-1 downto 0 );
  signal register1_q_net : std_logic_vector( 1-1 downto 0 );
  signal y_counter_op_net : std_logic_vector( 11-1 downto 0 );
  signal constant3_op_net : std_logic_vector( 11-1 downto 0 );
  signal clk_net : std_logic;
  signal logical3_y_net : std_logic_vector( 1-1 downto 0 );
  signal register2_q_net : std_logic_vector( 11-1 downto 0 );
  signal logical2_y_net : std_logic_vector( 1-1 downto 0 );
  signal relational5_op_net : std_logic_vector( 1-1 downto 0 );
  signal register3_q_net : std_logic_vector( 11-1 downto 0 );
  signal relational1_op_net : std_logic_vector( 1-1 downto 0 );
  signal relational4_op_net : std_logic_vector( 1-1 downto 0 );
  signal relational3_op_net : std_logic_vector( 1-1 downto 0 );
  signal logical1_y_net : std_logic_vector( 1-1 downto 0 );
begin
  valid <= register_q_net;
  last <= register1_q_net;
  x_counter_op_net <= x_value;
  y_counter_op_net <= y_value;
  clk_net <= clk_1;
  ce_net <= ce_1;
  constant_x0 : entity xil_defaultlib.sysgen_constant_ad5dd53988 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  constant1 : entity xil_defaultlib.sysgen_constant_ad5dd53988 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant1_op_net
  );
  constant2 : entity xil_defaultlib.sysgen_constant_7e760d538d 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant2_op_net
  );
  constant3 : entity xil_defaultlib.sysgen_constant_27fa3b06d5 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant3_op_net
  );
  logical : entity xil_defaultlib.sysgen_logical_4935ffcc5e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => relational_op_net,
    d1 => relational2_op_net,
    y => logical_y_net
  );
  logical1 : entity xil_defaultlib.sysgen_logical_4935ffcc5e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => relational1_op_net,
    d1 => relational3_op_net,
    y => logical1_y_net
  );
  logical2 : entity xil_defaultlib.sysgen_logical_4935ffcc5e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => logical_y_net,
    d1 => logical1_y_net,
    y => logical2_y_net
  );
  logical3 : entity xil_defaultlib.sysgen_logical_4935ffcc5e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => relational4_op_net,
    d1 => relational5_op_net,
    y => logical3_y_net
  );
  register_x0 : entity xil_defaultlib.sobel_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    en => "1",
    rst => "0",
    d => logical2_y_net,
    clk => clk_net,
    ce => ce_net,
    q => register_q_net
  );
  register1 : entity xil_defaultlib.sobel_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    en => "1",
    rst => "0",
    d => logical3_y_net,
    clk => clk_net,
    ce => ce_net,
    q => register1_q_net
  );
  register2 : entity xil_defaultlib.sobel_xlregister 
  generic map (
    d_width => 11,
    init_value => b"00000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => x_counter_op_net,
    clk => clk_net,
    ce => ce_net,
    q => register2_q_net
  );
  register3 : entity xil_defaultlib.sobel_xlregister 
  generic map (
    d_width => 11,
    init_value => b"00000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => y_counter_op_net,
    clk => clk_net,
    ce => ce_net,
    q => register3_q_net
  );
  relational : entity xil_defaultlib.sysgen_relational_6994f8cf2b 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => register2_q_net,
    b => constant_op_net,
    op => relational_op_net
  );
  relational1 : entity xil_defaultlib.sysgen_relational_6994f8cf2b 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => register3_q_net,
    b => constant1_op_net,
    op => relational1_op_net
  );
  relational2 : entity xil_defaultlib.sysgen_relational_8ee4dd8619 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => register2_q_net,
    b => constant2_op_net,
    op => relational2_op_net
  );
  relational3 : entity xil_defaultlib.sysgen_relational_8ee4dd8619 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => register3_q_net,
    b => constant3_op_net,
    op => relational3_op_net
  );
  relational4 : entity xil_defaultlib.sysgen_relational_1ef06172f9 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => register3_q_net,
    b => constant3_op_net,
    op => relational4_op_net
  );
  relational5 : entity xil_defaultlib.sysgen_relational_1ef06172f9 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => register2_q_net,
    b => constant2_op_net,
    op => relational5_op_net
  );
end structural;
-- Generated from Simulink block sobel/DUT/Hardware Accelerator/Sobel Edge Filter/Filter Function/Gx Operation
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity sobel_gx_operation is
  port (
    w00 : in std_logic_vector( 8-1 downto 0 );
    w02 : in std_logic_vector( 8-1 downto 0 );
    w10 : in std_logic_vector( 8-1 downto 0 );
    w12 : in std_logic_vector( 8-1 downto 0 );
    w20 : in std_logic_vector( 8-1 downto 0 );
    w22 : in std_logic_vector( 8-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    gx : out std_logic_vector( 12-1 downto 0 )
  );
end sobel_gx_operation;
architecture structural of sobel_gx_operation is 
  signal addsub4_s_net : std_logic_vector( 12-1 downto 0 );
  signal register6_q_net : std_logic_vector( 8-1 downto 0 );
  signal register2_q_net : std_logic_vector( 8-1 downto 0 );
  signal register4_q_net : std_logic_vector( 8-1 downto 0 );
  signal register9_q_net : std_logic_vector( 8-1 downto 0 );
  signal clk_net : std_logic;
  signal register8_q_net : std_logic_vector( 8-1 downto 0 );
  signal cmult1_p_net : std_logic_vector( 10-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 9-1 downto 0 );
  signal cmult_p_net : std_logic_vector( 10-1 downto 0 );
  signal ce_net : std_logic;
  signal addsub2_s_net : std_logic_vector( 9-1 downto 0 );
  signal register7_q_net : std_logic_vector( 8-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 11-1 downto 0 );
  signal addsub3_s_net : std_logic_vector( 10-1 downto 0 );
begin
  gx <= addsub4_s_net;
  register6_q_net <= w00;
  register9_q_net <= w02;
  register4_q_net <= w10;
  register7_q_net <= w12;
  register2_q_net <= w20;
  register8_q_net <= w22;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity xil_defaultlib.sobel_xladdsub 
  generic map (
    a_arith => xlUnsigned,
    a_bin_pt => 0,
    a_width => 8,
    b_arith => xlUnsigned,
    b_bin_pt => 0,
    b_width => 8,
    c_has_c_out => 0,
    c_latency => 1,
    c_output_width => 9,
    core_name0 => "sobel_c_addsub_v12_0_i2",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 9,
    latency => 1,
    overflow => 1,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 0,
    s_width => 9
  )
  port map (
    clr => '0',
    en => "1",
    a => register9_q_net,
    b => register6_q_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity xil_defaultlib.sobel_xladdsub 
  generic map (
    a_arith => xlUnsigned,
    a_bin_pt => 0,
    a_width => 10,
    b_arith => xlUnsigned,
    b_bin_pt => 0,
    b_width => 10,
    c_has_c_out => 0,
    c_latency => 1,
    c_output_width => 11,
    core_name0 => "sobel_c_addsub_v12_0_i3",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 11,
    latency => 1,
    overflow => 1,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 0,
    s_width => 11
  )
  port map (
    clr => '0',
    en => "1",
    a => cmult1_p_net,
    b => cmult_p_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity xil_defaultlib.sobel_xladdsub 
  generic map (
    a_arith => xlUnsigned,
    a_bin_pt => 0,
    a_width => 8,
    b_arith => xlUnsigned,
    b_bin_pt => 0,
    b_width => 8,
    c_has_c_out => 0,
    c_latency => 1,
    c_output_width => 9,
    core_name0 => "sobel_c_addsub_v12_0_i2",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 9,
    latency => 1,
    overflow => 1,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 0,
    s_width => 9
  )
  port map (
    clr => '0',
    en => "1",
    a => register8_q_net,
    b => register2_q_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  addsub3 : entity xil_defaultlib.sobel_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 0,
    a_width => 9,
    b_arith => xlSigned,
    b_bin_pt => 0,
    b_width => 9,
    c_has_c_out => 0,
    c_latency => 1,
    c_output_width => 10,
    core_name0 => "sobel_c_addsub_v12_0_i4",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 10,
    latency => 1,
    overflow => 1,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 0,
    s_width => 10
  )
  port map (
    clr => '0',
    en => "1",
    a => addsub_s_net,
    b => addsub2_s_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub3_s_net
  );
  addsub4 : entity xil_defaultlib.sobel_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 0,
    a_width => 10,
    b_arith => xlSigned,
    b_bin_pt => 0,
    b_width => 11,
    c_has_c_out => 0,
    c_latency => 1,
    c_output_width => 12,
    core_name0 => "sobel_c_addsub_v12_0_i5",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 12,
    latency => 1,
    overflow => 1,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 0,
    s_width => 12
  )
  port map (
    clr => '0',
    en => "1",
    a => addsub3_s_net,
    b => addsub1_s_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub4_s_net
  );
  cmult : entity xil_defaultlib.sobel_xlcmult 
  generic map (
    a_arith => xlUnsigned,
    a_bin_pt => 0,
    a_width => 8,
    b_bin_pt => 0,
    c_a_type => 1,
    c_a_width => 8,
    c_b_type => 1,
    c_b_width => 2,
    c_output_width => 10,
    core_name0 => "sobel_mult_gen_v12_0_i3",
    extra_registers => 1,
    multsign => 1,
    overflow => 1,
    p_arith => xlUnsigned,
    p_bin_pt => 0,
    p_width => 10,
    quantization => 1,
    zero_const => 0
  )
  port map (
    clr => '0',
    core_clr => '1',
    en => "1",
    rst => "0",
    a => register4_q_net,
    clk => clk_net,
    ce => ce_net,
    core_clk => clk_net,
    core_ce => ce_net,
    p => cmult_p_net
  );
  cmult1 : entity xil_defaultlib.sobel_xlcmult 
  generic map (
    a_arith => xlUnsigned,
    a_bin_pt => 0,
    a_width => 8,
    b_bin_pt => 0,
    c_a_type => 1,
    c_a_width => 8,
    c_b_type => 1,
    c_b_width => 2,
    c_output_width => 10,
    core_name0 => "sobel_mult_gen_v12_0_i3",
    extra_registers => 1,
    multsign => 1,
    overflow => 1,
    p_arith => xlUnsigned,
    p_bin_pt => 0,
    p_width => 10,
    quantization => 1,
    zero_const => 0
  )
  port map (
    clr => '0',
    core_clr => '1',
    en => "1",
    rst => "0",
    a => register7_q_net,
    clk => clk_net,
    ce => ce_net,
    core_clk => clk_net,
    core_ce => ce_net,
    p => cmult1_p_net
  );
end structural;
-- Generated from Simulink block sobel/DUT/Hardware Accelerator/Sobel Edge Filter/Filter Function/Gy Operation
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity sobel_gy_operation is
  port (
    w00 : in std_logic_vector( 8-1 downto 0 );
    w01 : in std_logic_vector( 8-1 downto 0 );
    w02 : in std_logic_vector( 8-1 downto 0 );
    w20 : in std_logic_vector( 8-1 downto 0 );
    w21 : in std_logic_vector( 8-1 downto 0 );
    w22 : in std_logic_vector( 8-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    gy : out std_logic_vector( 12-1 downto 0 )
  );
end sobel_gy_operation;
architecture structural of sobel_gy_operation is 
  signal register1_q_net : std_logic_vector( 8-1 downto 0 );
  signal register8_q_net : std_logic_vector( 8-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal register9_q_net : std_logic_vector( 8-1 downto 0 );
  signal addsub4_s_net : std_logic_vector( 12-1 downto 0 );
  signal register5_q_net : std_logic_vector( 8-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 9-1 downto 0 );
  signal register6_q_net : std_logic_vector( 8-1 downto 0 );
  signal register2_q_net : std_logic_vector( 8-1 downto 0 );
  signal cmult1_p_net : std_logic_vector( 10-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 11-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 9-1 downto 0 );
  signal cmult_p_net : std_logic_vector( 10-1 downto 0 );
  signal addsub3_s_net : std_logic_vector( 10-1 downto 0 );
begin
  gy <= addsub4_s_net;
  register6_q_net <= w00;
  register5_q_net <= w01;
  register9_q_net <= w02;
  register2_q_net <= w20;
  register1_q_net <= w21;
  register8_q_net <= w22;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity xil_defaultlib.sobel_xladdsub 
  generic map (
    a_arith => xlUnsigned,
    a_bin_pt => 0,
    a_width => 8,
    b_arith => xlUnsigned,
    b_bin_pt => 0,
    b_width => 8,
    c_has_c_out => 0,
    c_latency => 1,
    c_output_width => 9,
    core_name0 => "sobel_c_addsub_v12_0_i2",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 9,
    latency => 1,
    overflow => 1,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 0,
    s_width => 9
  )
  port map (
    clr => '0',
    en => "1",
    a => register2_q_net,
    b => register6_q_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity xil_defaultlib.sobel_xladdsub 
  generic map (
    a_arith => xlUnsigned,
    a_bin_pt => 0,
    a_width => 10,
    b_arith => xlUnsigned,
    b_bin_pt => 0,
    b_width => 10,
    c_has_c_out => 0,
    c_latency => 1,
    c_output_width => 11,
    core_name0 => "sobel_c_addsub_v12_0_i3",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 11,
    latency => 1,
    overflow => 1,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 0,
    s_width => 11
  )
  port map (
    clr => '0',
    en => "1",
    a => cmult1_p_net,
    b => cmult_p_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity xil_defaultlib.sobel_xladdsub 
  generic map (
    a_arith => xlUnsigned,
    a_bin_pt => 0,
    a_width => 8,
    b_arith => xlUnsigned,
    b_bin_pt => 0,
    b_width => 8,
    c_has_c_out => 0,
    c_latency => 1,
    c_output_width => 9,
    core_name0 => "sobel_c_addsub_v12_0_i2",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 9,
    latency => 1,
    overflow => 1,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 0,
    s_width => 9
  )
  port map (
    clr => '0',
    en => "1",
    a => register8_q_net,
    b => register9_q_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  addsub3 : entity xil_defaultlib.sobel_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 0,
    a_width => 9,
    b_arith => xlSigned,
    b_bin_pt => 0,
    b_width => 9,
    c_has_c_out => 0,
    c_latency => 1,
    c_output_width => 10,
    core_name0 => "sobel_c_addsub_v12_0_i4",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 10,
    latency => 1,
    overflow => 1,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 0,
    s_width => 10
  )
  port map (
    clr => '0',
    en => "1",
    a => addsub_s_net,
    b => addsub2_s_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub3_s_net
  );
  addsub4 : entity xil_defaultlib.sobel_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 0,
    a_width => 10,
    b_arith => xlSigned,
    b_bin_pt => 0,
    b_width => 11,
    c_has_c_out => 0,
    c_latency => 1,
    c_output_width => 12,
    core_name0 => "sobel_c_addsub_v12_0_i5",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 12,
    latency => 1,
    overflow => 1,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 0,
    s_width => 12
  )
  port map (
    clr => '0',
    en => "1",
    a => addsub3_s_net,
    b => addsub1_s_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub4_s_net
  );
  cmult : entity xil_defaultlib.sobel_xlcmult 
  generic map (
    a_arith => xlUnsigned,
    a_bin_pt => 0,
    a_width => 8,
    b_bin_pt => 0,
    c_a_type => 1,
    c_a_width => 8,
    c_b_type => 1,
    c_b_width => 2,
    c_output_width => 10,
    core_name0 => "sobel_mult_gen_v12_0_i3",
    extra_registers => 1,
    multsign => 1,
    overflow => 1,
    p_arith => xlUnsigned,
    p_bin_pt => 0,
    p_width => 10,
    quantization => 1,
    zero_const => 0
  )
  port map (
    clr => '0',
    core_clr => '1',
    en => "1",
    rst => "0",
    a => register5_q_net,
    clk => clk_net,
    ce => ce_net,
    core_clk => clk_net,
    core_ce => ce_net,
    p => cmult_p_net
  );
  cmult1 : entity xil_defaultlib.sobel_xlcmult 
  generic map (
    a_arith => xlUnsigned,
    a_bin_pt => 0,
    a_width => 8,
    b_bin_pt => 0,
    c_a_type => 1,
    c_a_width => 8,
    c_b_type => 1,
    c_b_width => 2,
    c_output_width => 10,
    core_name0 => "sobel_mult_gen_v12_0_i3",
    extra_registers => 1,
    multsign => 1,
    overflow => 1,
    p_arith => xlUnsigned,
    p_bin_pt => 0,
    p_width => 10,
    quantization => 1,
    zero_const => 0
  )
  port map (
    clr => '0',
    core_clr => '1',
    en => "1",
    rst => "0",
    a => register1_q_net,
    clk => clk_net,
    ce => ce_net,
    core_clk => clk_net,
    core_ce => ce_net,
    p => cmult1_p_net
  );
end structural;
-- Generated from Simulink block sobel/DUT/Hardware Accelerator/Sobel Edge Filter/Filter Function
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity sobel_filter_function is
  port (
    w00 : in std_logic_vector( 8-1 downto 0 );
    w01 : in std_logic_vector( 8-1 downto 0 );
    w02 : in std_logic_vector( 8-1 downto 0 );
    w10 : in std_logic_vector( 8-1 downto 0 );
    w11 : in std_logic_vector( 8-1 downto 0 );
    w12 : in std_logic_vector( 8-1 downto 0 );
    w20 : in std_logic_vector( 8-1 downto 0 );
    w21 : in std_logic_vector( 8-1 downto 0 );
    w22 : in std_logic_vector( 8-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    gx : out std_logic_vector( 12-1 downto 0 );
    gy : out std_logic_vector( 12-1 downto 0 )
  );
end sobel_filter_function;
architecture structural of sobel_filter_function is 
  signal addsub4_s_net : std_logic_vector( 12-1 downto 0 );
  signal register6_q_net : std_logic_vector( 8-1 downto 0 );
  signal addsub4_s_net_x0 : std_logic_vector( 12-1 downto 0 );
  signal ce_net : std_logic;
  signal register4_q_net : std_logic_vector( 8-1 downto 0 );
  signal register2_q_net : std_logic_vector( 8-1 downto 0 );
  signal clk_net : std_logic;
  signal register3_q_net : std_logic_vector( 8-1 downto 0 );
  signal register9_q_net : std_logic_vector( 8-1 downto 0 );
  signal register8_q_net : std_logic_vector( 8-1 downto 0 );
  signal register1_q_net : std_logic_vector( 8-1 downto 0 );
  signal register5_q_net : std_logic_vector( 8-1 downto 0 );
  signal register7_q_net : std_logic_vector( 8-1 downto 0 );
begin
  gx <= addsub4_s_net_x0;
  gy <= addsub4_s_net;
  register6_q_net <= w00;
  register5_q_net <= w01;
  register9_q_net <= w02;
  register4_q_net <= w10;
  register3_q_net <= w11;
  register7_q_net <= w12;
  register2_q_net <= w20;
  register1_q_net <= w21;
  register8_q_net <= w22;
  clk_net <= clk_1;
  ce_net <= ce_1;
  gx_operation : entity xil_defaultlib.sobel_gx_operation 
  port map (
    w00 => register6_q_net,
    w02 => register9_q_net,
    w10 => register4_q_net,
    w12 => register7_q_net,
    w20 => register2_q_net,
    w22 => register8_q_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    gx => addsub4_s_net_x0
  );
  gy_operation : entity xil_defaultlib.sobel_gy_operation 
  port map (
    w00 => register6_q_net,
    w01 => register5_q_net,
    w02 => register9_q_net,
    w20 => register2_q_net,
    w21 => register1_q_net,
    w22 => register8_q_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    gy => addsub4_s_net
  );
end structural;
-- Generated from Simulink block sobel/DUT/Hardware Accelerator/Sobel Edge Filter/Filter Window
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity sobel_filter_window is
  port (
    pixel : in std_logic_vector( 8-1 downto 0 );
    valid : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    w00 : out std_logic_vector( 8-1 downto 0 );
    w01 : out std_logic_vector( 8-1 downto 0 );
    w02 : out std_logic_vector( 8-1 downto 0 );
    w10 : out std_logic_vector( 8-1 downto 0 );
    w11 : out std_logic_vector( 8-1 downto 0 );
    w12 : out std_logic_vector( 8-1 downto 0 );
    w20 : out std_logic_vector( 8-1 downto 0 );
    w21 : out std_logic_vector( 8-1 downto 0 );
    w22 : out std_logic_vector( 8-1 downto 0 )
  );
end sobel_filter_window;
architecture structural of sobel_filter_window is 
  signal register5_q_net : std_logic_vector( 8-1 downto 0 );
  signal register2_q_net : std_logic_vector( 8-1 downto 0 );
  signal register8_q_net : std_logic_vector( 8-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 8-1 downto 0 );
  signal ce_net : std_logic;
  signal delay_q_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal register6_q_net : std_logic_vector( 8-1 downto 0 );
  signal register9_q_net : std_logic_vector( 8-1 downto 0 );
  signal register1_q_net : std_logic_vector( 8-1 downto 0 );
  signal register4_q_net : std_logic_vector( 8-1 downto 0 );
  signal register3_q_net : std_logic_vector( 8-1 downto 0 );
  signal register7_q_net : std_logic_vector( 8-1 downto 0 );
  signal row_buffer_q_net : std_logic_vector( 8-1 downto 0 );
  signal row_buffer1_q_net : std_logic_vector( 8-1 downto 0 );
begin
  w00 <= register6_q_net;
  w01 <= register5_q_net;
  w02 <= register9_q_net;
  w10 <= register4_q_net;
  w11 <= register3_q_net;
  w12 <= register7_q_net;
  w20 <= register2_q_net;
  w21 <= register1_q_net;
  w22 <= register8_q_net;
  addsub1_s_net <= pixel;
  delay_q_net <= valid;
  clk_net <= clk_1;
  ce_net <= ce_1;
  register1 : entity xil_defaultlib.sobel_xlregister 
  generic map (
    d_width => 8,
    init_value => b"00000000"
  )
  port map (
    rst => "0",
    d => register8_q_net,
    en => delay_q_net,
    clk => clk_net,
    ce => ce_net,
    q => register1_q_net
  );
  register2 : entity xil_defaultlib.sobel_xlregister 
  generic map (
    d_width => 8,
    init_value => b"00000000"
  )
  port map (
    rst => "0",
    d => register1_q_net,
    en => delay_q_net,
    clk => clk_net,
    ce => ce_net,
    q => register2_q_net
  );
  register3 : entity xil_defaultlib.sobel_xlregister 
  generic map (
    d_width => 8,
    init_value => b"00000000"
  )
  port map (
    rst => "0",
    d => register7_q_net,
    en => delay_q_net,
    clk => clk_net,
    ce => ce_net,
    q => register3_q_net
  );
  register4 : entity xil_defaultlib.sobel_xlregister 
  generic map (
    d_width => 8,
    init_value => b"00000000"
  )
  port map (
    rst => "0",
    d => register3_q_net,
    en => delay_q_net,
    clk => clk_net,
    ce => ce_net,
    q => register4_q_net
  );
  register5 : entity xil_defaultlib.sobel_xlregister 
  generic map (
    d_width => 8,
    init_value => b"00000000"
  )
  port map (
    rst => "0",
    d => register9_q_net,
    en => delay_q_net,
    clk => clk_net,
    ce => ce_net,
    q => register5_q_net
  );
  register6 : entity xil_defaultlib.sobel_xlregister 
  generic map (
    d_width => 8,
    init_value => b"00000000"
  )
  port map (
    rst => "0",
    d => register5_q_net,
    en => delay_q_net,
    clk => clk_net,
    ce => ce_net,
    q => register6_q_net
  );
  register7 : entity xil_defaultlib.sobel_xlregister 
  generic map (
    d_width => 8,
    init_value => b"00000000"
  )
  port map (
    rst => "0",
    d => row_buffer_q_net,
    en => delay_q_net,
    clk => clk_net,
    ce => ce_net,
    q => register7_q_net
  );
  register8 : entity xil_defaultlib.sobel_xlregister 
  generic map (
    d_width => 8,
    init_value => b"00000000"
  )
  port map (
    rst => "0",
    d => addsub1_s_net,
    en => delay_q_net,
    clk => clk_net,
    ce => ce_net,
    q => register8_q_net
  );
  register9 : entity xil_defaultlib.sobel_xlregister 
  generic map (
    d_width => 8,
    init_value => b"00000000"
  )
  port map (
    rst => "0",
    d => row_buffer1_q_net,
    en => delay_q_net,
    clk => clk_net,
    ce => ce_net,
    q => register9_q_net
  );
  row_buffer : entity xil_defaultlib.sobel_xldelay 
  generic map (
    latency => 1922,
    reg_retiming => 0,
    reset => 0,
    width => 8
  )
  port map (
    rst => '0',
    d => addsub1_s_net,
    en => delay_q_net(0),
    clk => clk_net,
    ce => ce_net,
    q => row_buffer_q_net
  );
  row_buffer1 : entity xil_defaultlib.sobel_xldelay 
  generic map (
    latency => 1922,
    reg_retiming => 0,
    reset => 0,
    width => 8
  )
  port map (
    rst => '0',
    d => addsub1_s_net,
    en => delay_q_net(0),
    clk => clk_net,
    ce => ce_net,
    q => row_buffer1_q_net
  );
end structural;
-- Generated from Simulink block sobel/DUT/Hardware Accelerator/Sobel Edge Filter/Gradient Approximation
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity sobel_gradient_approximation is
  port (
    gx : in std_logic_vector( 12-1 downto 0 );
    gy : in std_logic_vector( 12-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    gmag : out std_logic_vector( 8-1 downto 0 )
  );
end sobel_gradient_approximation;
architecture structural of sobel_gradient_approximation is 
  signal shift_op_net : std_logic_vector( 8-1 downto 0 );
  signal addsub4_s_net_x0 : std_logic_vector( 12-1 downto 0 );
  signal addsub4_s_net : std_logic_vector( 12-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal absolute1_op_net : std_logic_vector( 13-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 14-1 downto 0 );
  signal absolute_op_net : std_logic_vector( 13-1 downto 0 );
begin
  gmag <= shift_op_net;
  addsub4_s_net_x0 <= gx;
  addsub4_s_net <= gy;
  clk_net <= clk_1;
  ce_net <= ce_1;
  absolute : entity xil_defaultlib.sysgen_abs_d0b4ab89cc 
  port map (
    clr => '0',
    a => addsub4_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => absolute_op_net
  );
  absolute1 : entity xil_defaultlib.sysgen_abs_d0b4ab89cc 
  port map (
    clr => '0',
    a => addsub4_s_net,
    clk => clk_net,
    ce => ce_net,
    op => absolute1_op_net
  );
  addsub : entity xil_defaultlib.sobel_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 0,
    a_width => 13,
    b_arith => xlSigned,
    b_bin_pt => 0,
    b_width => 13,
    c_has_c_out => 0,
    c_latency => 1,
    c_output_width => 14,
    core_name0 => "sobel_c_addsub_v12_0_i6",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 14,
    latency => 1,
    overflow => 1,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 0,
    s_width => 14
  )
  port map (
    clr => '0',
    en => "1",
    a => absolute_op_net,
    b => absolute1_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  shift : entity xil_defaultlib.sysgen_shift_9287a513da 
  port map (
    clr => '0',
    ip => addsub_s_net,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
end structural;
-- Generated from Simulink block sobel/DUT/Hardware Accelerator/Sobel Edge Filter/Thresholding
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity sobel_thresholding is
  port (
    threshold : in std_logic_vector( 8-1 downto 0 );
    gmag : in std_logic_vector( 8-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    edge : out std_logic_vector( 8-1 downto 0 )
  );
end sobel_thresholding;
architecture structural of sobel_thresholding is 
  signal constant1_op_net : std_logic_vector( 8-1 downto 0 );
  signal constant_op_net : std_logic_vector( 8-1 downto 0 );
  signal mux_y_net : std_logic_vector( 8-1 downto 0 );
  signal shift_op_net : std_logic_vector( 8-1 downto 0 );
  signal relational_op_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal slice_y_net : std_logic_vector( 8-1 downto 0 );
  signal ce_net : std_logic;
begin
  edge <= mux_y_net;
  slice_y_net <= threshold;
  shift_op_net <= gmag;
  clk_net <= clk_1;
  ce_net <= ce_1;
  constant_x0 : entity xil_defaultlib.sysgen_constant_e2a1174255 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  constant1 : entity xil_defaultlib.sysgen_constant_fc77831cef 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant1_op_net
  );
  mux : entity xil_defaultlib.sysgen_mux_a74be4a1b3 
  port map (
    clr => '0',
    sel => relational_op_net,
    d0 => constant1_op_net,
    d1 => constant_op_net,
    clk => clk_net,
    ce => ce_net,
    y => mux_y_net
  );
  relational : entity xil_defaultlib.sysgen_relational_7c4a6e0fc0 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => shift_op_net,
    b => slice_y_net,
    op => relational_op_net
  );
end structural;
-- Generated from Simulink block sobel/DUT/Hardware Accelerator/Sobel Edge Filter
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity sobel_sobel_edge_filter is
  port (
    threshold : in std_logic_vector( 8-1 downto 0 );
    valid : in std_logic_vector( 1-1 downto 0 );
    y : in std_logic_vector( 8-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    edge : out std_logic_vector( 8-1 downto 0 )
  );
end sobel_sobel_edge_filter;
architecture structural of sobel_sobel_edge_filter is 
  signal slice_y_net : std_logic_vector( 8-1 downto 0 );
  signal mux_y_net : std_logic_vector( 8-1 downto 0 );
  signal ce_net : std_logic;
  signal addsub4_s_net : std_logic_vector( 12-1 downto 0 );
  signal register6_q_net : std_logic_vector( 8-1 downto 0 );
  signal clk_net : std_logic;
  signal addsub4_s_net_x0 : std_logic_vector( 12-1 downto 0 );
  signal register4_q_net : std_logic_vector( 8-1 downto 0 );
  signal register1_q_net : std_logic_vector( 8-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 8-1 downto 0 );
  signal shift_op_net : std_logic_vector( 8-1 downto 0 );
  signal register2_q_net : std_logic_vector( 8-1 downto 0 );
  signal register7_q_net : std_logic_vector( 8-1 downto 0 );
  signal register5_q_net : std_logic_vector( 8-1 downto 0 );
  signal register3_q_net : std_logic_vector( 8-1 downto 0 );
  signal register8_q_net : std_logic_vector( 8-1 downto 0 );
  signal register9_q_net : std_logic_vector( 8-1 downto 0 );
  signal delay_q_net : std_logic_vector( 1-1 downto 0 );
begin
  edge <= mux_y_net;
  slice_y_net <= threshold;
  delay_q_net <= valid;
  addsub1_s_net <= y;
  clk_net <= clk_1;
  ce_net <= ce_1;
  filter_function : entity xil_defaultlib.sobel_filter_function 
  port map (
    w00 => register6_q_net,
    w01 => register5_q_net,
    w02 => register9_q_net,
    w10 => register4_q_net,
    w11 => register3_q_net,
    w12 => register7_q_net,
    w20 => register2_q_net,
    w21 => register1_q_net,
    w22 => register8_q_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    gx => addsub4_s_net_x0,
    gy => addsub4_s_net
  );
  filter_window : entity xil_defaultlib.sobel_filter_window 
  port map (
    pixel => addsub1_s_net,
    valid => delay_q_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    w00 => register6_q_net,
    w01 => register5_q_net,
    w02 => register9_q_net,
    w10 => register4_q_net,
    w11 => register3_q_net,
    w12 => register7_q_net,
    w20 => register2_q_net,
    w21 => register1_q_net,
    w22 => register8_q_net
  );
  gradient_approximation : entity xil_defaultlib.sobel_gradient_approximation 
  port map (
    gx => addsub4_s_net_x0,
    gy => addsub4_s_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    gmag => shift_op_net
  );
  thresholding : entity xil_defaultlib.sobel_thresholding 
  port map (
    threshold => slice_y_net,
    gmag => shift_op_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    edge => mux_y_net
  );
end structural;
-- Generated from Simulink block sobel/DUT/Hardware Accelerator
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity sobel_hardware_accelerator is
  port (
    axi_lite_threshold : in std_logic_vector( 8-1 downto 0 );
    s_axis_tvalid : in std_logic_vector( 1-1 downto 0 );
    s_axis_tdata : in std_logic_vector( 32-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    m_axis_tvalid : out std_logic_vector( 1-1 downto 0 );
    m_axis_tdata : out std_logic_vector( 8-1 downto 0 );
    m_axis_tlast : out std_logic_vector( 1-1 downto 0 )
  );
end sobel_hardware_accelerator;
architecture structural of sobel_hardware_accelerator is 
  signal ce_net : std_logic;
  signal x_counter_op_net : std_logic_vector( 11-1 downto 0 );
  signal register_q_net : std_logic_vector( 1-1 downto 0 );
  signal slice_y_net : std_logic_vector( 8-1 downto 0 );
  signal y_counter_op_net : std_logic_vector( 11-1 downto 0 );
  signal register_q_net_x0 : std_logic_vector( 1-1 downto 0 );
  signal fifo_tdata_dout_net : std_logic_vector( 32-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 8-1 downto 0 );
  signal mux_y_net : std_logic_vector( 8-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal register1_q_net : std_logic_vector( 1-1 downto 0 );
  signal delay_q_net : std_logic_vector( 1-1 downto 0 );
begin
  m_axis_tvalid <= register_q_net;
  m_axis_tdata <= mux_y_net;
  m_axis_tlast <= register1_q_net;
  slice_y_net <= axi_lite_threshold;
  register_q_net_x0 <= s_axis_tvalid;
  fifo_tdata_dout_net <= s_axis_tdata;
  clk_net <= clk_1;
  ce_net <= ce_1;
  coordinate_counter : entity xil_defaultlib.sobel_coordinate_counter 
  port map (
    valid => delay1_q_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    x_value => x_counter_op_net,
    y_value => y_counter_op_net
  );
  rgb_to_greyscale : entity xil_defaultlib.sobel_rgb_to_greyscale 
  port map (
    rgb => fifo_tdata_dout_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    y => addsub1_s_net
  );
  signal_correction : entity xil_defaultlib.sobel_signal_correction 
  port map (
    x_value => x_counter_op_net,
    y_value => y_counter_op_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    valid => register_q_net,
    last => register1_q_net
  );
  sobel_edge_filter : entity xil_defaultlib.sobel_sobel_edge_filter 
  port map (
    threshold => slice_y_net,
    valid => delay_q_net,
    y => addsub1_s_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    edge => mux_y_net
  );
  delay : entity xil_defaultlib.sobel_xldelay 
  generic map (
    latency => 3,
    reg_retiming => 0,
    reset => 0,
    width => 1
  )
  port map (
    en => '1',
    rst => '0',
    d => register_q_net_x0,
    clk => clk_net,
    ce => ce_net,
    q => delay_q_net
  );
  delay1 : entity xil_defaultlib.sobel_xldelay 
  generic map (
    latency => 7,
    reg_retiming => 0,
    reset => 0,
    width => 1
  )
  port map (
    en => '1',
    rst => '0',
    d => delay_q_net,
    clk => clk_net,
    ce => ce_net,
    q => delay1_q_net
  );
end structural;
-- Generated from Simulink block sobel/DUT
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity sobel_dut is
  port (
    axi_lite_control : in std_logic_vector( 8-1 downto 0 );
    m_axis_tready : in std_logic_vector( 1-1 downto 0 );
    s_axis_tdata : in std_logic_vector( 32-1 downto 0 );
    s_axis_tvalid : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    m_axis_tdata : out std_logic_vector( 8-1 downto 0 );
    m_axis_tlast : out std_logic_vector( 1-1 downto 0 );
    m_axis_tvalid : out std_logic_vector( 1-1 downto 0 );
    s_axis_tready : out std_logic_vector( 1-1 downto 0 )
  );
end sobel_dut;
architecture structural of sobel_dut is 
  signal register_q_net : std_logic_vector( 1-1 downto 0 );
  signal register1_q_net : std_logic_vector( 1-1 downto 0 );
  signal register_q_net_x1 : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal m_axis_tready_net : std_logic_vector( 1-1 downto 0 );
  signal register_q_net_x0 : std_logic_vector( 1-1 downto 0 );
  signal inverter1_op_net_x0 : std_logic_vector( 1-1 downto 0 );
  signal fifo_tdata_dout_net : std_logic_vector( 32-1 downto 0 );
  signal s_axis_tdata_net : std_logic_vector( 32-1 downto 0 );
  signal mux_y_net : std_logic_vector( 8-1 downto 0 );
  signal inverter1_op_net : std_logic_vector( 1-1 downto 0 );
  signal s_axis_tvalid_net : std_logic_vector( 1-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 1-1 downto 0 );
  signal slice_y_net : std_logic_vector( 8-1 downto 0 );
  signal fifo_tdata_dout_net_x0 : std_logic_vector( 8-1 downto 0 );
begin
  slice_y_net <= axi_lite_control;
  m_axis_tdata <= fifo_tdata_dout_net_x0;
  m_axis_tlast <= convert1_dout_net;
  m_axis_tready_net <= m_axis_tready;
  m_axis_tvalid <= register_q_net_x0;
  s_axis_tdata_net <= s_axis_tdata;
  s_axis_tready <= inverter1_op_net;
  s_axis_tvalid_net <= s_axis_tvalid;
  clk_net <= clk_1;
  ce_net <= ce_1;
  axi_stream_master_interface : entity xil_defaultlib.sobel_axi_stream_master_interface 
  port map (
    s_tvalid => register_q_net,
    s_tdata => mux_y_net,
    s_tlast => register1_q_net,
    m_axis_tready => m_axis_tready_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    s_tready => inverter1_op_net_x0,
    m_axis_tdata => fifo_tdata_dout_net_x0,
    m_axis_tlast => convert1_dout_net,
    m_axis_tvalid => register_q_net_x0
  );
  axi_stream_slave_interface : entity xil_defaultlib.sobel_axi_stream_slave_interface 
  port map (
    m_tready => inverter1_op_net_x0,
    s_axis_tdata => s_axis_tdata_net,
    s_axis_tvalid => s_axis_tvalid_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    m_tvalid => register_q_net_x1,
    m_tdata => fifo_tdata_dout_net,
    s_axis_tready => inverter1_op_net
  );
  hardware_accelerator : entity xil_defaultlib.sobel_hardware_accelerator 
  port map (
    axi_lite_threshold => slice_y_net,
    s_axis_tvalid => register_q_net_x1,
    s_axis_tdata => fifo_tdata_dout_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    m_axis_tvalid => register_q_net,
    m_axis_tdata => mux_y_net,
    m_axis_tlast => register1_q_net
  );
end structural;
-- Generated from Simulink block sobel_struct
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity sobel_struct is
  port (
    thresh_reg : in std_logic_vector( 32-1 downto 0 );
    m_axis_tready : in std_logic_vector( 1-1 downto 0 );
    s_axis_tdata : in std_logic_vector( 32-1 downto 0 );
    s_axis_tlast : in std_logic_vector( 1-1 downto 0 );
    s_axis_tvalid : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    m_axis_tdata : out std_logic_vector( 8-1 downto 0 );
    m_axis_tlast : out std_logic_vector( 1-1 downto 0 );
    m_axis_tvalid : out std_logic_vector( 1-1 downto 0 );
    s_axis_tready : out std_logic_vector( 1-1 downto 0 )
  );
end sobel_struct;
architecture structural of sobel_struct is 
  signal fifo_tdata_dout_net : std_logic_vector( 8-1 downto 0 );
  signal inverter1_op_net : std_logic_vector( 1-1 downto 0 );
  signal m_axis_tready_net : std_logic_vector( 1-1 downto 0 );
  signal register_q_net : std_logic_vector( 1-1 downto 0 );
  signal ce_net : std_logic;
  signal thresh_reg_net : std_logic_vector( 32-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 1-1 downto 0 );
  signal s_axis_tdata_net : std_logic_vector( 32-1 downto 0 );
  signal s_axis_tvalid_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal slice_y_net : std_logic_vector( 8-1 downto 0 );
  signal s_axis_tlast_net : std_logic_vector( 1-1 downto 0 );
begin
  thresh_reg_net <= thresh_reg;
  m_axis_tdata <= fifo_tdata_dout_net;
  m_axis_tlast <= convert1_dout_net;
  m_axis_tready_net <= m_axis_tready;
  m_axis_tvalid <= register_q_net;
  s_axis_tdata_net <= s_axis_tdata;
  s_axis_tlast_net <= s_axis_tlast;
  s_axis_tready <= inverter1_op_net;
  s_axis_tvalid_net <= s_axis_tvalid;
  clk_net <= clk_1;
  ce_net <= ce_1;
  axi_lite_communication : entity xil_defaultlib.sobel_axi_lite_communication 
  port map (
    thresh_reg => thresh_reg_net,
    axi_lite_threshold => slice_y_net
  );
  dut : entity xil_defaultlib.sobel_dut 
  port map (
    axi_lite_control => slice_y_net,
    m_axis_tready => m_axis_tready_net,
    s_axis_tdata => s_axis_tdata_net,
    s_axis_tvalid => s_axis_tvalid_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    m_axis_tdata => fifo_tdata_dout_net,
    m_axis_tlast => convert1_dout_net,
    m_axis_tvalid => register_q_net,
    s_axis_tready => inverter1_op_net
  );
end structural;
-- Generated from Simulink block 
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity sobel_default_clock_driver is
  port (
    sobel_sysclk : in std_logic;
    sobel_sysce : in std_logic;
    sobel_sysclr : in std_logic;
    sobel_clk1 : out std_logic;
    sobel_ce1 : out std_logic
  );
end sobel_default_clock_driver;
architecture structural of sobel_default_clock_driver is 
begin
  clockdriver : entity xil_defaultlib.xlclockdriver 
  generic map (
    period => 1,
    log_2_period => 1
  )
  port map (
    sysclk => sobel_sysclk,
    sysce => sobel_sysce,
    sysclr => sobel_sysclr,
    clk => sobel_clk1,
    ce => sobel_ce1
  );
end structural;
-- Generated from Simulink block 
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity sobel is
  port (
    m_axis_tready : in std_logic_vector( 1-1 downto 0 );
    s_axis_tdata : in std_logic_vector( 32-1 downto 0 );
    s_axis_tlast : in std_logic_vector( 1-1 downto 0 );
    s_axis_tvalid : in std_logic_vector( 1-1 downto 0 );
    clk : in std_logic;
    sobel_aresetn : in std_logic;
    sobel_s_axi_awaddr : in std_logic;
    sobel_s_axi_awvalid : in std_logic;
    sobel_s_axi_wdata : in std_logic_vector( 32-1 downto 0 );
    sobel_s_axi_wstrb : in std_logic_vector( 4-1 downto 0 );
    sobel_s_axi_wvalid : in std_logic;
    sobel_s_axi_bready : in std_logic;
    sobel_s_axi_araddr : in std_logic;
    sobel_s_axi_arvalid : in std_logic;
    sobel_s_axi_rready : in std_logic;
    m_axis_tdata : out std_logic_vector( 8-1 downto 0 );
    m_axis_tlast : out std_logic_vector( 1-1 downto 0 );
    m_axis_tvalid : out std_logic_vector( 1-1 downto 0 );
    s_axis_tready : out std_logic_vector( 1-1 downto 0 );
    sobel_s_axi_awready : out std_logic;
    sobel_s_axi_wready : out std_logic;
    sobel_s_axi_bresp : out std_logic_vector( 2-1 downto 0 );
    sobel_s_axi_bvalid : out std_logic;
    sobel_s_axi_arready : out std_logic;
    sobel_s_axi_rdata : out std_logic_vector( 32-1 downto 0 );
    sobel_s_axi_rresp : out std_logic_vector( 2-1 downto 0 );
    sobel_s_axi_rvalid : out std_logic
  );
end sobel;
architecture structural of sobel is 
  attribute core_generation_info : string;
  attribute core_generation_info of structural : architecture is "sobel,sysgen_core_2020_1,{,compilation=IP Catalog,block_icon_display=Default,family=zynq,part=xc7z020,speed=-1,package=clg400,synthesis_language=vhdl,hdl_library=xil_defaultlib,synthesis_strategy=Vivado Synthesis Defaults,implementation_strategy=Vivado Implementation Defaults,testbench=0,interface_doc=0,ce_clr=0,clock_period=10,system_simulink_period=1e-08,waveform_viewer=0,axilite_interface=1,ip_catalog_plugin=0,hwcosim_burst_mode=0,simulation_time=inf,abs=2,addsub=13,cmult=7,constant=8,convert=4,counter=2,delay=4,fifo=4,inv=4,logical=8,mux=1,register=16,relational=9,shift=1,slice=4,}";
  signal thresh_reg : std_logic_vector( 32-1 downto 0 );
  signal ce_1_net : std_logic;
  signal clk_1_net : std_logic;
  signal clk_net : std_logic;
begin
  sobel_axi_lite_interface : entity xil_defaultlib.sobel_axi_lite_interface 
  port map (
    sobel_s_axi_awaddr => sobel_s_axi_awaddr,
    sobel_s_axi_awvalid => sobel_s_axi_awvalid,
    sobel_s_axi_wdata => sobel_s_axi_wdata,
    sobel_s_axi_wstrb => sobel_s_axi_wstrb,
    sobel_s_axi_wvalid => sobel_s_axi_wvalid,
    sobel_s_axi_bready => sobel_s_axi_bready,
    sobel_s_axi_araddr => sobel_s_axi_araddr,
    sobel_s_axi_arvalid => sobel_s_axi_arvalid,
    sobel_s_axi_rready => sobel_s_axi_rready,
    sobel_aresetn => sobel_aresetn,
    sobel_aclk => clk,
    thresh_reg => thresh_reg,
    sobel_s_axi_awready => sobel_s_axi_awready,
    sobel_s_axi_wready => sobel_s_axi_wready,
    sobel_s_axi_bresp => sobel_s_axi_bresp,
    sobel_s_axi_bvalid => sobel_s_axi_bvalid,
    sobel_s_axi_arready => sobel_s_axi_arready,
    sobel_s_axi_rdata => sobel_s_axi_rdata,
    sobel_s_axi_rresp => sobel_s_axi_rresp,
    sobel_s_axi_rvalid => sobel_s_axi_rvalid,
    clk => clk_net
  );
  sobel_default_clock_driver : entity xil_defaultlib.sobel_default_clock_driver 
  port map (
    sobel_sysclk => clk_net,
    sobel_sysce => '1',
    sobel_sysclr => '0',
    sobel_clk1 => clk_1_net,
    sobel_ce1 => ce_1_net
  );
  sobel_struct : entity xil_defaultlib.sobel_struct 
  port map (
    thresh_reg => thresh_reg,
    m_axis_tready => m_axis_tready,
    s_axis_tdata => s_axis_tdata,
    s_axis_tlast => s_axis_tlast,
    s_axis_tvalid => s_axis_tvalid,
    clk_1 => clk_1_net,
    ce_1 => ce_1_net,
    m_axis_tdata => m_axis_tdata,
    m_axis_tlast => m_axis_tlast,
    m_axis_tvalid => m_axis_tvalid,
    s_axis_tready => s_axis_tready
  );
end structural;
