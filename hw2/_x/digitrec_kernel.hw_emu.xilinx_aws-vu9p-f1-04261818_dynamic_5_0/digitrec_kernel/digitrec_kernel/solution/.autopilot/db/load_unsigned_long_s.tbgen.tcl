set moduleName load_unsigned_long_s
set isTaskLevelControl 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {load<unsigned long>}
set C_modelType { void 0 }
set C_modelArgList {
	{ data_dram int 64 regular {axi_master 0}  }
	{ data_dram_offset int 61 regular  }
	{ data_dram_offset1 int 15 regular  }
	{ data_local_0 int 64 regular {array 225 { 0 3 } 0 1 }  }
	{ data_local_1 int 64 regular {array 225 { 0 3 } 0 1 }  }
	{ data_local_2 int 64 regular {array 225 { 0 3 } 0 1 }  }
	{ data_local_3 int 64 regular {array 225 { 0 3 } 0 1 }  }
	{ data_local_4 int 64 regular {array 225 { 0 3 } 0 1 }  }
	{ data_local_5 int 64 regular {array 225 { 0 3 } 0 1 }  }
	{ data_local_6 int 64 regular {array 225 { 0 3 } 0 1 }  }
	{ data_local_7 int 64 regular {array 225 { 0 3 } 0 1 }  }
	{ num_elem int 11 regular  }
}
set C_modelArgMapList {[ 
	{ "Name" : "data_dram", "interface" : "axi_master", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "data_dram_offset", "interface" : "wire", "bitwidth" : 61, "direction" : "READONLY"} , 
 	{ "Name" : "data_dram_offset1", "interface" : "wire", "bitwidth" : 15, "direction" : "READONLY"} , 
 	{ "Name" : "data_local_0", "interface" : "memory", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "data_local_1", "interface" : "memory", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "data_local_2", "interface" : "memory", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "data_local_3", "interface" : "memory", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "data_local_4", "interface" : "memory", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "data_local_5", "interface" : "memory", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "data_local_6", "interface" : "memory", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "data_local_7", "interface" : "memory", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "num_elem", "interface" : "wire", "bitwidth" : 11, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 86
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ m_axi_data_dram_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_data_dram_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_data_dram_AWADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_data_dram_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_data_dram_AWLEN sc_out sc_lv 32 signal 0 } 
	{ m_axi_data_dram_AWSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_data_dram_AWBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_data_dram_AWLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_data_dram_AWCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_data_dram_AWPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_data_dram_AWQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_data_dram_AWREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_data_dram_AWUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_data_dram_WVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_data_dram_WREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_data_dram_WDATA sc_out sc_lv 64 signal 0 } 
	{ m_axi_data_dram_WSTRB sc_out sc_lv 8 signal 0 } 
	{ m_axi_data_dram_WLAST sc_out sc_logic 1 signal 0 } 
	{ m_axi_data_dram_WID sc_out sc_lv 1 signal 0 } 
	{ m_axi_data_dram_WUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_data_dram_ARVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_data_dram_ARREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_data_dram_ARADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_data_dram_ARID sc_out sc_lv 1 signal 0 } 
	{ m_axi_data_dram_ARLEN sc_out sc_lv 32 signal 0 } 
	{ m_axi_data_dram_ARSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_data_dram_ARBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_data_dram_ARLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_data_dram_ARCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_data_dram_ARPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_data_dram_ARQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_data_dram_ARREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_data_dram_ARUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_data_dram_RVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_data_dram_RREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_data_dram_RDATA sc_in sc_lv 64 signal 0 } 
	{ m_axi_data_dram_RLAST sc_in sc_logic 1 signal 0 } 
	{ m_axi_data_dram_RID sc_in sc_lv 1 signal 0 } 
	{ m_axi_data_dram_RUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_data_dram_RRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_data_dram_BVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_data_dram_BREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_data_dram_BRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_data_dram_BID sc_in sc_lv 1 signal 0 } 
	{ m_axi_data_dram_BUSER sc_in sc_lv 1 signal 0 } 
	{ data_dram_offset sc_in sc_lv 61 signal 1 } 
	{ data_dram_offset1 sc_in sc_lv 15 signal 2 } 
	{ data_local_0_address0 sc_out sc_lv 8 signal 3 } 
	{ data_local_0_ce0 sc_out sc_logic 1 signal 3 } 
	{ data_local_0_we0 sc_out sc_logic 1 signal 3 } 
	{ data_local_0_d0 sc_out sc_lv 64 signal 3 } 
	{ data_local_1_address0 sc_out sc_lv 8 signal 4 } 
	{ data_local_1_ce0 sc_out sc_logic 1 signal 4 } 
	{ data_local_1_we0 sc_out sc_logic 1 signal 4 } 
	{ data_local_1_d0 sc_out sc_lv 64 signal 4 } 
	{ data_local_2_address0 sc_out sc_lv 8 signal 5 } 
	{ data_local_2_ce0 sc_out sc_logic 1 signal 5 } 
	{ data_local_2_we0 sc_out sc_logic 1 signal 5 } 
	{ data_local_2_d0 sc_out sc_lv 64 signal 5 } 
	{ data_local_3_address0 sc_out sc_lv 8 signal 6 } 
	{ data_local_3_ce0 sc_out sc_logic 1 signal 6 } 
	{ data_local_3_we0 sc_out sc_logic 1 signal 6 } 
	{ data_local_3_d0 sc_out sc_lv 64 signal 6 } 
	{ data_local_4_address0 sc_out sc_lv 8 signal 7 } 
	{ data_local_4_ce0 sc_out sc_logic 1 signal 7 } 
	{ data_local_4_we0 sc_out sc_logic 1 signal 7 } 
	{ data_local_4_d0 sc_out sc_lv 64 signal 7 } 
	{ data_local_5_address0 sc_out sc_lv 8 signal 8 } 
	{ data_local_5_ce0 sc_out sc_logic 1 signal 8 } 
	{ data_local_5_we0 sc_out sc_logic 1 signal 8 } 
	{ data_local_5_d0 sc_out sc_lv 64 signal 8 } 
	{ data_local_6_address0 sc_out sc_lv 8 signal 9 } 
	{ data_local_6_ce0 sc_out sc_logic 1 signal 9 } 
	{ data_local_6_we0 sc_out sc_logic 1 signal 9 } 
	{ data_local_6_d0 sc_out sc_lv 64 signal 9 } 
	{ data_local_7_address0 sc_out sc_lv 8 signal 10 } 
	{ data_local_7_ce0 sc_out sc_logic 1 signal 10 } 
	{ data_local_7_we0 sc_out sc_logic 1 signal 10 } 
	{ data_local_7_d0 sc_out sc_lv 64 signal 10 } 
	{ num_elem sc_in sc_lv 11 signal 11 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "m_axi_data_dram_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data_dram", "role": "AWVALID" }} , 
 	{ "name": "m_axi_data_dram_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data_dram", "role": "AWREADY" }} , 
 	{ "name": "m_axi_data_dram_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "data_dram", "role": "AWADDR" }} , 
 	{ "name": "m_axi_data_dram_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "data_dram", "role": "AWID" }} , 
 	{ "name": "m_axi_data_dram_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "data_dram", "role": "AWLEN" }} , 
 	{ "name": "m_axi_data_dram_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "data_dram", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_data_dram_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "data_dram", "role": "AWBURST" }} , 
 	{ "name": "m_axi_data_dram_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "data_dram", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_data_dram_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "data_dram", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_data_dram_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "data_dram", "role": "AWPROT" }} , 
 	{ "name": "m_axi_data_dram_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "data_dram", "role": "AWQOS" }} , 
 	{ "name": "m_axi_data_dram_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "data_dram", "role": "AWREGION" }} , 
 	{ "name": "m_axi_data_dram_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "data_dram", "role": "AWUSER" }} , 
 	{ "name": "m_axi_data_dram_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data_dram", "role": "WVALID" }} , 
 	{ "name": "m_axi_data_dram_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data_dram", "role": "WREADY" }} , 
 	{ "name": "m_axi_data_dram_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "data_dram", "role": "WDATA" }} , 
 	{ "name": "m_axi_data_dram_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "data_dram", "role": "WSTRB" }} , 
 	{ "name": "m_axi_data_dram_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data_dram", "role": "WLAST" }} , 
 	{ "name": "m_axi_data_dram_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "data_dram", "role": "WID" }} , 
 	{ "name": "m_axi_data_dram_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "data_dram", "role": "WUSER" }} , 
 	{ "name": "m_axi_data_dram_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data_dram", "role": "ARVALID" }} , 
 	{ "name": "m_axi_data_dram_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data_dram", "role": "ARREADY" }} , 
 	{ "name": "m_axi_data_dram_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "data_dram", "role": "ARADDR" }} , 
 	{ "name": "m_axi_data_dram_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "data_dram", "role": "ARID" }} , 
 	{ "name": "m_axi_data_dram_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "data_dram", "role": "ARLEN" }} , 
 	{ "name": "m_axi_data_dram_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "data_dram", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_data_dram_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "data_dram", "role": "ARBURST" }} , 
 	{ "name": "m_axi_data_dram_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "data_dram", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_data_dram_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "data_dram", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_data_dram_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "data_dram", "role": "ARPROT" }} , 
 	{ "name": "m_axi_data_dram_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "data_dram", "role": "ARQOS" }} , 
 	{ "name": "m_axi_data_dram_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "data_dram", "role": "ARREGION" }} , 
 	{ "name": "m_axi_data_dram_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "data_dram", "role": "ARUSER" }} , 
 	{ "name": "m_axi_data_dram_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data_dram", "role": "RVALID" }} , 
 	{ "name": "m_axi_data_dram_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data_dram", "role": "RREADY" }} , 
 	{ "name": "m_axi_data_dram_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "data_dram", "role": "RDATA" }} , 
 	{ "name": "m_axi_data_dram_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data_dram", "role": "RLAST" }} , 
 	{ "name": "m_axi_data_dram_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "data_dram", "role": "RID" }} , 
 	{ "name": "m_axi_data_dram_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "data_dram", "role": "RUSER" }} , 
 	{ "name": "m_axi_data_dram_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "data_dram", "role": "RRESP" }} , 
 	{ "name": "m_axi_data_dram_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data_dram", "role": "BVALID" }} , 
 	{ "name": "m_axi_data_dram_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data_dram", "role": "BREADY" }} , 
 	{ "name": "m_axi_data_dram_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "data_dram", "role": "BRESP" }} , 
 	{ "name": "m_axi_data_dram_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "data_dram", "role": "BID" }} , 
 	{ "name": "m_axi_data_dram_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "data_dram", "role": "BUSER" }} , 
 	{ "name": "data_dram_offset", "direction": "in", "datatype": "sc_lv", "bitwidth":61, "type": "signal", "bundle":{"name": "data_dram_offset", "role": "default" }} , 
 	{ "name": "data_dram_offset1", "direction": "in", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "data_dram_offset1", "role": "default" }} , 
 	{ "name": "data_local_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "data_local_0", "role": "address0" }} , 
 	{ "name": "data_local_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data_local_0", "role": "ce0" }} , 
 	{ "name": "data_local_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data_local_0", "role": "we0" }} , 
 	{ "name": "data_local_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "data_local_0", "role": "d0" }} , 
 	{ "name": "data_local_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "data_local_1", "role": "address0" }} , 
 	{ "name": "data_local_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data_local_1", "role": "ce0" }} , 
 	{ "name": "data_local_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data_local_1", "role": "we0" }} , 
 	{ "name": "data_local_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "data_local_1", "role": "d0" }} , 
 	{ "name": "data_local_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "data_local_2", "role": "address0" }} , 
 	{ "name": "data_local_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data_local_2", "role": "ce0" }} , 
 	{ "name": "data_local_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data_local_2", "role": "we0" }} , 
 	{ "name": "data_local_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "data_local_2", "role": "d0" }} , 
 	{ "name": "data_local_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "data_local_3", "role": "address0" }} , 
 	{ "name": "data_local_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data_local_3", "role": "ce0" }} , 
 	{ "name": "data_local_3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data_local_3", "role": "we0" }} , 
 	{ "name": "data_local_3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "data_local_3", "role": "d0" }} , 
 	{ "name": "data_local_4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "data_local_4", "role": "address0" }} , 
 	{ "name": "data_local_4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data_local_4", "role": "ce0" }} , 
 	{ "name": "data_local_4_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data_local_4", "role": "we0" }} , 
 	{ "name": "data_local_4_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "data_local_4", "role": "d0" }} , 
 	{ "name": "data_local_5_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "data_local_5", "role": "address0" }} , 
 	{ "name": "data_local_5_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data_local_5", "role": "ce0" }} , 
 	{ "name": "data_local_5_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data_local_5", "role": "we0" }} , 
 	{ "name": "data_local_5_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "data_local_5", "role": "d0" }} , 
 	{ "name": "data_local_6_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "data_local_6", "role": "address0" }} , 
 	{ "name": "data_local_6_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data_local_6", "role": "ce0" }} , 
 	{ "name": "data_local_6_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data_local_6", "role": "we0" }} , 
 	{ "name": "data_local_6_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "data_local_6", "role": "d0" }} , 
 	{ "name": "data_local_7_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "data_local_7", "role": "address0" }} , 
 	{ "name": "data_local_7_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data_local_7", "role": "ce0" }} , 
 	{ "name": "data_local_7_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data_local_7", "role": "we0" }} , 
 	{ "name": "data_local_7_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "data_local_7", "role": "d0" }} , 
 	{ "name": "num_elem", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "num_elem", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "load_unsigned_long_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "11", "EstimateLatencyMax" : "1810",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "data_dram", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "data_dram_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "data_dram_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "data_dram_offset", "Type" : "None", "Direction" : "I"},
			{"Name" : "data_dram_offset1", "Type" : "None", "Direction" : "I"},
			{"Name" : "data_local_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "data_local_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "data_local_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "data_local_3", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "data_local_4", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "data_local_5", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "data_local_6", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "data_local_7", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "num_elem", "Type" : "None", "Direction" : "I"}]}]}


set ArgLastReadFirstWriteLatency {
	load_unsigned_long_s {
		data_dram {Type I LastRead 9 FirstWrite -1}
		data_dram_offset {Type I LastRead 0 FirstWrite -1}
		data_dram_offset1 {Type I LastRead 0 FirstWrite -1}
		data_local_0 {Type O LastRead -1 FirstWrite 10}
		data_local_1 {Type O LastRead -1 FirstWrite 10}
		data_local_2 {Type O LastRead -1 FirstWrite 10}
		data_local_3 {Type O LastRead -1 FirstWrite 10}
		data_local_4 {Type O LastRead -1 FirstWrite 10}
		data_local_5 {Type O LastRead -1 FirstWrite 10}
		data_local_6 {Type O LastRead -1 FirstWrite 10}
		data_local_7 {Type O LastRead -1 FirstWrite 10}
		num_elem {Type I LastRead 1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "11", "Max" : "1810"}
	, {"Name" : "Interval", "Min" : "11", "Max" : "1810"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	data_dram { m_axi {  { m_axi_data_dram_AWVALID VALID 1 1 }  { m_axi_data_dram_AWREADY READY 0 1 }  { m_axi_data_dram_AWADDR ADDR 1 64 }  { m_axi_data_dram_AWID ID 1 1 }  { m_axi_data_dram_AWLEN LEN 1 32 }  { m_axi_data_dram_AWSIZE SIZE 1 3 }  { m_axi_data_dram_AWBURST BURST 1 2 }  { m_axi_data_dram_AWLOCK LOCK 1 2 }  { m_axi_data_dram_AWCACHE CACHE 1 4 }  { m_axi_data_dram_AWPROT PROT 1 3 }  { m_axi_data_dram_AWQOS QOS 1 4 }  { m_axi_data_dram_AWREGION REGION 1 4 }  { m_axi_data_dram_AWUSER USER 1 1 }  { m_axi_data_dram_WVALID VALID 1 1 }  { m_axi_data_dram_WREADY READY 0 1 }  { m_axi_data_dram_WDATA DATA 1 64 }  { m_axi_data_dram_WSTRB STRB 1 8 }  { m_axi_data_dram_WLAST LAST 1 1 }  { m_axi_data_dram_WID ID 1 1 }  { m_axi_data_dram_WUSER USER 1 1 }  { m_axi_data_dram_ARVALID VALID 1 1 }  { m_axi_data_dram_ARREADY READY 0 1 }  { m_axi_data_dram_ARADDR ADDR 1 64 }  { m_axi_data_dram_ARID ID 1 1 }  { m_axi_data_dram_ARLEN LEN 1 32 }  { m_axi_data_dram_ARSIZE SIZE 1 3 }  { m_axi_data_dram_ARBURST BURST 1 2 }  { m_axi_data_dram_ARLOCK LOCK 1 2 }  { m_axi_data_dram_ARCACHE CACHE 1 4 }  { m_axi_data_dram_ARPROT PROT 1 3 }  { m_axi_data_dram_ARQOS QOS 1 4 }  { m_axi_data_dram_ARREGION REGION 1 4 }  { m_axi_data_dram_ARUSER USER 1 1 }  { m_axi_data_dram_RVALID VALID 0 1 }  { m_axi_data_dram_RREADY READY 1 1 }  { m_axi_data_dram_RDATA DATA 0 64 }  { m_axi_data_dram_RLAST LAST 0 1 }  { m_axi_data_dram_RID ID 0 1 }  { m_axi_data_dram_RUSER USER 0 1 }  { m_axi_data_dram_RRESP RESP 0 2 }  { m_axi_data_dram_BVALID VALID 0 1 }  { m_axi_data_dram_BREADY READY 1 1 }  { m_axi_data_dram_BRESP RESP 0 2 }  { m_axi_data_dram_BID ID 0 1 }  { m_axi_data_dram_BUSER USER 0 1 } } }
	data_dram_offset { ap_none {  { data_dram_offset in_data 0 61 } } }
	data_dram_offset1 { ap_none {  { data_dram_offset1 in_data 0 15 } } }
	data_local_0 { ap_memory {  { data_local_0_address0 mem_address 1 8 }  { data_local_0_ce0 mem_ce 1 1 }  { data_local_0_we0 mem_we 1 1 }  { data_local_0_d0 mem_din 1 64 } } }
	data_local_1 { ap_memory {  { data_local_1_address0 mem_address 1 8 }  { data_local_1_ce0 mem_ce 1 1 }  { data_local_1_we0 mem_we 1 1 }  { data_local_1_d0 mem_din 1 64 } } }
	data_local_2 { ap_memory {  { data_local_2_address0 mem_address 1 8 }  { data_local_2_ce0 mem_ce 1 1 }  { data_local_2_we0 mem_we 1 1 }  { data_local_2_d0 mem_din 1 64 } } }
	data_local_3 { ap_memory {  { data_local_3_address0 mem_address 1 8 }  { data_local_3_ce0 mem_ce 1 1 }  { data_local_3_we0 mem_we 1 1 }  { data_local_3_d0 mem_din 1 64 } } }
	data_local_4 { ap_memory {  { data_local_4_address0 mem_address 1 8 }  { data_local_4_ce0 mem_ce 1 1 }  { data_local_4_we0 mem_we 1 1 }  { data_local_4_d0 mem_din 1 64 } } }
	data_local_5 { ap_memory {  { data_local_5_address0 mem_address 1 8 }  { data_local_5_ce0 mem_ce 1 1 }  { data_local_5_we0 mem_we 1 1 }  { data_local_5_d0 mem_din 1 64 } } }
	data_local_6 { ap_memory {  { data_local_6_address0 mem_address 1 8 }  { data_local_6_ce0 mem_ce 1 1 }  { data_local_6_we0 mem_we 1 1 }  { data_local_6_d0 mem_din 1 64 } } }
	data_local_7 { ap_memory {  { data_local_7_address0 mem_address 1 8 }  { data_local_7_ce0 mem_ce 1 1 }  { data_local_7_we0 mem_we 1 1 }  { data_local_7_d0 mem_din 1 64 } } }
	num_elem { ap_none {  { num_elem in_data 0 11 } } }
}
