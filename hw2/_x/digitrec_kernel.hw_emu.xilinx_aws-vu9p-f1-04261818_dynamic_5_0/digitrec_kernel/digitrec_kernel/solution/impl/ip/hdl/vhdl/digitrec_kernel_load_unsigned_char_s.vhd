-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2018.2_AR71275_op
-- Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity digitrec_kernel_load_unsigned_char_s is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    p_read : IN STD_LOGIC_VECTOR (7 downto 0);
    p_read4 : IN STD_LOGIC_VECTOR (7 downto 0);
    p_read8 : IN STD_LOGIC_VECTOR (7 downto 0);
    p_read27 : IN STD_LOGIC_VECTOR (7 downto 0);
    m_axi_data_local_AWVALID : OUT STD_LOGIC;
    m_axi_data_local_AWREADY : IN STD_LOGIC;
    m_axi_data_local_AWADDR : OUT STD_LOGIC_VECTOR (63 downto 0);
    m_axi_data_local_AWID : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_data_local_AWLEN : OUT STD_LOGIC_VECTOR (31 downto 0);
    m_axi_data_local_AWSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_data_local_AWBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_data_local_AWLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_data_local_AWCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_data_local_AWPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_data_local_AWQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_data_local_AWREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_data_local_AWUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_data_local_WVALID : OUT STD_LOGIC;
    m_axi_data_local_WREADY : IN STD_LOGIC;
    m_axi_data_local_WDATA : OUT STD_LOGIC_VECTOR (7 downto 0);
    m_axi_data_local_WSTRB : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_data_local_WLAST : OUT STD_LOGIC;
    m_axi_data_local_WID : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_data_local_WUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_data_local_ARVALID : OUT STD_LOGIC;
    m_axi_data_local_ARREADY : IN STD_LOGIC;
    m_axi_data_local_ARADDR : OUT STD_LOGIC_VECTOR (63 downto 0);
    m_axi_data_local_ARID : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_data_local_ARLEN : OUT STD_LOGIC_VECTOR (31 downto 0);
    m_axi_data_local_ARSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_data_local_ARBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_data_local_ARLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_data_local_ARCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_data_local_ARPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_data_local_ARQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_data_local_ARREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_data_local_ARUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_data_local_RVALID : IN STD_LOGIC;
    m_axi_data_local_RREADY : OUT STD_LOGIC;
    m_axi_data_local_RDATA : IN STD_LOGIC_VECTOR (7 downto 0);
    m_axi_data_local_RLAST : IN STD_LOGIC;
    m_axi_data_local_RID : IN STD_LOGIC_VECTOR (0 downto 0);
    m_axi_data_local_RUSER : IN STD_LOGIC_VECTOR (0 downto 0);
    m_axi_data_local_RRESP : IN STD_LOGIC_VECTOR (1 downto 0);
    m_axi_data_local_BVALID : IN STD_LOGIC;
    m_axi_data_local_BREADY : OUT STD_LOGIC;
    m_axi_data_local_BRESP : IN STD_LOGIC_VECTOR (1 downto 0);
    m_axi_data_local_BID : IN STD_LOGIC_VECTOR (0 downto 0);
    m_axi_data_local_BUSER : IN STD_LOGIC_VECTOR (0 downto 0);
    data_local_offset : IN STD_LOGIC_VECTOR (63 downto 0);
    data_local_offset1 : IN STD_LOGIC_VECTOR (4 downto 0) );
end;


