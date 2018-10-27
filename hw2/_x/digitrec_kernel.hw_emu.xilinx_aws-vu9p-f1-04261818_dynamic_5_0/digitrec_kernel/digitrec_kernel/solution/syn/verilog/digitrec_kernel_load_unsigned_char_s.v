// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.2_AR71275_op
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module digitrec_kernel_load_unsigned_char_s (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        p_read,
        p_read4,
        p_read8,
        p_read27,
        m_axi_data_local_AWVALID,
        m_axi_data_local_AWREADY,
        m_axi_data_local_AWADDR,
        m_axi_data_local_AWID,
        m_axi_data_local_AWLEN,
        m_axi_data_local_AWSIZE,
        m_axi_data_local_AWBURST,
        m_axi_data_local_AWLOCK,
        m_axi_data_local_AWCACHE,
        m_axi_data_local_AWPROT,
        m_axi_data_local_AWQOS,
        m_axi_data_local_AWREGION,
        m_axi_data_local_AWUSER,
        m_axi_data_local_WVALID,
        m_axi_data_local_WREADY,
        m_axi_data_local_WDATA,
        m_axi_data_local_WSTRB,
        m_axi_data_local_WLAST,
        m_axi_data_local_WID,
        m_axi_data_local_WUSER,
        m_axi_data_local_ARVALID,
        m_axi_data_local_ARREADY,
        m_axi_data_local_ARADDR,
        m_axi_data_local_ARID,
        m_axi_data_local_ARLEN,
        m_axi_data_local_ARSIZE,
        m_axi_data_local_ARBURST,
        m_axi_data_local_ARLOCK,
        m_axi_data_local_ARCACHE,
        m_axi_data_local_ARPROT,
        m_axi_data_local_ARQOS,
        m_axi_data_local_ARREGION,
        m_axi_data_local_ARUSER,
        m_axi_data_local_RVALID,
        m_axi_data_local_RREADY,
        m_axi_data_local_RDATA,
        m_axi_data_local_RLAST,
        m_axi_data_local_RID,
        m_axi_data_local_RUSER,
        m_axi_data_local_RRESP,
        m_axi_data_local_BVALID,
        m_axi_data_local_BREADY,
        m_axi_data_local_BRESP,
        m_axi_data_local_BID,
        m_axi_data_local_BUSER,
        data_local_offset,
        data_local_offset1
);

parameter    ap_ST_fsm_state1 = 8'd1;
parameter    ap_ST_fsm_state2 = 8'd2;
parameter    ap_ST_fsm_pp0_stage0 = 8'd4;
parameter    ap_ST_fsm_state5 = 8'd8;
parameter    ap_ST_fsm_state6 = 8'd16;
parameter    ap_ST_fsm_state7 = 8'd32;
parameter    ap_ST_fsm_state8 = 8'd64;
parameter    ap_ST_fsm_state9 = 8'd128;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [7:0] p_read;
input  [7:0] p_read4;
input  [7:0] p_read8;
input  [7:0] p_read27;
output   m_axi_data_local_AWVALID;
input   m_axi_data_local_AWREADY;
output  [63:0] m_axi_data_local_AWADDR;
output  [0:0] m_axi_data_local_AWID;
output  [31:0] m_axi_data_local_AWLEN;
output  [2:0] m_axi_data_local_AWSIZE;
output  [1:0] m_axi_data_local_AWBURST;
output  [1:0] m_axi_data_local_AWLOCK;
output  [3:0] m_axi_data_local_AWCACHE;
output  [2:0] m_axi_data_local_AWPROT;
output  [3:0] m_axi_data_local_AWQOS;
output  [3:0] m_axi_data_local_AWREGION;
output  [0:0] m_axi_data_local_AWUSER;
output   m_axi_data_local_WVALID;
input   m_axi_data_local_WREADY;
output  [7:0] m_axi_data_local_WDATA;
output  [0:0] m_axi_data_local_WSTRB;
output   m_axi_data_local_WLAST;
output  [0:0] m_axi_data_local_WID;
output  [0:0] m_axi_data_local_WUSER;
output   m_axi_data_local_ARVALID;
input   m_axi_data_local_ARREADY;
output  [63:0] m_axi_data_local_ARADDR;
output  [0:0] m_axi_data_local_ARID;
output  [31:0] m_axi_data_local_ARLEN;
output  [2:0] m_axi_data_local_ARSIZE;
output  [1:0] m_axi_data_local_ARBURST;
output  [1:0] m_axi_data_local_ARLOCK;
output  [3:0] m_axi_data_local_ARCACHE;
output  [2:0] m_axi_data_local_ARPROT;
output  [3:0] m_axi_data_local_ARQOS;
output  [3:0] m_axi_data_local_ARREGION;
output  [0:0] m_axi_data_local_ARUSER;
input   m_axi_data_local_RVALID;
output   m_axi_data_local_RREADY;
input  [7:0] m_axi_data_local_RDATA;
input   m_axi_data_local_RLAST;
input  [0:0] m_axi_data_local_RID;
input  [0:0] m_axi_data_local_RUSER;
input  [1:0] m_axi_data_local_RRESP;
input   m_axi_data_local_BVALID;
output   m_axi_data_local_BREADY;
input  [1:0] m_axi_data_local_BRESP;
input  [0:0] m_axi_data_local_BID;
input  [0:0] m_axi_data_local_BUSER;
input  [63:0] data_local_offset;
input  [4:0] data_local_offset1;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg m_axi_data_local_AWVALID;
reg m_axi_data_local_WVALID;
reg m_axi_data_local_BREADY;

