set moduleName update
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
set C_modelName {update}
set C_modelType { int 240 }
set C_modelArgList {
	{ temp_0 int 64 regular {array 225 { 1 3 } 1 1 }  }
	{ temp_1 int 64 regular {array 225 { 1 3 } 1 1 }  }
	{ temp_2 int 64 regular {array 225 { 1 3 } 1 1 }  }
	{ temp_3 int 64 regular {array 225 { 1 3 } 1 1 }  }
	{ temp_4 int 64 regular {array 225 { 1 3 } 1 1 }  }
	{ temp_5 int 64 regular {array 225 { 1 3 } 1 1 }  }
	{ temp_6 int 64 regular {array 225 { 1 3 } 1 1 }  }
	{ temp_7 int 64 regular {array 225 { 1 3 } 1 1 }  }
	{ knn_mat_0_0_read int 8 regular  }
	{ knn_mat_0_1_read int 8 regular  }
	{ knn_mat_0_2_read int 8 regular  }
	{ knn_mat_0_3_read int 8 regular  }
	{ knn_mat_1_0_read int 8 regular  }
	{ knn_mat_1_1_read int 8 regular  }
	{ knn_mat_1_2_read int 8 regular  }
	{ knn_mat_1_3_read int 8 regular  }
	{ knn_mat_2_0_read int 8 regular  }
	{ knn_mat_2_1_read int 8 regular  }
	{ knn_mat_2_2_read int 8 regular  }
	{ knn_mat_2_3_read int 8 regular  }
	{ knn_mat_3_0_read int 8 regular  }
	{ knn_mat_3_1_read int 8 regular  }
	{ knn_mat_3_2_read int 8 regular  }
	{ knn_mat_3_3_read int 8 regular  }
	{ knn_mat_4_0_read int 8 regular  }
	{ knn_mat_4_1_read int 8 regular  }
	{ knn_mat_4_2_read int 8 regular  }
	{ knn_mat_4_3_read int 8 regular  }
	{ knn_mat_5_0_read int 8 regular  }
	{ knn_mat_5_1_read int 8 regular  }
	{ knn_mat_5_2_read int 8 regular  }
	{ knn_mat_5_3_read int 8 regular  }
	{ knn_mat_6_0_read int 8 regular  }
	{ knn_mat_6_1_read int 8 regular  }
	{ knn_mat_6_2_read int 8 regular  }
	{ knn_mat_7_0_read int 8 regular  }
	{ knn_mat_7_1_read int 8 regular  }
	{ knn_mat_7_2_read int 8 regular  }
}
set C_modelArgMapList {[ 
	{ "Name" : "temp_0", "interface" : "memory", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "temp_1", "interface" : "memory", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "temp_2", "interface" : "memory", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "temp_3", "interface" : "memory", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "temp_4", "interface" : "memory", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "temp_5", "interface" : "memory", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "temp_6", "interface" : "memory", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "temp_7", "interface" : "memory", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "knn_mat_0_0_read", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "knn_mat_0_1_read", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "knn_mat_0_2_read", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "knn_mat_0_3_read", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "knn_mat_1_0_read", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "knn_mat_1_1_read", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "knn_mat_1_2_read", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "knn_mat_1_3_read", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "knn_mat_2_0_read", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "knn_mat_2_1_read", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "knn_mat_2_2_read", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "knn_mat_2_3_read", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "knn_mat_3_0_read", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "knn_mat_3_1_read", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "knn_mat_3_2_read", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "knn_mat_3_3_read", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "knn_mat_4_0_read", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "knn_mat_4_1_read", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "knn_mat_4_2_read", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "knn_mat_4_3_read", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "knn_mat_5_0_read", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "knn_mat_5_1_read", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "knn_mat_5_2_read", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "knn_mat_5_3_read", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "knn_mat_6_0_read", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "knn_mat_6_1_read", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "knn_mat_6_2_read", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "knn_mat_7_0_read", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "knn_mat_7_1_read", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "knn_mat_7_2_read", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 240} ]}