architecture behav of digitrec_kernel_load_unsigned_char_s is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (7 downto 0) := "00000001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (7 downto 0) := "00000010";
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (7 downto 0) := "00000100";
    constant ap_ST_fsm_state5 : STD_LOGIC_VECTOR (7 downto 0) := "00001000";
    constant ap_ST_fsm_state6 : STD_LOGIC_VECTOR (7 downto 0) := "00010000";
    constant ap_ST_fsm_state7 : STD_LOGIC_VECTOR (7 downto 0) := "00100000";
    constant ap_ST_fsm_state8 : STD_LOGIC_VECTOR (7 downto 0) := "01000000";
    constant ap_ST_fsm_state9 : STD_LOGIC_VECTOR (7 downto 0) := "10000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv64_0 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv3_0 : STD_LOGIC_VECTOR (2 downto 0) := "000";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_lv4_0 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv32_7 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000111";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv2_1 : STD_LOGIC_VECTOR (1 downto 0) := "01";
    constant ap_const_lv2_2 : STD_LOGIC_VECTOR (1 downto 0) := "10";
    constant ap_const_lv2_3 : STD_LOGIC_VECTOR (1 downto 0) := "11";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";

    signal ap_CS_fsm : STD_LOGIC_VECTOR (7 downto 0) := "00000001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal data_local_blk_n_AW : STD_LOGIC;
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal data_local_blk_n_W : STD_LOGIC;
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal exitcond_reg_200 : STD_LOGIC_VECTOR (0 downto 0);
    signal data_local_blk_n_B : STD_LOGIC;
    signal ap_CS_fsm_state9 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state9 : signal is "none";
    signal i_reg_120 : STD_LOGIC_VECTOR (1 downto 0);
    signal data_local_addr_reg_174 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_sig_ioackin_m_axi_data_local_AWREADY : STD_LOGIC;
    signal exitcond_fu_162_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_block_state3_pp0_stage0_iter0 : BOOLEAN;
    signal ap_block_state4_pp0_stage0_iter1 : BOOLEAN;
    signal ap_sig_ioackin_m_axi_data_local_WREADY : STD_LOGIC;
    signal ap_block_state4_io : BOOLEAN;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal i_2_fu_168_p2 : STD_LOGIC_VECTOR (1 downto 0);
    signal i_2_reg_204 : STD_LOGIC_VECTOR (1 downto 0);
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC := '0';
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal ap_condition_pp0_exit_iter0_state3 : STD_LOGIC;
    signal ap_phi_mux_i_phi_fu_124_p4 : STD_LOGIC_VECTOR (1 downto 0);
    signal ap_phi_reg_pp0_iter0_data_dram_load_phi_reg_132 : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_phi_reg_pp0_iter1_data_dram_load_phi_reg_132 : STD_LOGIC_VECTOR (7 downto 0);
    signal sum2_fu_150_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_reg_ioackin_m_axi_data_local_AWREADY : STD_LOGIC := '0';
    signal ap_reg_ioackin_m_axi_data_local_WREADY : STD_LOGIC := '0';
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal tmp_24_fu_146_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_enable_pp0 : STD_LOGIC;
    signal ap_condition_157 : BOOLEAN;
    signal ap_condition_276 : BOOLEAN;