(* fsm_encoding = "none" *) reg   [7:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    data_local_blk_n_AW;
wire    ap_CS_fsm_state2;
reg    data_local_blk_n_W;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter1;
wire    ap_block_pp0_stage0;
reg   [0:0] exitcond_reg_200;
reg    data_local_blk_n_B;
wire    ap_CS_fsm_state9;
reg   [1:0] i_reg_120;
reg   [63:0] data_local_addr_reg_174;
reg    ap_sig_ioackin_m_axi_data_local_AWREADY;
wire   [0:0] exitcond_fu_162_p2;
wire    ap_block_state3_pp0_stage0_iter0;
wire    ap_block_state4_pp0_stage0_iter1;
reg    ap_sig_ioackin_m_axi_data_local_WREADY;
reg    ap_block_state4_io;
reg    ap_block_pp0_stage0_11001;
wire   [1:0] i_2_fu_168_p2;
reg   [1:0] i_2_reg_204;
reg    ap_enable_reg_pp0_iter0;
reg    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_exit_iter0_state3;
reg   [1:0] ap_phi_mux_i_phi_fu_124_p4;
wire   [7:0] ap_phi_reg_pp0_iter0_data_dram_load_phi_reg_132;
reg   [7:0] ap_phi_reg_pp0_iter1_data_dram_load_phi_reg_132;
wire   [63:0] sum2_fu_150_p2;
reg    ap_reg_ioackin_m_axi_data_local_AWREADY;
reg    ap_reg_ioackin_m_axi_data_local_WREADY;
wire    ap_block_pp0_stage0_01001;
wire   [63:0] tmp_24_fu_146_p1;
reg   [7:0] ap_NS_fsm;
reg    ap_idle_pp0;
wire    ap_enable_pp0;
reg    ap_condition_157;
reg    ap_condition_276;

// power-on initialization
initial begin
#0 ap_CS_fsm = 8'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter0 = 1'b0;
#0 ap_reg_ioackin_m_axi_data_local_AWREADY = 1'b0;
#0 ap_reg_ioackin_m_axi_data_local_WREADY = 1'b0;
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter0 <= 1'b0;
    end else begin
        if (((1'b1 == ap_condition_pp0_exit_iter0_state3) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
            ap_enable_reg_pp0_iter0 <= 1'b0;
        end else if (((1'b1 == ap_CS_fsm_state2) & (ap_sig_ioackin_m_axi_data_local_AWREADY == 1'b1))) begin
            ap_enable_reg_pp0_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if (((1'b1 == ap_condition_pp0_exit_iter0_state3) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
            ap_enable_reg_pp0_iter1 <= (1'b1 ^ ap_condition_pp0_exit_iter0_state3);
        end else if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
        end else if (((1'b1 == ap_CS_fsm_state2) & (ap_sig_ioackin_m_axi_data_local_AWREADY == 1'b1))) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_reg_ioackin_m_axi_data_local_AWREADY <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state2)) begin
            if ((ap_sig_ioackin_m_axi_data_local_AWREADY == 1'b1)) begin
                ap_reg_ioackin_m_axi_data_local_AWREADY <= 1'b0;
            end else if ((m_axi_data_local_AWREADY == 1'b1)) begin
                ap_reg_ioackin_m_axi_data_local_AWREADY <= 1'b1;
            end
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_reg_ioackin_m_axi_data_local_WREADY <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_276)) begin
            if ((1'b0 == ap_block_pp0_stage0_11001)) begin
                ap_reg_ioackin_m_axi_data_local_WREADY <= 1'b0;
            end else if (((1'b0 == ap_block_pp0_stage0_01001) & (m_axi_data_local_WREADY == 1'b1))) begin
                ap_reg_ioackin_m_axi_data_local_WREADY <= 1'b1;
            end
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_157)) begin
        if (((ap_phi_mux_i_phi_fu_124_p4 == 2'd0) & (exitcond_fu_162_p2 == 1'd0))) begin
            ap_phi_reg_pp0_iter1_data_dram_load_phi_reg_132 <= p_read;
        end else if (((exitcond_fu_162_p2 == 1'd0) & (ap_phi_mux_i_phi_fu_124_p4 == 2'd3))) begin
            ap_phi_reg_pp0_iter1_data_dram_load_phi_reg_132 <= p_read27;
        end else if (((exitcond_fu_162_p2 == 1'd0) & (ap_phi_mux_i_phi_fu_124_p4 == 2'd2))) begin
            ap_phi_reg_pp0_iter1_data_dram_load_phi_reg_132 <= p_read8;
        end else if (((exitcond_fu_162_p2 == 1'd0) & (ap_phi_mux_i_phi_fu_124_p4 == 2'd1))) begin
            ap_phi_reg_pp0_iter1_data_dram_load_phi_reg_132 <= p_read4;
        end else if ((1'b1 == 1'b1)) begin
            ap_phi_reg_pp0_iter1_data_dram_load_phi_reg_132 <= ap_phi_reg_pp0_iter0_data_dram_load_phi_reg_132;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_reg_200 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        i_reg_120 <= i_2_reg_204;
    end else if (((1'b1 == ap_CS_fsm_state2) & (ap_sig_ioackin_m_axi_data_local_AWREADY == 1'b1))) begin
        i_reg_120 <= 2'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        data_local_addr_reg_174 <= sum2_fu_150_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        exitcond_reg_200 <= exitcond_fu_162_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        i_2_reg_204 <= i_2_fu_168_p2;
    end
end

always @ (*) begin
    if ((exitcond_fu_162_p2 == 1'd1)) begin
        ap_condition_pp0_exit_iter0_state3 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter0_state3 = 1'b0;
    end
end

always @ (*) begin
    if ((((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1)) | ((m_axi_data_local_BVALID == 1'b1) & (1'b1 == ap_CS_fsm_state9)))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((exitcond_reg_200 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        ap_phi_mux_i_phi_fu_124_p4 = i_2_reg_204;
    end else begin
        ap_phi_mux_i_phi_fu_124_p4 = i_reg_120;
    end
end

always @ (*) begin
    if (((m_axi_data_local_BVALID == 1'b1) & (1'b1 == ap_CS_fsm_state9))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((ap_reg_ioackin_m_axi_data_local_AWREADY == 1'b0)) begin
        ap_sig_ioackin_m_axi_data_local_AWREADY = m_axi_data_local_AWREADY;
    end else begin
        ap_sig_ioackin_m_axi_data_local_AWREADY = 1'b1;
    end
end

always @ (*) begin
    if ((ap_reg_ioackin_m_axi_data_local_WREADY == 1'b0)) begin
        ap_sig_ioackin_m_axi_data_local_WREADY = m_axi_data_local_WREADY;
    end else begin
        ap_sig_ioackin_m_axi_data_local_WREADY = 1'b1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        data_local_blk_n_AW = m_axi_data_local_AWREADY;
    end else begin
        data_local_blk_n_AW = 1'b1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state9)) begin
        data_local_blk_n_B = m_axi_data_local_BVALID;
    end else begin
        data_local_blk_n_B = 1'b1;
    end
end

always @ (*) begin
    if (((exitcond_reg_200 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        data_local_blk_n_W = m_axi_data_local_WREADY;
    end else begin
        data_local_blk_n_W = 1'b1;
    end
end

always @ (*) begin
    if (((ap_reg_ioackin_m_axi_data_local_AWREADY == 1'b0) & (1'b1 == ap_CS_fsm_state2))) begin
        m_axi_data_local_AWVALID = 1'b1;
    end else begin
        m_axi_data_local_AWVALID = 1'b0;
    end
end

always @ (*) begin
    if (((m_axi_data_local_BVALID == 1'b1) & (1'b1 == ap_CS_fsm_state9))) begin
        m_axi_data_local_BREADY = 1'b1;
    end else begin
        m_axi_data_local_BREADY = 1'b0;
    end
end

always @ (*) begin
    if (((exitcond_reg_200 == 1'd0) & (ap_reg_ioackin_m_axi_data_local_WREADY == 1'b0) & (1'b0 == ap_block_pp0_stage0_01001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        m_axi_data_local_WVALID = 1'b1;
    end else begin
        m_axi_data_local_WVALID = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((1'b1 == ap_CS_fsm_state2) & (ap_sig_ioackin_m_axi_data_local_AWREADY == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_pp0_stage0 : begin
            if (~((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (exitcond_fu_162_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (exitcond_fu_162_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_state5 : begin
            ap_NS_fsm = ap_ST_fsm_state6;
        end
        ap_ST_fsm_state6 : begin
            ap_NS_fsm = ap_ST_fsm_state7;
        end
        ap_ST_fsm_state7 : begin
            ap_NS_fsm = ap_ST_fsm_state8;
        end
        ap_ST_fsm_state8 : begin
            ap_NS_fsm = ap_ST_fsm_state9;
        end
        ap_ST_fsm_state9 : begin
            if (((m_axi_data_local_BVALID == 1'b1) & (1'b1 == ap_CS_fsm_state9))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state9;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state9 = ap_CS_fsm[32'd7];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_01001 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_block_state4_io));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_block_state4_io));
end

assign ap_block_state3_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state4_io = ((exitcond_reg_200 == 1'd0) & (ap_sig_ioackin_m_axi_data_local_WREADY == 1'b0));
end

assign ap_block_state4_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_condition_157 = ((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001));
end

always @ (*) begin
    ap_condition_276 = ((exitcond_reg_200 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_phi_reg_pp0_iter0_data_dram_load_phi_reg_132 = 'bx;

assign exitcond_fu_162_p2 = ((ap_phi_mux_i_phi_fu_124_p4 == 2'd3) ? 1'b1 : 1'b0);

assign i_2_fu_168_p2 = (ap_phi_mux_i_phi_fu_124_p4 + 2'd1);

assign m_axi_data_local_ARADDR = 64'd0;

assign m_axi_data_local_ARBURST = 2'd0;

assign m_axi_data_local_ARCACHE = 4'd0;

assign m_axi_data_local_ARID = 1'd0;

assign m_axi_data_local_ARLEN = 32'd0;

assign m_axi_data_local_ARLOCK = 2'd0;

assign m_axi_data_local_ARPROT = 3'd0;

assign m_axi_data_local_ARQOS = 4'd0;

assign m_axi_data_local_ARREGION = 4'd0;

assign m_axi_data_local_ARSIZE = 3'd0;

assign m_axi_data_local_ARUSER = 1'd0;

assign m_axi_data_local_ARVALID = 1'b0;

assign m_axi_data_local_AWADDR = data_local_addr_reg_174;

assign m_axi_data_local_AWBURST = 2'd0;

assign m_axi_data_local_AWCACHE = 4'd0;

assign m_axi_data_local_AWID = 1'd0;

assign m_axi_data_local_AWLEN = 32'd3;

assign m_axi_data_local_AWLOCK = 2'd0;

assign m_axi_data_local_AWPROT = 3'd0;

assign m_axi_data_local_AWQOS = 4'd0;

assign m_axi_data_local_AWREGION = 4'd0;

assign m_axi_data_local_AWSIZE = 3'd0;

assign m_axi_data_local_AWUSER = 1'd0;

assign m_axi_data_local_RREADY = 1'b0;

assign m_axi_data_local_WDATA = ap_phi_reg_pp0_iter1_data_dram_load_phi_reg_132;

assign m_axi_data_local_WID = 1'd0;

assign m_axi_data_local_WLAST = 1'b0;

assign m_axi_data_local_WSTRB = 1'd1;

assign m_axi_data_local_WUSER = 1'd0;

assign sum2_fu_150_p2 = (tmp_24_fu_146_p1 + data_local_offset);

assign tmp_24_fu_146_p1 = data_local_offset1;

endmodule //digitrec_kernel_load_unsigned_char_s