# RTL Port declarations: 
set portNum 90
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ temp_0_address0 sc_out sc_lv 8 signal 0 } 
	{ temp_0_ce0 sc_out sc_logic 1 signal 0 } 
	{ temp_0_q0 sc_in sc_lv 64 signal 0 } 
	{ temp_1_address0 sc_out sc_lv 8 signal 1 } 
	{ temp_1_ce0 sc_out sc_logic 1 signal 1 } 
	{ temp_1_q0 sc_in sc_lv 64 signal 1 } 
	{ temp_2_address0 sc_out sc_lv 8 signal 2 } 
	{ temp_2_ce0 sc_out sc_logic 1 signal 2 } 
	{ temp_2_q0 sc_in sc_lv 64 signal 2 } 
	{ temp_3_address0 sc_out sc_lv 8 signal 3 } 
	{ temp_3_ce0 sc_out sc_logic 1 signal 3 } 
	{ temp_3_q0 sc_in sc_lv 64 signal 3 } 
	{ temp_4_address0 sc_out sc_lv 8 signal 4 } 
	{ temp_4_ce0 sc_out sc_logic 1 signal 4 } 
	{ temp_4_q0 sc_in sc_lv 64 signal 4 } 
	{ temp_5_address0 sc_out sc_lv 8 signal 5 } 
	{ temp_5_ce0 sc_out sc_logic 1 signal 5 } 
	{ temp_5_q0 sc_in sc_lv 64 signal 5 } 
	{ temp_6_address0 sc_out sc_lv 8 signal 6 } 
	{ temp_6_ce0 sc_out sc_logic 1 signal 6 } 
	{ temp_6_q0 sc_in sc_lv 64 signal 6 } 
	{ temp_7_address0 sc_out sc_lv 8 signal 7 } 
	{ temp_7_ce0 sc_out sc_logic 1 signal 7 } 
	{ temp_7_q0 sc_in sc_lv 64 signal 7 } 
	{ knn_mat_0_0_read sc_in sc_lv 8 signal 8 } 
	{ knn_mat_0_1_read sc_in sc_lv 8 signal 9 } 
	{ knn_mat_0_2_read sc_in sc_lv 8 signal 10 } 
	{ knn_mat_0_3_read sc_in sc_lv 8 signal 11 } 
	{ knn_mat_1_0_read sc_in sc_lv 8 signal 12 } 
	{ knn_mat_1_1_read sc_in sc_lv 8 signal 13 } 
	{ knn_mat_1_2_read sc_in sc_lv 8 signal 14 } 
	{ knn_mat_1_3_read sc_in sc_lv 8 signal 15 } 
	{ knn_mat_2_0_read sc_in sc_lv 8 signal 16 } 
	{ knn_mat_2_1_read sc_in sc_lv 8 signal 17 } 
	{ knn_mat_2_2_read sc_in sc_lv 8 signal 18 } 
	{ knn_mat_2_3_read sc_in sc_lv 8 signal 19 } 
	{ knn_mat_3_0_read sc_in sc_lv 8 signal 20 } 
	{ knn_mat_3_1_read sc_in sc_lv 8 signal 21 } 
	{ knn_mat_3_2_read sc_in sc_lv 8 signal 22 } 
	{ knn_mat_3_3_read sc_in sc_lv 8 signal 23 } 
	{ knn_mat_4_0_read sc_in sc_lv 8 signal 24 } 
	{ knn_mat_4_1_read sc_in sc_lv 8 signal 25 } 
	{ knn_mat_4_2_read sc_in sc_lv 8 signal 26 } 
	{ knn_mat_4_3_read sc_in sc_lv 8 signal 27 } 
	{ knn_mat_5_0_read sc_in sc_lv 8 signal 28 } 
	{ knn_mat_5_1_read sc_in sc_lv 8 signal 29 } 
	{ knn_mat_5_2_read sc_in sc_lv 8 signal 30 } 
	{ knn_mat_5_3_read sc_in sc_lv 8 signal 31 } 
	{ knn_mat_6_0_read sc_in sc_lv 8 signal 32 } 
	{ knn_mat_6_1_read sc_in sc_lv 8 signal 33 } 
	{ knn_mat_6_2_read sc_in sc_lv 8 signal 34 } 
	{ knn_mat_7_0_read sc_in sc_lv 8 signal 35 } 
	{ knn_mat_7_1_read sc_in sc_lv 8 signal 36 } 
	{ knn_mat_7_2_read sc_in sc_lv 8 signal 37 } 
	{ ap_return_0 sc_out sc_lv 8 signal -1 } 
	{ ap_return_1 sc_out sc_lv 8 signal -1 } 
	{ ap_return_2 sc_out sc_lv 8 signal -1 } 
	{ ap_return_3 sc_out sc_lv 8 signal -1 } 
	{ ap_return_4 sc_out sc_lv 8 signal -1 } 
	{ ap_return_5 sc_out sc_lv 8 signal -1 } 
	{ ap_return_6 sc_out sc_lv 8 signal -1 } 
	{ ap_return_7 sc_out sc_lv 8 signal -1 } 
	{ ap_return_8 sc_out sc_lv 8 signal -1 } 
	{ ap_return_9 sc_out sc_lv 8 signal -1 } 
	{ ap_return_10 sc_out sc_lv 8 signal -1 } 
	{ ap_return_11 sc_out sc_lv 8 signal -1 } 
	{ ap_return_12 sc_out sc_lv 8 signal -1 } 
	{ ap_return_13 sc_out sc_lv 8 signal -1 } 
	{ ap_return_14 sc_out sc_lv 8 signal -1 } 
	{ ap_return_15 sc_out sc_lv 8 signal -1 } 
	{ ap_return_16 sc_out sc_lv 8 signal -1 } 
	{ ap_return_17 sc_out sc_lv 8 signal -1 } 
	{ ap_return_18 sc_out sc_lv 8 signal -1 } 
	{ ap_return_19 sc_out sc_lv 8 signal -1 } 
	{ ap_return_20 sc_out sc_lv 8 signal -1 } 
	{ ap_return_21 sc_out sc_lv 8 signal -1 } 
	{ ap_return_22 sc_out sc_lv 8 signal -1 } 
	{ ap_return_23 sc_out sc_lv 8 signal -1 } 
	{ ap_return_24 sc_out sc_lv 8 signal -1 } 
	{ ap_return_25 sc_out sc_lv 8 signal -1 } 
	{ ap_return_26 sc_out sc_lv 8 signal -1 } 
	{ ap_return_27 sc_out sc_lv 8 signal -1 } 
	{ ap_return_28 sc_out sc_lv 8 signal -1 } 
	{ ap_return_29 sc_out sc_lv 8 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "temp_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "temp_0", "role": "address0" }} , 
 	{ "name": "temp_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "temp_0", "role": "ce0" }} , 
 	{ "name": "temp_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "temp_0", "role": "q0" }} , 
 	{ "name": "temp_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "temp_1", "role": "address0" }} , 
 	{ "name": "temp_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "temp_1", "role": "ce0" }} , 
 	{ "name": "temp_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "temp_1", "role": "q0" }} , 
 	{ "name": "temp_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "temp_2", "role": "address0" }} , 
 	{ "name": "temp_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "temp_2", "role": "ce0" }} , 
 	{ "name": "temp_2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "temp_2", "role": "q0" }} , 
 	{ "name": "temp_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "temp_3", "role": "address0" }} , 
 	{ "name": "temp_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "temp_3", "role": "ce0" }} , 
 	{ "name": "temp_3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "temp_3", "role": "q0" }} , 
 	{ "name": "temp_4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "temp_4", "role": "address0" }} , 
 	{ "name": "temp_4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "temp_4", "role": "ce0" }} , 
 	{ "name": "temp_4_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "temp_4", "role": "q0" }} , 
 	{ "name": "temp_5_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "temp_5", "role": "address0" }} , 
 	{ "name": "temp_5_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "temp_5", "role": "ce0" }} , 
 	{ "name": "temp_5_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "temp_5", "role": "q0" }} , 
 	{ "name": "temp_6_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "temp_6", "role": "address0" }} , 
 	{ "name": "temp_6_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "temp_6", "role": "ce0" }} , 
 	{ "name": "temp_6_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "temp_6", "role": "q0" }} , 
 	{ "name": "temp_7_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "temp_7", "role": "address0" }} , 
 	{ "name": "temp_7_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "temp_7", "role": "ce0" }} , 
 	{ "name": "temp_7_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "temp_7", "role": "q0" }} , 
 	{ "name": "knn_mat_0_0_read", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "knn_mat_0_0_read", "role": "default" }} , 
 	{ "name": "knn_mat_0_1_read", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "knn_mat_0_1_read", "role": "default" }} , 
 	{ "name": "knn_mat_0_2_read", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "knn_mat_0_2_read", "role": "default" }} , 
 	{ "name": "knn_mat_0_3_read", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "knn_mat_0_3_read", "role": "default" }} , 
 	{ "name": "knn_mat_1_0_read", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "knn_mat_1_0_read", "role": "default" }} , 
 	{ "name": "knn_mat_1_1_read", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "knn_mat_1_1_read", "role": "default" }} , 
 	{ "name": "knn_mat_1_2_read", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "knn_mat_1_2_read", "role": "default" }} , 
 	{ "name": "knn_mat_1_3_read", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "knn_mat_1_3_read", "role": "default" }} , 
 	{ "name": "knn_mat_2_0_read", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "knn_mat_2_0_read", "role": "default" }} , 
 	{ "name": "knn_mat_2_1_read", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "knn_mat_2_1_read", "role": "default" }} , 
 	{ "name": "knn_mat_2_2_read", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "knn_mat_2_2_read", "role": "default" }} , 
 	{ "name": "knn_mat_2_3_read", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "knn_mat_2_3_read", "role": "default" }} , 
 	{ "name": "knn_mat_3_0_read", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "knn_mat_3_0_read", "role": "default" }} , 
 	{ "name": "knn_mat_3_1_read", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "knn_mat_3_1_read", "role": "default" }} , 
 	{ "name": "knn_mat_3_2_read", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "knn_mat_3_2_read", "role": "default" }} , 
 	{ "name": "knn_mat_3_3_read", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "knn_mat_3_3_read", "role": "default" }} , 
 	{ "name": "knn_mat_4_0_read", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "knn_mat_4_0_read", "role": "default" }} , 
 	{ "name": "knn_mat_4_1_read", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "knn_mat_4_1_read", "role": "default" }} , 
 	{ "name": "knn_mat_4_2_read", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "knn_mat_4_2_read", "role": "default" }} , 
 	{ "name": "knn_mat_4_3_read", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "knn_mat_4_3_read", "role": "default" }} , 
 	{ "name": "knn_mat_5_0_read", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "knn_mat_5_0_read", "role": "default" }} , 
 	{ "name": "knn_mat_5_1_read", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "knn_mat_5_1_read", "role": "default" }} , 
 	{ "name": "knn_mat_5_2_read", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "knn_mat_5_2_read", "role": "default" }} , 
 	{ "name": "knn_mat_5_3_read", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "knn_mat_5_3_read", "role": "default" }} , 
 	{ "name": "knn_mat_6_0_read", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "knn_mat_6_0_read", "role": "default" }} , 
 	{ "name": "knn_mat_6_1_read", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "knn_mat_6_1_read", "role": "default" }} , 
 	{ "name": "knn_mat_6_2_read", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "knn_mat_6_2_read", "role": "default" }} , 
 	{ "name": "knn_mat_7_0_read", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "knn_mat_7_0_read", "role": "default" }} , 
 	{ "name": "knn_mat_7_1_read", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "knn_mat_7_1_read", "role": "default" }} , 
 	{ "name": "knn_mat_7_2_read", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "knn_mat_7_2_read", "role": "default" }} , 
 	{ "name": "ap_return_0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "ap_return_0", "role": "default" }} , 
 	{ "name": "ap_return_1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "ap_return_1", "role": "default" }} , 
 	{ "name": "ap_return_2", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "ap_return_2", "role": "default" }} , 
 	{ "name": "ap_return_3", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "ap_return_3", "role": "default" }} , 
 	{ "name": "ap_return_4", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "ap_return_4", "role": "default" }} , 
 	{ "name": "ap_return_5", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "ap_return_5", "role": "default" }} , 
 	{ "name": "ap_return_6", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "ap_return_6", "role": "default" }} , 
 	{ "name": "ap_return_7", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "ap_return_7", "role": "default" }} , 
 	{ "name": "ap_return_8", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "ap_return_8", "role": "default" }} , 
 	{ "name": "ap_return_9", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "ap_return_9", "role": "default" }} , 
 	{ "name": "ap_return_10", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "ap_return_10", "role": "default" }} , 
 	{ "name": "ap_return_11", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "ap_return_11", "role": "default" }} , 
 	{ "name": "ap_return_12", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "ap_return_12", "role": "default" }} , 
 	{ "name": "ap_return_13", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "ap_return_13", "role": "default" }} , 
 	{ "name": "ap_return_14", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "ap_return_14", "role": "default" }} , 
 	{ "name": "ap_return_15", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "ap_return_15", "role": "default" }} , 
 	{ "name": "ap_return_16", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "ap_return_16", "role": "default" }} , 
 	{ "name": "ap_return_17", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "ap_return_17", "role": "default" }} , 
 	{ "name": "ap_return_18", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "ap_return_18", "role": "default" }} , 
 	{ "name": "ap_return_19", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "ap_return_19", "role": "default" }} , 
 	{ "name": "ap_return_20", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "ap_return_20", "role": "default" }} , 
 	{ "name": "ap_return_21", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "ap_return_21", "role": "default" }} , 
 	{ "name": "ap_return_22", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "ap_return_22", "role": "default" }} , 
 	{ "name": "ap_return_23", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "ap_return_23", "role": "default" }} , 
 	{ "name": "ap_return_24", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "ap_return_24", "role": "default" }} , 
 	{ "name": "ap_return_25", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "ap_return_25", "role": "default" }} , 
 	{ "name": "ap_return_26", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "ap_return_26", "role": "default" }} , 
 	{ "name": "ap_return_27", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "ap_return_27", "role": "default" }} , 
 	{ "name": "ap_return_28", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "ap_return_28", "role": "default" }} , 
 	{ "name": "ap_return_29", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "ap_return_29", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40"],
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
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.digitrec_kernel_mux_32_8_1_1_U13", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.digitrec_kernel_mux_42_8_1_1_U14", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.digitrec_kernel_mux_42_8_1_1_U15", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.digitrec_kernel_mux_42_8_1_1_U16", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.digitrec_kernel_mux_42_8_1_1_U17", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.digitrec_kernel_mux_42_8_1_1_U18", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.digitrec_kernel_mux_42_8_1_1_U19", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.digitrec_kernel_mux_32_8_1_1_U20", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.digitrec_kernel_mux_42_8_1_1_U21", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.digitrec_kernel_mux_832_64_1_1_U22", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.digitrec_kernel_mux_42_8_1_1_U23", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.digitrec_kernel_mux_42_8_1_1_U24", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.digitrec_kernel_mux_42_8_1_1_U25", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.digitrec_kernel_mux_42_8_1_1_U26", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.digitrec_kernel_mux_42_8_1_1_U27", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.digitrec_kernel_mux_42_8_1_1_U28", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.digitrec_kernel_mux_42_8_1_1_U29", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.digitrec_kernel_mux_42_8_1_1_U30", "Parent" : "0"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.digitrec_kernel_mux_42_8_1_1_U31", "Parent" : "0"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.digitrec_kernel_mux_42_8_1_1_U32", "Parent" : "0"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.digitrec_kernel_mux_42_8_1_1_U33", "Parent" : "0"},
	{"ID" : "22", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.digitrec_kernel_mux_42_8_1_1_U34", "Parent" : "0"},
	{"ID" : "23", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.digitrec_kernel_mux_42_8_1_1_U35", "Parent" : "0"},
	{"ID" : "24", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.digitrec_kernel_mux_42_8_1_1_U36", "Parent" : "0"},
	{"ID" : "25", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.digitrec_kernel_mux_42_8_1_1_U37", "Parent" : "0"},
	{"ID" : "26", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.digitrec_kernel_mux_42_8_1_1_U38", "Parent" : "0"},
	{"ID" : "27", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.digitrec_kernel_mux_42_8_1_1_U39", "Parent" : "0"},
	{"ID" : "28", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.digitrec_kernel_mux_42_8_1_1_U40", "Parent" : "0"},
	{"ID" : "29", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.digitrec_kernel_mux_42_8_1_1_U41", "Parent" : "0"},
	{"ID" : "30", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.digitrec_kernel_mux_42_8_1_1_U42", "Parent" : "0"},
	{"ID" : "31", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.digitrec_kernel_mux_42_8_1_1_U43", "Parent" : "0"},
	{"ID" : "32", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.digitrec_kernel_mux_42_8_1_1_U44", "Parent" : "0"},
	{"ID" : "33", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.digitrec_kernel_mux_42_8_1_1_U45", "Parent" : "0"},
	{"ID" : "34", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.digitrec_kernel_mux_42_8_1_1_U46", "Parent" : "0"},
	{"ID" : "35", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.digitrec_kernel_mux_42_8_1_1_U47", "Parent" : "0"},
	{"ID" : "36", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.digitrec_kernel_mux_42_8_1_1_U48", "Parent" : "0"},
	{"ID" : "37", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.digitrec_kernel_mux_42_8_1_1_U49", "Parent" : "0"},
	{"ID" : "38", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.digitrec_kernel_mux_42_8_1_1_U50", "Parent" : "0"},
	{"ID" : "39", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.digitrec_kernel_mux_42_8_1_1_U51", "Parent" : "0"},
	{"ID" : "40", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.digitrec_kernel_mux_42_8_1_1_U52", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
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
		knn_mat_7_2_read {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "16201", "Max" : "16201"}
	, {"Name" : "Interval", "Min" : "16201", "Max" : "16201"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	temp_0 { ap_memory {  { temp_0_address0 mem_address 1 8 }  { temp_0_ce0 mem_ce 1 1 }  { temp_0_q0 mem_dout 0 64 } } }
	temp_1 { ap_memory {  { temp_1_address0 mem_address 1 8 }  { temp_1_ce0 mem_ce 1 1 }  { temp_1_q0 mem_dout 0 64 } } }
	temp_2 { ap_memory {  { temp_2_address0 mem_address 1 8 }  { temp_2_ce0 mem_ce 1 1 }  { temp_2_q0 mem_dout 0 64 } } }
	temp_3 { ap_memory {  { temp_3_address0 mem_address 1 8 }  { temp_3_ce0 mem_ce 1 1 }  { temp_3_q0 mem_dout 0 64 } } }
	temp_4 { ap_memory {  { temp_4_address0 mem_address 1 8 }  { temp_4_ce0 mem_ce 1 1 }  { temp_4_q0 mem_dout 0 64 } } }
	temp_5 { ap_memory {  { temp_5_address0 mem_address 1 8 }  { temp_5_ce0 mem_ce 1 1 }  { temp_5_q0 mem_dout 0 64 } } }
	temp_6 { ap_memory {  { temp_6_address0 mem_address 1 8 }  { temp_6_ce0 mem_ce 1 1 }  { temp_6_q0 mem_dout 0 64 } } }
	temp_7 { ap_memory {  { temp_7_address0 mem_address 1 8 }  { temp_7_ce0 mem_ce 1 1 }  { temp_7_q0 mem_dout 0 64 } } }
	knn_mat_0_0_read { ap_none {  { knn_mat_0_0_read in_data 0 8 } } }
	knn_mat_0_1_read { ap_none {  { knn_mat_0_1_read in_data 0 8 } } }
	knn_mat_0_2_read { ap_none {  { knn_mat_0_2_read in_data 0 8 } } }
	knn_mat_0_3_read { ap_none {  { knn_mat_0_3_read in_data 0 8 } } }
	knn_mat_1_0_read { ap_none {  { knn_mat_1_0_read in_data 0 8 } } }
	knn_mat_1_1_read { ap_none {  { knn_mat_1_1_read in_data 0 8 } } }
	knn_mat_1_2_read { ap_none {  { knn_mat_1_2_read in_data 0 8 } } }
	knn_mat_1_3_read { ap_none {  { knn_mat_1_3_read in_data 0 8 } } }
	knn_mat_2_0_read { ap_none {  { knn_mat_2_0_read in_data 0 8 } } }
	knn_mat_2_1_read { ap_none {  { knn_mat_2_1_read in_data 0 8 } } }
	knn_mat_2_2_read { ap_none {  { knn_mat_2_2_read in_data 0 8 } } }
	knn_mat_2_3_read { ap_none {  { knn_mat_2_3_read in_data 0 8 } } }
	knn_mat_3_0_read { ap_none {  { knn_mat_3_0_read in_data 0 8 } } }
	knn_mat_3_1_read { ap_none {  { knn_mat_3_1_read in_data 0 8 } } }
	knn_mat_3_2_read { ap_none {  { knn_mat_3_2_read in_data 0 8 } } }
	knn_mat_3_3_read { ap_none {  { knn_mat_3_3_read in_data 0 8 } } }
	knn_mat_4_0_read { ap_none {  { knn_mat_4_0_read in_data 0 8 } } }
	knn_mat_4_1_read { ap_none {  { knn_mat_4_1_read in_data 0 8 } } }
	knn_mat_4_2_read { ap_none {  { knn_mat_4_2_read in_data 0 8 } } }
	knn_mat_4_3_read { ap_none {  { knn_mat_4_3_read in_data 0 8 } } }
	knn_mat_5_0_read { ap_none {  { knn_mat_5_0_read in_data 0 8 } } }
	knn_mat_5_1_read { ap_none {  { knn_mat_5_1_read in_data 0 8 } } }
	knn_mat_5_2_read { ap_none {  { knn_mat_5_2_read in_data 0 8 } } }
	knn_mat_5_3_read { ap_none {  { knn_mat_5_3_read in_data 0 8 } } }
	knn_mat_6_0_read { ap_none {  { knn_mat_6_0_read in_data 0 8 } } }
	knn_mat_6_1_read { ap_none {  { knn_mat_6_1_read in_data 0 8 } } }
	knn_mat_6_2_read { ap_none {  { knn_mat_6_2_read in_data 0 8 } } }
	knn_mat_7_0_read { ap_none {  { knn_mat_7_0_read in_data 0 8 } } }
	knn_mat_7_1_read { ap_none {  { knn_mat_7_1_read in_data 0 8 } } }
	knn_mat_7_2_read { ap_none {  { knn_mat_7_2_read in_data 0 8 } } }
}