begin




    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter0_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter0 <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = ap_condition_pp0_exit_iter0_state3) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then 
                    ap_enable_reg_pp0_iter0 <= ap_const_logic_0;
                elsif (((ap_const_logic_1 = ap_CS_fsm_state2) and (ap_sig_ioackin_m_axi_data_local_AWREADY = ap_const_logic_1))) then 
                    ap_enable_reg_pp0_iter0 <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter1_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = ap_condition_pp0_exit_iter0_state3) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then 
                    ap_enable_reg_pp0_iter1 <= (ap_const_logic_1 xor ap_condition_pp0_exit_iter0_state3);
                elsif ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
                elsif (((ap_const_logic_1 = ap_CS_fsm_state2) and (ap_sig_ioackin_m_axi_data_local_AWREADY = ap_const_logic_1))) then 
                    ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    ap_reg_ioackin_m_axi_data_local_AWREADY_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_reg_ioackin_m_axi_data_local_AWREADY <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state2)) then
                    if ((ap_sig_ioackin_m_axi_data_local_AWREADY = ap_const_logic_1)) then 
                        ap_reg_ioackin_m_axi_data_local_AWREADY <= ap_const_logic_0;
                    elsif ((m_axi_data_local_AWREADY = ap_const_logic_1)) then 
                        ap_reg_ioackin_m_axi_data_local_AWREADY <= ap_const_logic_1;
                    end if;
                end if; 
            end if;
        end if;
    end process;


    ap_reg_ioackin_m_axi_data_local_WREADY_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_reg_ioackin_m_axi_data_local_WREADY <= ap_const_logic_0;
            else
                if ((ap_const_boolean_1 = ap_condition_276)) then
                    if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then 
                        ap_reg_ioackin_m_axi_data_local_WREADY <= ap_const_logic_0;
                    elsif (((ap_const_boolean_0 = ap_block_pp0_stage0_01001) and (m_axi_data_local_WREADY = ap_const_logic_1))) then 
                        ap_reg_ioackin_m_axi_data_local_WREADY <= ap_const_logic_1;
                    end if;
                end if; 
            end if;
        end if;
    end process;


    ap_phi_reg_pp0_iter1_data_dram_load_phi_reg_132_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_1 = ap_condition_157)) then
                if (((ap_phi_mux_i_phi_fu_124_p4 = ap_const_lv2_0) and (exitcond_fu_162_p2 = ap_const_lv1_0))) then 
                    ap_phi_reg_pp0_iter1_data_dram_load_phi_reg_132 <= p_read;
                elsif (((exitcond_fu_162_p2 = ap_const_lv1_0) and (ap_phi_mux_i_phi_fu_124_p4 = ap_const_lv2_3))) then 
                    ap_phi_reg_pp0_iter1_data_dram_load_phi_reg_132 <= p_read27;
                elsif (((exitcond_fu_162_p2 = ap_const_lv1_0) and (ap_phi_mux_i_phi_fu_124_p4 = ap_const_lv2_2))) then 
                    ap_phi_reg_pp0_iter1_data_dram_load_phi_reg_132 <= p_read8;
                elsif (((exitcond_fu_162_p2 = ap_const_lv1_0) and (ap_phi_mux_i_phi_fu_124_p4 = ap_const_lv2_1))) then 
                    ap_phi_reg_pp0_iter1_data_dram_load_phi_reg_132 <= p_read4;
                elsif ((ap_const_boolean_1 = ap_const_boolean_1)) then 
                    ap_phi_reg_pp0_iter1_data_dram_load_phi_reg_132 <= ap_phi_reg_pp0_iter0_data_dram_load_phi_reg_132;
                end if;
            end if; 
        end if;
    end process;

    i_reg_120_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((exitcond_reg_200 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
                i_reg_120 <= i_2_reg_204;
            elsif (((ap_const_logic_1 = ap_CS_fsm_state2) and (ap_sig_ioackin_m_axi_data_local_AWREADY = ap_const_logic_1))) then 
                i_reg_120 <= ap_const_lv2_0;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then
                data_local_addr_reg_174 <= sum2_fu_150_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                exitcond_reg_200 <= exitcond_fu_162_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                i_2_reg_204 <= i_2_fu_168_p2;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, m_axi_data_local_BVALID, ap_CS_fsm_state2, ap_CS_fsm_state9, ap_sig_ioackin_m_axi_data_local_AWREADY, exitcond_fu_162_p2, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_subdone)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state2) and (ap_sig_ioackin_m_axi_data_local_AWREADY = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                else
                    ap_NS_fsm <= ap_ST_fsm_state2;
                end if;
            when ap_ST_fsm_pp0_stage0 => 
                if (not(((ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (exitcond_fu_162_p2 = ap_const_lv1_1)))) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                elsif (((ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (exitcond_fu_162_p2 = ap_const_lv1_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state5;
                else
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                end if;
            when ap_ST_fsm_state5 => 
                ap_NS_fsm <= ap_ST_fsm_state6;
            when ap_ST_fsm_state6 => 
                ap_NS_fsm <= ap_ST_fsm_state7;
            when ap_ST_fsm_state7 => 
                ap_NS_fsm <= ap_ST_fsm_state8;
            when ap_ST_fsm_state8 => 
                ap_NS_fsm <= ap_ST_fsm_state9;
            when ap_ST_fsm_state9 => 
                if (((m_axi_data_local_BVALID = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state9))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_state9;
                end if;
            when others =>  
                ap_NS_fsm <= "XXXXXXXX";
        end case;
    end process;
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(2);
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state9 <= ap_CS_fsm(7);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_01001 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_pp0_stage0_11001_assign_proc : process(ap_enable_reg_pp0_iter1, ap_block_state4_io)
    begin
                ap_block_pp0_stage0_11001 <= ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_boolean_1 = ap_block_state4_io));
    end process;


    ap_block_pp0_stage0_subdone_assign_proc : process(ap_enable_reg_pp0_iter1, ap_block_state4_io)
    begin
                ap_block_pp0_stage0_subdone <= ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_boolean_1 = ap_block_state4_io));
    end process;

        ap_block_state3_pp0_stage0_iter0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_state4_io_assign_proc : process(exitcond_reg_200, ap_sig_ioackin_m_axi_data_local_WREADY)
    begin
                ap_block_state4_io <= ((exitcond_reg_200 = ap_const_lv1_0) and (ap_sig_ioackin_m_axi_data_local_WREADY = ap_const_logic_0));
    end process;

        ap_block_state4_pp0_stage0_iter1 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_condition_157_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_11001, ap_enable_reg_pp0_iter0)
    begin
                ap_condition_157 <= ((ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001));
    end process;


    ap_condition_276_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, exitcond_reg_200)
    begin
                ap_condition_276 <= ((exitcond_reg_200 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0));
    end process;


    ap_condition_pp0_exit_iter0_state3_assign_proc : process(exitcond_fu_162_p2)
    begin
        if ((exitcond_fu_162_p2 = ap_const_lv1_1)) then 
            ap_condition_pp0_exit_iter0_state3 <= ap_const_logic_1;
        else 
            ap_condition_pp0_exit_iter0_state3 <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_assign_proc : process(ap_start, ap_CS_fsm_state1, m_axi_data_local_BVALID, ap_CS_fsm_state9)
    begin
        if ((((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1)) or ((m_axi_data_local_BVALID = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state9)))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;

    ap_enable_pp0 <= (ap_idle_pp0 xor ap_const_logic_1);

    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter0)
    begin
        if (((ap_enable_reg_pp0_iter0 = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_phi_mux_i_phi_fu_124_p4_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0, exitcond_reg_200, i_reg_120, i_2_reg_204)
    begin
        if (((exitcond_reg_200 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0))) then 
            ap_phi_mux_i_phi_fu_124_p4 <= i_2_reg_204;
        else 
            ap_phi_mux_i_phi_fu_124_p4 <= i_reg_120;
        end if; 
    end process;

    ap_phi_reg_pp0_iter0_data_dram_load_phi_reg_132 <= "XXXXXXXX";

    ap_ready_assign_proc : process(m_axi_data_local_BVALID, ap_CS_fsm_state9)
    begin
        if (((m_axi_data_local_BVALID = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state9))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    ap_sig_ioackin_m_axi_data_local_AWREADY_assign_proc : process(m_axi_data_local_AWREADY, ap_reg_ioackin_m_axi_data_local_AWREADY)
    begin
        if ((ap_reg_ioackin_m_axi_data_local_AWREADY = ap_const_logic_0)) then 
            ap_sig_ioackin_m_axi_data_local_AWREADY <= m_axi_data_local_AWREADY;
        else 
            ap_sig_ioackin_m_axi_data_local_AWREADY <= ap_const_logic_1;
        end if; 
    end process;


    ap_sig_ioackin_m_axi_data_local_WREADY_assign_proc : process(m_axi_data_local_WREADY, ap_reg_ioackin_m_axi_data_local_WREADY)
    begin
        if ((ap_reg_ioackin_m_axi_data_local_WREADY = ap_const_logic_0)) then 
            ap_sig_ioackin_m_axi_data_local_WREADY <= m_axi_data_local_WREADY;
        else 
            ap_sig_ioackin_m_axi_data_local_WREADY <= ap_const_logic_1;
        end if; 
    end process;


    data_local_blk_n_AW_assign_proc : process(m_axi_data_local_AWREADY, ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            data_local_blk_n_AW <= m_axi_data_local_AWREADY;
        else 
            data_local_blk_n_AW <= ap_const_logic_1;
        end if; 
    end process;


    data_local_blk_n_B_assign_proc : process(m_axi_data_local_BVALID, ap_CS_fsm_state9)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state9)) then 
            data_local_blk_n_B <= m_axi_data_local_BVALID;
        else 
            data_local_blk_n_B <= ap_const_logic_1;
        end if; 
    end process;


    data_local_blk_n_W_assign_proc : process(m_axi_data_local_WREADY, ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0, exitcond_reg_200)
    begin
        if (((exitcond_reg_200 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0))) then 
            data_local_blk_n_W <= m_axi_data_local_WREADY;
        else 
            data_local_blk_n_W <= ap_const_logic_1;
        end if; 
    end process;

    exitcond_fu_162_p2 <= "1" when (ap_phi_mux_i_phi_fu_124_p4 = ap_const_lv2_3) else "0";
    i_2_fu_168_p2 <= std_logic_vector(unsigned(ap_phi_mux_i_phi_fu_124_p4) + unsigned(ap_const_lv2_1));
    m_axi_data_local_ARADDR <= ap_const_lv64_0;
    m_axi_data_local_ARBURST <= ap_const_lv2_0;
    m_axi_data_local_ARCACHE <= ap_const_lv4_0;
    m_axi_data_local_ARID <= ap_const_lv1_0;
    m_axi_data_local_ARLEN <= ap_const_lv32_0;
    m_axi_data_local_ARLOCK <= ap_const_lv2_0;
    m_axi_data_local_ARPROT <= ap_const_lv3_0;
    m_axi_data_local_ARQOS <= ap_const_lv4_0;
    m_axi_data_local_ARREGION <= ap_const_lv4_0;
    m_axi_data_local_ARSIZE <= ap_const_lv3_0;
    m_axi_data_local_ARUSER <= ap_const_lv1_0;
    m_axi_data_local_ARVALID <= ap_const_logic_0;
    m_axi_data_local_AWADDR <= data_local_addr_reg_174;
    m_axi_data_local_AWBURST <= ap_const_lv2_0;
    m_axi_data_local_AWCACHE <= ap_const_lv4_0;
    m_axi_data_local_AWID <= ap_const_lv1_0;
    m_axi_data_local_AWLEN <= ap_const_lv32_3;
    m_axi_data_local_AWLOCK <= ap_const_lv2_0;
    m_axi_data_local_AWPROT <= ap_const_lv3_0;
    m_axi_data_local_AWQOS <= ap_const_lv4_0;
    m_axi_data_local_AWREGION <= ap_const_lv4_0;
    m_axi_data_local_AWSIZE <= ap_const_lv3_0;
    m_axi_data_local_AWUSER <= ap_const_lv1_0;

    m_axi_data_local_AWVALID_assign_proc : process(ap_CS_fsm_state2, ap_reg_ioackin_m_axi_data_local_AWREADY)
    begin
        if (((ap_reg_ioackin_m_axi_data_local_AWREADY = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            m_axi_data_local_AWVALID <= ap_const_logic_1;
        else 
            m_axi_data_local_AWVALID <= ap_const_logic_0;
        end if; 
    end process;


    m_axi_data_local_BREADY_assign_proc : process(m_axi_data_local_BVALID, ap_CS_fsm_state9)
    begin
        if (((m_axi_data_local_BVALID = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state9))) then 
            m_axi_data_local_BREADY <= ap_const_logic_1;
        else 
            m_axi_data_local_BREADY <= ap_const_logic_0;
        end if; 
    end process;

    m_axi_data_local_RREADY <= ap_const_logic_0;
    m_axi_data_local_WDATA <= ap_phi_reg_pp0_iter1_data_dram_load_phi_reg_132;
    m_axi_data_local_WID <= ap_const_lv1_0;
    m_axi_data_local_WLAST <= ap_const_logic_0;
    m_axi_data_local_WSTRB <= ap_const_lv1_1;
    m_axi_data_local_WUSER <= ap_const_lv1_0;

    m_axi_data_local_WVALID_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, exitcond_reg_200, ap_reg_ioackin_m_axi_data_local_WREADY, ap_block_pp0_stage0_01001)
    begin
        if (((exitcond_reg_200 = ap_const_lv1_0) and (ap_reg_ioackin_m_axi_data_local_WREADY = ap_const_logic_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_01001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            m_axi_data_local_WVALID <= ap_const_logic_1;
        else 
            m_axi_data_local_WVALID <= ap_const_logic_0;
        end if; 
    end process;

    sum2_fu_150_p2 <= std_logic_vector(unsigned(tmp_24_fu_146_p1) + unsigned(data_local_offset));
    tmp_24_fu_146_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(data_local_offset1),64));
end behav;
