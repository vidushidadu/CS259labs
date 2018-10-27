set C_TypeInfoList {{ 
"digitrec_kernel" : [[], { "return": [[], "void"]} , [{"ExternC" : 1}], [ {"test_image": [[], {"scalar": "long unsigned int"}] }, {"train_images": [[],{ "pointer":  {"scalar": "long unsigned int"}}] }, {"knn_mat": [[],{ "pointer":  {"scalar": "unsigned char"}}] }],[],""]
}}
set moduleName digitrec_kernel
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
set C_modelName {digitrec_kernel}
set C_modelType { void 0 }
set C_modelArgList {
	{ gmem int 64 regular {axi_master 0}  }
	{ gmem2 int 8 regular {axi_master 1}  }
	{ test_image int 64 regular {axi_slave 0}  }
	{ train_images int 64 regular {axi_slave 0}  }
	{ knn_mat int 64 regular {axi_slave 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "gmem", "interface" : "axi_master", "bitwidth" : 64, "direction" : "READONLY", "bitSlice":[{"low":0,"up":63,"cElement": [{"cName": "train_images","cData": "long unsigned int","bit_use": { "low": 0,"up": 63},"offset": { "type": "dynamic","port_name": "train_images","bundle": "control"},"direction": "READONLY","cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "gmem2", "interface" : "axi_master", "bitwidth" : 8, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":7,"cElement": [{"cName": "knn_mat","cData": "unsigned char","bit_use": { "low": 0,"up": 7},"offset": { "type": "dynamic","port_name": "knn_mat","bundle": "control"},"direction": "WRITEONLY","cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "test_image", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "bitSlice":[{"low":0,"up":63,"cElement": [{"cName": "test_image","cData": "long unsigned int","bit_use": { "low": 0,"up": 63},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}], "offset" : {"in":16}, "offset_end" : {"in":27}} , 
 	{ "Name" : "train_images", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":28}, "offset_end" : {"in":39}} , 
 	{ "Name" : "knn_mat", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":40}, "offset_end" : {"in":51}} ]}
# RTL Port declarations: 
set portNum 110
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ m_axi_gmem_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem_AWADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_gmem_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem_AWLEN sc_out sc_lv 8 signal 0 } 
	{ m_axi_gmem_AWSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_gmem_AWBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_gmem_AWLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_gmem_AWCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem_AWPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_gmem_AWQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem_AWREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem_AWUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem_WVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem_WREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem_WDATA sc_out sc_lv 64 signal 0 } 
	{ m_axi_gmem_WSTRB sc_out sc_lv 8 signal 0 } 
	{ m_axi_gmem_WLAST sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem_WID sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem_WUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem_ARVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem_ARREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem_ARADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_gmem_ARID sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem_ARLEN sc_out sc_lv 8 signal 0 } 
	{ m_axi_gmem_ARSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_gmem_ARBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_gmem_ARLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_gmem_ARCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem_ARPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_gmem_ARQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem_ARREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem_ARUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem_RVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem_RREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem_RDATA sc_in sc_lv 64 signal 0 } 
	{ m_axi_gmem_RLAST sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem_RID sc_in sc_lv 1 signal 0 } 
	{ m_axi_gmem_RUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_gmem_RRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_gmem_BVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem_BREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem_BRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_gmem_BID sc_in sc_lv 1 signal 0 } 
	{ m_axi_gmem_BUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_gmem2_AWVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_gmem2_AWREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_gmem2_AWADDR sc_out sc_lv 64 signal 1 } 
	{ m_axi_gmem2_AWID sc_out sc_lv 1 signal 1 } 
	{ m_axi_gmem2_AWLEN sc_out sc_lv 8 signal 1 } 
	{ m_axi_gmem2_AWSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_gmem2_AWBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_gmem2_AWLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_gmem2_AWCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_gmem2_AWPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_gmem2_AWQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_gmem2_AWREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_gmem2_AWUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_gmem2_WVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_gmem2_WREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_gmem2_WDATA sc_out sc_lv 32 signal 1 } 
	{ m_axi_gmem2_WSTRB sc_out sc_lv 4 signal 1 } 
	{ m_axi_gmem2_WLAST sc_out sc_logic 1 signal 1 } 
	{ m_axi_gmem2_WID sc_out sc_lv 1 signal 1 } 
	{ m_axi_gmem2_WUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_gmem2_ARVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_gmem2_ARREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_gmem2_ARADDR sc_out sc_lv 64 signal 1 } 
	{ m_axi_gmem2_ARID sc_out sc_lv 1 signal 1 } 
	{ m_axi_gmem2_ARLEN sc_out sc_lv 8 signal 1 } 
	{ m_axi_gmem2_ARSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_gmem2_ARBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_gmem2_ARLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_gmem2_ARCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_gmem2_ARPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_gmem2_ARQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_gmem2_ARREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_gmem2_ARUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_gmem2_RVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_gmem2_RREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_gmem2_RDATA sc_in sc_lv 32 signal 1 } 
	{ m_axi_gmem2_RLAST sc_in sc_logic 1 signal 1 } 
	{ m_axi_gmem2_RID sc_in sc_lv 1 signal 1 } 
	{ m_axi_gmem2_RUSER sc_in sc_lv 1 signal 1 } 
	{ m_axi_gmem2_RRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_gmem2_BVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_gmem2_BREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_gmem2_BRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_gmem2_BID sc_in sc_lv 1 signal 1 } 
	{ m_axi_gmem2_BUSER sc_in sc_lv 1 signal 1 } 
	{ s_axi_control_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_AWADDR sc_in sc_lv 6 signal -1 } 
	{ s_axi_control_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_control_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_control_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_ARADDR sc_in sc_lv 6 signal -1 } 
	{ s_axi_control_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_control_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_control_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_BRESP sc_out sc_lv 2 signal -1 } 
	{ interrupt sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "s_axi_control_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "control", "role": "AWADDR" },"address":[{"name":"digitrec_kernel","role":"start","value":"0","valid_bit":"0"},{"name":"digitrec_kernel","role":"continue","value":"0","valid_bit":"4"},{"name":"digitrec_kernel","role":"auto_start","value":"0","valid_bit":"7"},{"name":"test_image","role":"data","value":"16"},{"name":"train_images","role":"data","value":"28"},{"name":"knn_mat","role":"data","value":"40"}] },
	{ "name": "s_axi_control_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWVALID" } },
	{ "name": "s_axi_control_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWREADY" } },
	{ "name": "s_axi_control_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WVALID" } },
	{ "name": "s_axi_control_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WREADY" } },
	{ "name": "s_axi_control_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "WDATA" } },
	{ "name": "s_axi_control_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "control", "role": "WSTRB" } },
	{ "name": "s_axi_control_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "control", "role": "ARADDR" },"address":[{"name":"digitrec_kernel","role":"start","value":"0","valid_bit":"0"},{"name":"digitrec_kernel","role":"done","value":"0","valid_bit":"1"},{"name":"digitrec_kernel","role":"idle","value":"0","valid_bit":"2"},{"name":"digitrec_kernel","role":"ready","value":"0","valid_bit":"3"},{"name":"digitrec_kernel","role":"auto_start","value":"0","valid_bit":"7"}] },
	{ "name": "s_axi_control_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARVALID" } },
	{ "name": "s_axi_control_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARREADY" } },
	{ "name": "s_axi_control_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RVALID" } },
	{ "name": "s_axi_control_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RREADY" } },
	{ "name": "s_axi_control_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "RDATA" } },
	{ "name": "s_axi_control_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "RRESP" } },
	{ "name": "s_axi_control_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BVALID" } },
	{ "name": "s_axi_control_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BREADY" } },
	{ "name": "s_axi_control_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "BRESP" } },
	{ "name": "interrupt", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "interrupt" } }, 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "m_axi_gmem_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "AWVALID" }} , 
 	{ "name": "m_axi_gmem_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "AWREADY" }} , 
 	{ "name": "m_axi_gmem_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem", "role": "AWADDR" }} , 
 	{ "name": "m_axi_gmem_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "AWID" }} , 
 	{ "name": "m_axi_gmem_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gmem", "role": "AWLEN" }} , 
 	{ "name": "m_axi_gmem_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_gmem_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem", "role": "AWBURST" }} , 
 	{ "name": "m_axi_gmem_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_gmem_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_gmem_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem", "role": "AWPROT" }} , 
 	{ "name": "m_axi_gmem_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem", "role": "AWQOS" }} , 
 	{ "name": "m_axi_gmem_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem", "role": "AWREGION" }} , 
 	{ "name": "m_axi_gmem_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "AWUSER" }} , 
 	{ "name": "m_axi_gmem_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "WVALID" }} , 
 	{ "name": "m_axi_gmem_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "WREADY" }} , 
 	{ "name": "m_axi_gmem_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem", "role": "WDATA" }} , 
 	{ "name": "m_axi_gmem_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gmem", "role": "WSTRB" }} , 
 	{ "name": "m_axi_gmem_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "WLAST" }} , 
 	{ "name": "m_axi_gmem_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "WID" }} , 
 	{ "name": "m_axi_gmem_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "WUSER" }} , 
 	{ "name": "m_axi_gmem_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "ARVALID" }} , 
 	{ "name": "m_axi_gmem_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "ARREADY" }} , 
 	{ "name": "m_axi_gmem_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem", "role": "ARADDR" }} , 
 	{ "name": "m_axi_gmem_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "ARID" }} , 
 	{ "name": "m_axi_gmem_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gmem", "role": "ARLEN" }} , 
 	{ "name": "m_axi_gmem_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_gmem_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem", "role": "ARBURST" }} , 
 	{ "name": "m_axi_gmem_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_gmem_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_gmem_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem", "role": "ARPROT" }} , 
 	{ "name": "m_axi_gmem_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem", "role": "ARQOS" }} , 
 	{ "name": "m_axi_gmem_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem", "role": "ARREGION" }} , 
 	{ "name": "m_axi_gmem_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "ARUSER" }} , 
 	{ "name": "m_axi_gmem_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "RVALID" }} , 
 	{ "name": "m_axi_gmem_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "RREADY" }} , 
 	{ "name": "m_axi_gmem_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem", "role": "RDATA" }} , 
 	{ "name": "m_axi_gmem_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "RLAST" }} , 
 	{ "name": "m_axi_gmem_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "RID" }} , 
 	{ "name": "m_axi_gmem_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "RUSER" }} , 
 	{ "name": "m_axi_gmem_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem", "role": "RRESP" }} , 
 	{ "name": "m_axi_gmem_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "BVALID" }} , 
 	{ "name": "m_axi_gmem_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "BREADY" }} , 
 	{ "name": "m_axi_gmem_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem", "role": "BRESP" }} , 
 	{ "name": "m_axi_gmem_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "BID" }} , 
 	{ "name": "m_axi_gmem_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "BUSER" }} , 
 	{ "name": "m_axi_gmem2_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "AWVALID" }} , 
 	{ "name": "m_axi_gmem2_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "AWREADY" }} , 
 	{ "name": "m_axi_gmem2_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem2", "role": "AWADDR" }} , 
 	{ "name": "m_axi_gmem2_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "AWID" }} , 
 	{ "name": "m_axi_gmem2_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gmem2", "role": "AWLEN" }} , 
 	{ "name": "m_axi_gmem2_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem2", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_gmem2_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem2", "role": "AWBURST" }} , 
 	{ "name": "m_axi_gmem2_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem2", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_gmem2_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem2", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_gmem2_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem2", "role": "AWPROT" }} , 
 	{ "name": "m_axi_gmem2_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem2", "role": "AWQOS" }} , 
 	{ "name": "m_axi_gmem2_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem2", "role": "AWREGION" }} , 
 	{ "name": "m_axi_gmem2_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "AWUSER" }} , 
 	{ "name": "m_axi_gmem2_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "WVALID" }} , 
 	{ "name": "m_axi_gmem2_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "WREADY" }} , 
 	{ "name": "m_axi_gmem2_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem2", "role": "WDATA" }} , 
 	{ "name": "m_axi_gmem2_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem2", "role": "WSTRB" }} , 
 	{ "name": "m_axi_gmem2_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "WLAST" }} , 
 	{ "name": "m_axi_gmem2_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "WID" }} , 
 	{ "name": "m_axi_gmem2_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "WUSER" }} , 
 	{ "name": "m_axi_gmem2_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "ARVALID" }} , 
 	{ "name": "m_axi_gmem2_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "ARREADY" }} , 
 	{ "name": "m_axi_gmem2_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem2", "role": "ARADDR" }} , 
 	{ "name": "m_axi_gmem2_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "ARID" }} , 
 	{ "name": "m_axi_gmem2_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gmem2", "role": "ARLEN" }} , 
 	{ "name": "m_axi_gmem2_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem2", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_gmem2_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem2", "role": "ARBURST" }} , 
 	{ "name": "m_axi_gmem2_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem2", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_gmem2_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem2", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_gmem2_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem2", "role": "ARPROT" }} , 
 	{ "name": "m_axi_gmem2_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem2", "role": "ARQOS" }} , 
 	{ "name": "m_axi_gmem2_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem2", "role": "ARREGION" }} , 
 	{ "name": "m_axi_gmem2_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "ARUSER" }} , 
 	{ "name": "m_axi_gmem2_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "RVALID" }} , 
 	{ "name": "m_axi_gmem2_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "RREADY" }} , 
 	{ "name": "m_axi_gmem2_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem2", "role": "RDATA" }} , 
 	{ "name": "m_axi_gmem2_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "RLAST" }} , 
 	{ "name": "m_axi_gmem2_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "RID" }} , 
 	{ "name": "m_axi_gmem2_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "RUSER" }} , 
 	{ "name": "m_axi_gmem2_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem2", "role": "RRESP" }} , 
 	{ "name": "m_axi_gmem2_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "BVALID" }} , 
 	{ "name": "m_axi_gmem2_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "BREADY" }} , 
 	{ "name": "m_axi_gmem2_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem2", "role": "BRESP" }} , 
 	{ "name": "m_axi_gmem2_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "BID" }} , 
 	{ "name": "m_axi_gmem2_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "BUSER" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "100", "101", "102", "103", "104"],
		"CDFG" : "digitrec_kernel",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "163863", "EstimateLatencyMax" : "2846623",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"WaitState" : [
			{"State" : "ap_ST_fsm_state8", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_compute_fu_647"},
			{"State" : "ap_ST_fsm_state6", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_load_unsigned_long_s_fu_721"},
			{"State" : "ap_ST_fsm_state9", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_load_unsigned_char_s_fu_739"}],
		"Port" : [
			{"Name" : "gmem", "Type" : "MAXI", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "73", "SubInstance" : "grp_load_unsigned_long_s_fu_721", "Port" : "data_dram"}]},
			{"Name" : "gmem2", "Type" : "MAXI", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "74", "SubInstance" : "grp_load_unsigned_char_s_fu_739", "Port" : "data_local"}]},
			{"Name" : "test_image", "Type" : "None", "Direction" : "I"},
			{"Name" : "train_images", "Type" : "None", "Direction" : "I"},
			{"Name" : "knn_mat", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.digitrec_kernel_control_s_axi_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.digitrec_kernel_gmem_m_axi_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.digitrec_kernel_gmem2_m_axi_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_01_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_1_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_2_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_3_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_4_U", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_5_U", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_6_U", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_7_U", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_compute_fu_647", "Parent" : "0", "Child" : ["13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "70", "71", "72"],
		"CDFG" : "compute",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "16357", "EstimateLatencyMax" : "282834",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"WaitState" : [
			{"State" : "ap_ST_fsm_state11", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_update_fu_907"}],
		"Port" : [
			{"Name" : "test_image", "Type" : "None", "Direction" : "I"},
			{"Name" : "train_images_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "train_images_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "train_images_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "train_images_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "train_images_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "train_images_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "train_images_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "train_images_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "knn_mat_0_0_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "knn_mat_0_1_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "knn_mat_0_2_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "knn_mat_0_3_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "knn_mat_1_0_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "knn_mat_1_1_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "knn_mat_1_2_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "knn_mat_1_3_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "knn_mat_2_0_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "knn_mat_2_1_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "knn_mat_2_2_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "knn_mat_2_3_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "knn_mat_3_0_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "knn_mat_3_1_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "knn_mat_3_2_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "knn_mat_3_3_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "knn_mat_4_0_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "knn_mat_4_1_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "knn_mat_4_2_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "knn_mat_4_3_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "knn_mat_5_0_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "knn_mat_5_1_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "knn_mat_5_2_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "knn_mat_5_3_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "knn_mat_6_0_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "knn_mat_6_1_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "knn_mat_6_2_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "knn_mat_7_0_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "knn_mat_7_1_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "knn_mat_7_2_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "local_num_elements", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "13", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_compute_fu_647.local_temp_0_U", "Parent" : "12"},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_compute_fu_647.local_temp_1_U", "Parent" : "12"},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_compute_fu_647.local_temp_2_U", "Parent" : "12"},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_compute_fu_647.local_temp_3_U", "Parent" : "12"},
	{"ID" : "17", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_compute_fu_647.local_temp_4_U", "Parent" : "12"},
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_compute_fu_647.local_temp_5_U", "Parent" : "12"},
	{"ID" : "19", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_compute_fu_647.local_temp_6_U", "Parent" : "12"},
	{"ID" : "20", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_compute_fu_647.local_temp_7_U", "Parent" : "12"},
	{"ID" : "21", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_compute_fu_647.dis_0_U", "Parent" : "12"},
	{"ID" : "22", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_compute_fu_647.dis_1_U", "Parent" : "12"},
	{"ID" : "23", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_compute_fu_647.dis_2_U", "Parent" : "12"},
	{"ID" : "24", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_compute_fu_647.dis_3_U", "Parent" : "12"},
	{"ID" : "25", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_compute_fu_647.dis_4_U", "Parent" : "12"},
	{"ID" : "26", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_compute_fu_647.dis_5_U", "Parent" : "12"},
	{"ID" : "27", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_compute_fu_647.dis_6_U", "Parent" : "12"},
	{"ID" : "28", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_compute_fu_647.dis_7_U", "Parent" : "12"},
	{"ID" : "29", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_compute_fu_647.grp_update_fu_907", "Parent" : "12", "Child" : ["30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69"],
		"CDFG" : "update",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "16201", "EstimateLatencyMax" : "16201",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "temp_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "temp_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "temp_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "temp_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "temp_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "temp_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "temp_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "temp_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "knn_mat_0_0_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "knn_mat_0_1_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "knn_mat_0_2_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "knn_mat_0_3_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "knn_mat_1_0_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "knn_mat_1_1_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "knn_mat_1_2_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "knn_mat_1_3_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "knn_mat_2_0_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "knn_mat_2_1_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "knn_mat_2_2_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "knn_mat_2_3_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "knn_mat_3_0_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "knn_mat_3_1_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "knn_mat_3_2_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "knn_mat_3_3_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "knn_mat_4_0_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "knn_mat_4_1_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "knn_mat_4_2_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "knn_mat_4_3_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "knn_mat_5_0_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "knn_mat_5_1_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "knn_mat_5_2_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "knn_mat_5_3_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "knn_mat_6_0_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "knn_mat_6_1_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "knn_mat_6_2_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "knn_mat_7_0_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "knn_mat_7_1_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "knn_mat_7_2_read", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "30", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_compute_fu_647.grp_update_fu_907.digitrec_kernel_mux_32_8_1_1_U13", "Parent" : "29"},
	{"ID" : "31", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_compute_fu_647.grp_update_fu_907.digitrec_kernel_mux_42_8_1_1_U14", "Parent" : "29"},
	{"ID" : "32", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_compute_fu_647.grp_update_fu_907.digitrec_kernel_mux_42_8_1_1_U15", "Parent" : "29"},
	{"ID" : "33", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_compute_fu_647.grp_update_fu_907.digitrec_kernel_mux_42_8_1_1_U16", "Parent" : "29"},
	{"ID" : "34", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_compute_fu_647.grp_update_fu_907.digitrec_kernel_mux_42_8_1_1_U17", "Parent" : "29"},
	{"ID" : "35", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_compute_fu_647.grp_update_fu_907.digitrec_kernel_mux_42_8_1_1_U18", "Parent" : "29"},
	{"ID" : "36", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_compute_fu_647.grp_update_fu_907.digitrec_kernel_mux_42_8_1_1_U19", "Parent" : "29"},
	{"ID" : "37", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_compute_fu_647.grp_update_fu_907.digitrec_kernel_mux_32_8_1_1_U20", "Parent" : "29"},
	{"ID" : "38", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_compute_fu_647.grp_update_fu_907.digitrec_kernel_mux_42_8_1_1_U21", "Parent" : "29"},
	{"ID" : "39", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_compute_fu_647.grp_update_fu_907.digitrec_kernel_mux_832_64_1_1_U22", "Parent" : "29"},
	{"ID" : "40", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_compute_fu_647.grp_update_fu_907.digitrec_kernel_mux_42_8_1_1_U23", "Parent" : "29"},
	{"ID" : "41", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_compute_fu_647.grp_update_fu_907.digitrec_kernel_mux_42_8_1_1_U24", "Parent" : "29"},
	{"ID" : "42", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_compute_fu_647.grp_update_fu_907.digitrec_kernel_mux_42_8_1_1_U25", "Parent" : "29"},
	{"ID" : "43", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_compute_fu_647.grp_update_fu_907.digitrec_kernel_mux_42_8_1_1_U26", "Parent" : "29"},
	{"ID" : "44", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_compute_fu_647.grp_update_fu_907.digitrec_kernel_mux_42_8_1_1_U27", "Parent" : "29"},
	{"ID" : "45", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_compute_fu_647.grp_update_fu_907.digitrec_kernel_mux_42_8_1_1_U28", "Parent" : "29"},
	{"ID" : "46", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_compute_fu_647.grp_update_fu_907.digitrec_kernel_mux_42_8_1_1_U29", "Parent" : "29"},
	{"ID" : "47", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_compute_fu_647.grp_update_fu_907.digitrec_kernel_mux_42_8_1_1_U30", "Parent" : "29"},
	{"ID" : "48", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_compute_fu_647.grp_update_fu_907.digitrec_kernel_mux_42_8_1_1_U31", "Parent" : "29"},
	{"ID" : "49", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_compute_fu_647.grp_update_fu_907.digitrec_kernel_mux_42_8_1_1_U32", "Parent" : "29"},
	{"ID" : "50", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_compute_fu_647.grp_update_fu_907.digitrec_kernel_mux_42_8_1_1_U33", "Parent" : "29"},
	{"ID" : "51", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_compute_fu_647.grp_update_fu_907.digitrec_kernel_mux_42_8_1_1_U34", "Parent" : "29"},
	{"ID" : "52", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_compute_fu_647.grp_update_fu_907.digitrec_kernel_mux_42_8_1_1_U35", "Parent" : "29"},
	{"ID" : "53", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_compute_fu_647.grp_update_fu_907.digitrec_kernel_mux_42_8_1_1_U36", "Parent" : "29"},
	{"ID" : "54", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_compute_fu_647.grp_update_fu_907.digitrec_kernel_mux_42_8_1_1_U37", "Parent" : "29"},
	{"ID" : "55", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_compute_fu_647.grp_update_fu_907.digitrec_kernel_mux_42_8_1_1_U38", "Parent" : "29"},
	{"ID" : "56", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_compute_fu_647.grp_update_fu_907.digitrec_kernel_mux_42_8_1_1_U39", "Parent" : "29"},
	{"ID" : "57", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_compute_fu_647.grp_update_fu_907.digitrec_kernel_mux_42_8_1_1_U40", "Parent" : "29"},
	{"ID" : "58", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_compute_fu_647.grp_update_fu_907.digitrec_kernel_mux_42_8_1_1_U41", "Parent" : "29"},
	{"ID" : "59", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_compute_fu_647.grp_update_fu_907.digitrec_kernel_mux_42_8_1_1_U42", "Parent" : "29"},
	{"ID" : "60", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_compute_fu_647.grp_update_fu_907.digitrec_kernel_mux_42_8_1_1_U43", "Parent" : "29"},
	{"ID" : "61", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_compute_fu_647.grp_update_fu_907.digitrec_kernel_mux_42_8_1_1_U44", "Parent" : "29"},
	{"ID" : "62", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_compute_fu_647.grp_update_fu_907.digitrec_kernel_mux_42_8_1_1_U45", "Parent" : "29"},
	{"ID" : "63", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_compute_fu_647.grp_update_fu_907.digitrec_kernel_mux_42_8_1_1_U46", "Parent" : "29"},
	{"ID" : "64", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_compute_fu_647.grp_update_fu_907.digitrec_kernel_mux_42_8_1_1_U47", "Parent" : "29"},
	{"ID" : "65", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_compute_fu_647.grp_update_fu_907.digitrec_kernel_mux_42_8_1_1_U48", "Parent" : "29"},
	{"ID" : "66", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_compute_fu_647.grp_update_fu_907.digitrec_kernel_mux_42_8_1_1_U49", "Parent" : "29"},
	{"ID" : "67", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_compute_fu_647.grp_update_fu_907.digitrec_kernel_mux_42_8_1_1_U50", "Parent" : "29"},
	{"ID" : "68", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_compute_fu_647.grp_update_fu_907.digitrec_kernel_mux_42_8_1_1_U51", "Parent" : "29"},
	{"ID" : "69", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_compute_fu_647.grp_update_fu_907.digitrec_kernel_mux_42_8_1_1_U52", "Parent" : "29"},
	{"ID" : "70", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_compute_fu_647.digitrec_kernel_mux_832_64_1_1_U94", "Parent" : "12"},
	{"ID" : "71", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_compute_fu_647.digitrec_kernel_mux_832_64_1_1_U95", "Parent" : "12"},
	{"ID" : "72", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_compute_fu_647.digitrec_kernel_mul_mul_11ns_7ns_17_1_1_U96", "Parent" : "12"},
	{"ID" : "73", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_load_unsigned_long_s_fu_721", "Parent" : "0",
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
			{"Name" : "num_elem", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "74", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_load_unsigned_char_s_fu_739", "Parent" : "0",
		"CDFG" : "load_unsigned_char_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "10", "EstimateLatencyMax" : "10",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "p_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read4", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read8", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read27", "Type" : "None", "Direction" : "I"},
			{"Name" : "data_local", "Type" : "MAXI", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "data_local_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "data_local_blk_n_W", "Type" : "RtlSignal"},
					{"Name" : "data_local_blk_n_B", "Type" : "RtlSignal"}]},
			{"Name" : "data_local_offset", "Type" : "None", "Direction" : "I"},
			{"Name" : "data_local_offset1", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "75", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.digitrec_kernel_mux_42_8_1_1_U146", "Parent" : "0"},
	{"ID" : "76", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.digitrec_kernel_mux_42_8_1_1_U147", "Parent" : "0"},
	{"ID" : "77", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.digitrec_kernel_mux_42_8_1_1_U148", "Parent" : "0"},
	{"ID" : "78", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.digitrec_kernel_mux_42_8_1_1_U149", "Parent" : "0"},
	{"ID" : "79", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.digitrec_kernel_mux_42_8_1_1_U150", "Parent" : "0"},
	{"ID" : "80", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.digitrec_kernel_mux_42_8_1_1_U151", "Parent" : "0"},
	{"ID" : "81", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.digitrec_kernel_mux_42_8_1_1_U152", "Parent" : "0"},
	{"ID" : "82", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.digitrec_kernel_mux_42_8_1_1_U153", "Parent" : "0"},
	{"ID" : "83", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.digitrec_kernel_mux_42_8_1_1_U154", "Parent" : "0"},
	{"ID" : "84", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.digitrec_kernel_mux_42_8_1_1_U155", "Parent" : "0"},
	{"ID" : "85", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.digitrec_kernel_mux_42_8_1_1_U156", "Parent" : "0"},
	{"ID" : "86", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.digitrec_kernel_mux_42_8_1_1_U157", "Parent" : "0"},
	{"ID" : "87", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.digitrec_kernel_mux_42_8_1_1_U158", "Parent" : "0"},
	{"ID" : "88", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.digitrec_kernel_mux_42_8_1_1_U159", "Parent" : "0"},
	{"ID" : "89", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.digitrec_kernel_mux_42_8_1_1_U160", "Parent" : "0"},
	{"ID" : "90", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.digitrec_kernel_mux_42_8_1_1_U161", "Parent" : "0"},
	{"ID" : "91", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.digitrec_kernel_mux_42_8_1_1_U162", "Parent" : "0"},
	{"ID" : "92", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.digitrec_kernel_mux_42_8_1_1_U163", "Parent" : "0"},
	{"ID" : "93", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.digitrec_kernel_mux_42_8_1_1_U164", "Parent" : "0"},
	{"ID" : "94", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.digitrec_kernel_mux_42_8_1_1_U165", "Parent" : "0"},
	{"ID" : "95", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.digitrec_kernel_mux_42_8_1_1_U166", "Parent" : "0"},
	{"ID" : "96", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.digitrec_kernel_mux_42_8_1_1_U167", "Parent" : "0"},
	{"ID" : "97", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.digitrec_kernel_mux_42_8_1_1_U168", "Parent" : "0"},
	{"ID" : "98", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.digitrec_kernel_mux_42_8_1_1_U169", "Parent" : "0"},
	{"ID" : "99", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.digitrec_kernel_mux_42_8_1_1_U170", "Parent" : "0"},
	{"ID" : "100", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.digitrec_kernel_mux_42_8_1_1_U171", "Parent" : "0"},
	{"ID" : "101", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.digitrec_kernel_mux_42_8_1_1_U172", "Parent" : "0"},
	{"ID" : "102", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.digitrec_kernel_mux_42_8_1_1_U173", "Parent" : "0"},
	{"ID" : "103", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.digitrec_kernel_mux_42_8_1_1_U174", "Parent" : "0"},
	{"ID" : "104", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.digitrec_kernel_mux_42_8_1_1_U175", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	digitrec_kernel {
		gmem {Type I LastRead 9 FirstWrite -1}
		gmem2 {Type O LastRead 3 FirstWrite 3}
		test_image {Type I LastRead 0 FirstWrite -1}
		train_images {Type I LastRead 0 FirstWrite -1}
		knn_mat {Type I LastRead 0 FirstWrite -1}}
	compute {
		test_image {Type I LastRead 0 FirstWrite -1}
		train_images_0 {Type I LastRead 1 FirstWrite -1}
		train_images_1 {Type I LastRead 1 FirstWrite -1}
		train_images_2 {Type I LastRead 1 FirstWrite -1}
		train_images_3 {Type I LastRead 1 FirstWrite -1}
		train_images_4 {Type I LastRead 1 FirstWrite -1}
		train_images_5 {Type I LastRead 1 FirstWrite -1}
		train_images_6 {Type I LastRead 1 FirstWrite -1}
		train_images_7 {Type I LastRead 1 FirstWrite -1}
		knn_mat_0_0_read {Type I LastRead 0 FirstWrite -1}
		knn_mat_0_1_read {Type I LastRead 0 FirstWrite -1}
		knn_mat_0_2_read {Type I LastRead 0 FirstWrite -1}
		knn_mat_0_3_read {Type I LastRead 0 FirstWrite -1}
		knn_mat_1_0_read {Type I LastRead 0 FirstWrite -1}
		knn_mat_1_1_read {Type I LastRead 0 FirstWrite -1}
		knn_mat_1_2_read {Type I LastRead 0 FirstWrite -1}
		knn_mat_1_3_read {Type I LastRead 0 FirstWrite -1}
		knn_mat_2_0_read {Type I LastRead 0 FirstWrite -1}
		knn_mat_2_1_read {Type I LastRead 0 FirstWrite -1}
		knn_mat_2_2_read {Type I LastRead 0 FirstWrite -1}
		knn_mat_2_3_read {Type I LastRead 0 FirstWrite -1}
		knn_mat_3_0_read {Type I LastRead 0 FirstWrite -1}
		knn_mat_3_1_read {Type I LastRead 0 FirstWrite -1}
		knn_mat_3_2_read {Type I LastRead 0 FirstWrite -1}
		knn_mat_3_3_read {Type I LastRead 0 FirstWrite -1}
		knn_mat_4_0_read {Type I LastRead 0 FirstWrite -1}
		knn_mat_4_1_read {Type I LastRead 0 FirstWrite -1}
		knn_mat_4_2_read {Type I LastRead 0 FirstWrite -1}
		knn_mat_4_3_read {Type I LastRead 0 FirstWrite -1}
		knn_mat_5_0_read {Type I LastRead 0 FirstWrite -1}
		knn_mat_5_1_read {Type I LastRead 0 FirstWrite -1}
		knn_mat_5_2_read {Type I LastRead 0 FirstWrite -1}
		knn_mat_5_3_read {Type I LastRead 0 FirstWrite -1}
		knn_mat_6_0_read {Type I LastRead 0 FirstWrite -1}
		knn_mat_6_1_read {Type I LastRead 0 FirstWrite -1}
		knn_mat_6_2_read {Type I LastRead 0 FirstWrite -1}
		knn_mat_7_0_read {Type I LastRead 0 FirstWrite -1}
		knn_mat_7_1_read {Type I LastRead 0 FirstWrite -1}
		knn_mat_7_2_read {Type I LastRead 0 FirstWrite -1}
		local_num_elements {Type I LastRead 0 FirstWrite -1}}
	update {
		temp_0 {Type I LastRead 2 FirstWrite -1}
		temp_1 {Type I LastRead 2 FirstWrite -1}
		temp_2 {Type I LastRead 2 FirstWrite -1}
		temp_3 {Type I LastRead 2 FirstWrite -1}
		temp_4 {Type I LastRead 2 FirstWrite -1}
		temp_5 {Type I LastRead 2 FirstWrite -1}
		temp_6 {Type I LastRead 2 FirstWrite -1}
		temp_7 {Type I LastRead 2 FirstWrite -1}
		knn_mat_0_0_read {Type I LastRead 0 FirstWrite -1}
		knn_mat_0_1_read {Type I LastRead 0 FirstWrite -1}
		knn_mat_0_2_read {Type I LastRead 0 FirstWrite -1}
		knn_mat_0_3_read {Type I LastRead 0 FirstWrite -1}
		knn_mat_1_0_read {Type I LastRead 0 FirstWrite -1}
		knn_mat_1_1_read {Type I LastRead 0 FirstWrite -1}
		knn_mat_1_2_read {Type I LastRead 0 FirstWrite -1}
		knn_mat_1_3_read {Type I LastRead 0 FirstWrite -1}
		knn_mat_2_0_read {Type I LastRead 0 FirstWrite -1}
		knn_mat_2_1_read {Type I LastRead 0 FirstWrite -1}
		knn_mat_2_2_read {Type I LastRead 0 FirstWrite -1}
		knn_mat_2_3_read {Type I LastRead 0 FirstWrite -1}
		knn_mat_3_0_read {Type I LastRead 0 FirstWrite -1}
		knn_mat_3_1_read {Type I LastRead 0 FirstWrite -1}
		knn_mat_3_2_read {Type I LastRead 0 FirstWrite -1}
		knn_mat_3_3_read {Type I LastRead 0 FirstWrite -1}
		knn_mat_4_0_read {Type I LastRead 0 FirstWrite -1}
		knn_mat_4_1_read {Type I LastRead 0 FirstWrite -1}
		knn_mat_4_2_read {Type I LastRead 0 FirstWrite -1}
		knn_mat_4_3_read {Type I LastRead 0 FirstWrite -1}
		knn_mat_5_0_read {Type I LastRead 0 FirstWrite -1}
		knn_mat_5_1_read {Type I LastRead 0 FirstWrite -1}
		knn_mat_5_2_read {Type I LastRead 0 FirstWrite -1}
		knn_mat_5_3_read {Type I LastRead 0 FirstWrite -1}
		knn_mat_6_0_read {Type I LastRead 0 FirstWrite -1}
		knn_mat_6_1_read {Type I LastRead 0 FirstWrite -1}
		knn_mat_6_2_read {Type I LastRead 0 FirstWrite -1}
		knn_mat_7_0_read {Type I LastRead 0 FirstWrite -1}
		knn_mat_7_1_read {Type I LastRead 0 FirstWrite -1}
		knn_mat_7_2_read {Type I LastRead 0 FirstWrite -1}}
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
		num_elem {Type I LastRead 1 FirstWrite -1}}
	load_unsigned_char_s {
		p_read {Type I LastRead 1 FirstWrite -1}
		p_read4 {Type I LastRead 1 FirstWrite -1}
		p_read8 {Type I LastRead 1 FirstWrite -1}
		p_read27 {Type I LastRead 1 FirstWrite -1}
		data_local {Type O LastRead 3 FirstWrite 3}
		data_local_offset {Type I LastRead 0 FirstWrite -1}
		data_local_offset1 {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "163863", "Max" : "2846623"}
	, {"Name" : "Interval", "Min" : "163864", "Max" : "2846624"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	gmem { m_axi {  { m_axi_gmem_AWVALID VALID 1 1 }  { m_axi_gmem_AWREADY READY 0 1 }  { m_axi_gmem_AWADDR ADDR 1 64 }  { m_axi_gmem_AWID ID 1 1 }  { m_axi_gmem_AWLEN LEN 1 8 }  { m_axi_gmem_AWSIZE SIZE 1 3 }  { m_axi_gmem_AWBURST BURST 1 2 }  { m_axi_gmem_AWLOCK LOCK 1 2 }  { m_axi_gmem_AWCACHE CACHE 1 4 }  { m_axi_gmem_AWPROT PROT 1 3 }  { m_axi_gmem_AWQOS QOS 1 4 }  { m_axi_gmem_AWREGION REGION 1 4 }  { m_axi_gmem_AWUSER USER 1 1 }  { m_axi_gmem_WVALID VALID 1 1 }  { m_axi_gmem_WREADY READY 0 1 }  { m_axi_gmem_WDATA DATA 1 64 }  { m_axi_gmem_WSTRB STRB 1 8 }  { m_axi_gmem_WLAST LAST 1 1 }  { m_axi_gmem_WID ID 1 1 }  { m_axi_gmem_WUSER USER 1 1 }  { m_axi_gmem_ARVALID VALID 1 1 }  { m_axi_gmem_ARREADY READY 0 1 }  { m_axi_gmem_ARADDR ADDR 1 64 }  { m_axi_gmem_ARID ID 1 1 }  { m_axi_gmem_ARLEN LEN 1 8 }  { m_axi_gmem_ARSIZE SIZE 1 3 }  { m_axi_gmem_ARBURST BURST 1 2 }  { m_axi_gmem_ARLOCK LOCK 1 2 }  { m_axi_gmem_ARCACHE CACHE 1 4 }  { m_axi_gmem_ARPROT PROT 1 3 }  { m_axi_gmem_ARQOS QOS 1 4 }  { m_axi_gmem_ARREGION REGION 1 4 }  { m_axi_gmem_ARUSER USER 1 1 }  { m_axi_gmem_RVALID VALID 0 1 }  { m_axi_gmem_RREADY READY 1 1 }  { m_axi_gmem_RDATA DATA 0 64 }  { m_axi_gmem_RLAST LAST 0 1 }  { m_axi_gmem_RID ID 0 1 }  { m_axi_gmem_RUSER USER 0 1 }  { m_axi_gmem_RRESP RESP 0 2 }  { m_axi_gmem_BVALID VALID 0 1 }  { m_axi_gmem_BREADY READY 1 1 }  { m_axi_gmem_BRESP RESP 0 2 }  { m_axi_gmem_BID ID 0 1 }  { m_axi_gmem_BUSER USER 0 1 } } }
	gmem2 { m_axi {  { m_axi_gmem2_AWVALID VALID 1 1 }  { m_axi_gmem2_AWREADY READY 0 1 }  { m_axi_gmem2_AWADDR ADDR 1 64 }  { m_axi_gmem2_AWID ID 1 1 }  { m_axi_gmem2_AWLEN LEN 1 8 }  { m_axi_gmem2_AWSIZE SIZE 1 3 }  { m_axi_gmem2_AWBURST BURST 1 2 }  { m_axi_gmem2_AWLOCK LOCK 1 2 }  { m_axi_gmem2_AWCACHE CACHE 1 4 }  { m_axi_gmem2_AWPROT PROT 1 3 }  { m_axi_gmem2_AWQOS QOS 1 4 }  { m_axi_gmem2_AWREGION REGION 1 4 }  { m_axi_gmem2_AWUSER USER 1 1 }  { m_axi_gmem2_WVALID VALID 1 1 }  { m_axi_gmem2_WREADY READY 0 1 }  { m_axi_gmem2_WDATA DATA 1 32 }  { m_axi_gmem2_WSTRB STRB 1 4 }  { m_axi_gmem2_WLAST LAST 1 1 }  { m_axi_gmem2_WID ID 1 1 }  { m_axi_gmem2_WUSER USER 1 1 }  { m_axi_gmem2_ARVALID VALID 1 1 }  { m_axi_gmem2_ARREADY READY 0 1 }  { m_axi_gmem2_ARADDR ADDR 1 64 }  { m_axi_gmem2_ARID ID 1 1 }  { m_axi_gmem2_ARLEN LEN 1 8 }  { m_axi_gmem2_ARSIZE SIZE 1 3 }  { m_axi_gmem2_ARBURST BURST 1 2 }  { m_axi_gmem2_ARLOCK LOCK 1 2 }  { m_axi_gmem2_ARCACHE CACHE 1 4 }  { m_axi_gmem2_ARPROT PROT 1 3 }  { m_axi_gmem2_ARQOS QOS 1 4 }  { m_axi_gmem2_ARREGION REGION 1 4 }  { m_axi_gmem2_ARUSER USER 1 1 }  { m_axi_gmem2_RVALID VALID 0 1 }  { m_axi_gmem2_RREADY READY 1 1 }  { m_axi_gmem2_RDATA DATA 0 32 }  { m_axi_gmem2_RLAST LAST 0 1 }  { m_axi_gmem2_RID ID 0 1 }  { m_axi_gmem2_RUSER USER 0 1 }  { m_axi_gmem2_RRESP RESP 0 2 }  { m_axi_gmem2_BVALID VALID 0 1 }  { m_axi_gmem2_BREADY READY 1 1 }  { m_axi_gmem2_BRESP RESP 0 2 }  { m_axi_gmem2_BID ID 0 1 }  { m_axi_gmem2_BUSER USER 0 1 } } }
}

set busDeadlockParameterList { 
	{ gmem { NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 16 } } \
	{ gmem2 { NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 16 } } \
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
	{ gmem 1 }
	{ gmem2 1 }
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
	{ gmem 1 }
	{ gmem2 1 }
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
