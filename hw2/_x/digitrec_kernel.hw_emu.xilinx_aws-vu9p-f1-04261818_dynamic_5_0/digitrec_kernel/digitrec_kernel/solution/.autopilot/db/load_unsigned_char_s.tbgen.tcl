set moduleName load_unsigned_char_s
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
set C_modelName {load<unsigned char>}
set C_modelType { void 0 }
set C_modelArgList {
	{ p_read int 8 regular  }
	{ p_read4 int 8 regular  }
	{ p_read8 int 8 regular  }
	{ p_read27 int 8 regular  }
	{ data_local int 8 regular {axi_master 1}  }
	{ data_local_offset int 64 regular  }
	{ data_local_offset1 int 5 regular  }
}
set C_modelArgMapList {[ 
	{ "Name" : "p_read", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "p_read4", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "p_read8", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "p_read27", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "data_local", "interface" : "axi_master", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "data_local_offset", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "data_local_offset1", "interface" : "wire", "bitwidth" : 5, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 57
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ p_read sc_in sc_lv 8 signal 0 } 
	{ p_read4 sc_in sc_lv 8 signal 1 } 
	{ p_read8 sc_in sc_lv 8 signal 2 } 
	{ p_read27 sc_in sc_lv 8 signal 3 } 
	{ m_axi_data_local_AWVALID sc_out sc_logic 1 signal 4 } 
	{ m_axi_data_local_AWREADY sc_in sc_logic 1 signal 4 } 
	{ m_axi_data_local_AWADDR sc_out sc_lv 64 signal 4 } 
	{ m_axi_data_local_AWID sc_out sc_lv 1 signal 4 } 
	{ m_axi_data_local_AWLEN sc_out sc_lv 32 signal 4 } 
	{ m_axi_data_local_AWSIZE sc_out sc_lv 3 signal 4 } 
	{ m_axi_data_local_AWBURST sc_out sc_lv 2 signal 4 } 
	{ m_axi_data_local_AWLOCK sc_out sc_lv 2 signal 4 } 
	{ m_axi_data_local_AWCACHE sc_out sc_lv 4 signal 4 } 
	{ m_axi_data_local_AWPROT sc_out sc_lv 3 signal 4 } 
	{ m_axi_data_local_AWQOS sc_out sc_lv 4 signal 4 } 
	{ m_axi_data_local_AWREGION sc_out sc_lv 4 signal 4 } 
	{ m_axi_data_local_AWUSER sc_out sc_lv 1 signal 4 } 
	{ m_axi_data_local_WVALID sc_out sc_logic 1 signal 4 } 
	{ m_axi_data_local_WREADY sc_in sc_logic 1 signal 4 } 
	{ m_axi_data_local_WDATA sc_out sc_lv 8 signal 4 } 
	{ m_axi_data_local_WSTRB sc_out sc_lv 1 signal 4 } 
	{ m_axi_data_local_WLAST sc_out sc_logic 1 signal 4 } 
	{ m_axi_data_local_WID sc_out sc_lv 1 signal 4 } 
	{ m_axi_data_local_WUSER sc_out sc_lv 1 signal 4 } 
	{ m_axi_data_local_ARVALID sc_out sc_logic 1 signal 4 } 
	{ m_axi_data_local_ARREADY sc_in sc_logic 1 signal 4 } 
	{ m_axi_data_local_ARADDR sc_out sc_lv 64 signal 4 } 
	{ m_axi_data_local_ARID sc_out sc_lv 1 signal 4 } 
	{ m_axi_data_local_ARLEN sc_out sc_lv 32 signal 4 } 
	{ m_axi_data_local_ARSIZE sc_out sc_lv 3 signal 4 } 
	{ m_axi_data_local_ARBURST sc_out sc_lv 2 signal 4 } 
	{ m_axi_data_local_ARLOCK sc_out sc_lv 2 signal 4 } 
	{ m_axi_data_local_ARCACHE sc_out sc_lv 4 signal 4 } 
	{ m_axi_data_local_ARPROT sc_out sc_lv 3 signal 4 } 
	{ m_axi_data_local_ARQOS sc_out sc_lv 4 signal 4 } 
	{ m_axi_data_local_ARREGION sc_out sc_lv 4 signal 4 } 
	{ m_axi_data_local_ARUSER sc_out sc_lv 1 signal 4 } 
	{ m_axi_data_local_RVALID sc_in sc_logic 1 signal 4 } 
	{ m_axi_data_local_RREADY sc_out sc_logic 1 signal 4 } 
	{ m_axi_data_local_RDATA sc_in sc_lv 8 signal 4 } 
	{ m_axi_data_local_RLAST sc_in sc_logic 1 signal 4 } 
	{ m_axi_data_local_RID sc_in sc_lv 1 signal 4 } 
	{ m_axi_data_local_RUSER sc_in sc_lv 1 signal 4 } 
	{ m_axi_data_local_RRESP sc_in sc_lv 2 signal 4 } 
	{ m_axi_data_local_BVALID sc_in sc_logic 1 signal 4 } 
	{ m_axi_data_local_BREADY sc_out sc_logic 1 signal 4 } 
	{ m_axi_data_local_BRESP sc_in sc_lv 2 signal 4 } 
	{ m_axi_data_local_BID sc_in sc_lv 1 signal 4 } 
	{ m_axi_data_local_BUSER sc_in sc_lv 1 signal 4 } 
	{ data_local_offset sc_in sc_lv 64 signal 5 } 
	{ data_local_offset1 sc_in sc_lv 5 signal 6 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "p_read", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "p_read", "role": "default" }} , 
 	{ "name": "p_read4", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "p_read4", "role": "default" }} , 
 	{ "name": "p_read8", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "p_read8", "role": "default" }} , 
 	{ "name": "p_read27", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "p_read27", "role": "default" }} , 
 	{ "name": "m_axi_data_local_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data_local", "role": "AWVALID" }} , 
 	{ "name": "m_axi_data_local_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data_local", "role": "AWREADY" }} , 
 	{ "name": "m_axi_data_local_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "data_local", "role": "AWADDR" }} , 
 	{ "name": "m_axi_data_local_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "data_local", "role": "AWID" }} , 
 	{ "name": "m_axi_data_local_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "data_local", "role": "AWLEN" }} , 
 	{ "name": "m_axi_data_local_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "data_local", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_data_local_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "data_local", "role": "AWBURST" }} , 
 	{ "name": "m_axi_data_local_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "data_local", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_data_local_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "data_local", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_data_local_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "data_local", "role": "AWPROT" }} , 
 	{ "name": "m_axi_data_local_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "data_local", "role": "AWQOS" }} , 
 	{ "name": "m_axi_data_local_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "data_local", "role": "AWREGION" }} , 
 	{ "name": "m_axi_data_local_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "data_local", "role": "AWUSER" }} , 
 	{ "name": "m_axi_data_local_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data_local", "role": "WVALID" }} , 
 	{ "name": "m_axi_data_local_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data_local", "role": "WREADY" }} , 
 	{ "name": "m_axi_data_local_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "data_local", "role": "WDATA" }} , 
 	{ "name": "m_axi_data_local_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "data_local", "role": "WSTRB" }} , 
 	{ "name": "m_axi_data_local_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data_local", "role": "WLAST" }} , 
 	{ "name": "m_axi_data_local_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "data_local", "role": "WID" }} , 
 	{ "name": "m_axi_data_local_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "data_local", "role": "WUSER" }} , 
 	{ "name": "m_axi_data_local_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data_local", "role": "ARVALID" }} , 
 	{ "name": "m_axi_data_local_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data_local", "role": "ARREADY" }} , 
 	{ "name": "m_axi_data_local_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "data_local", "role": "ARADDR" }} , 
 	{ "name": "m_axi_data_local_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "data_local", "role": "ARID" }} , 
 	{ "name": "m_axi_data_local_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "data_local", "role": "ARLEN" }} , 
 	{ "name": "m_axi_data_local_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "data_local", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_data_local_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "data_local", "role": "ARBURST" }} , 
 	{ "name": "m_axi_data_local_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "data_local", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_data_local_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "data_local", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_data_local_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "data_local", "role": "ARPROT" }} , 
 	{ "name": "m_axi_data_local_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "data_local", "role": "ARQOS" }} , 
 	{ "name": "m_axi_data_local_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "data_local", "role": "ARREGION" }} , 
 	{ "name": "m_axi_data_local_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "data_local", "role": "ARUSER" }} , 
 	{ "name": "m_axi_data_local_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data_local", "role": "RVALID" }} , 
 	{ "name": "m_axi_data_local_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data_local", "role": "RREADY" }} , 
 	{ "name": "m_axi_data_local_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "data_local", "role": "RDATA" }} , 
 	{ "name": "m_axi_data_local_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data_local", "role": "RLAST" }} , 
 	{ "name": "m_axi_data_local_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "data_local", "role": "RID" }} , 
 	{ "name": "m_axi_data_local_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "data_local", "role": "RUSER" }} , 
 	{ "name": "m_axi_data_local_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "data_local", "role": "RRESP" }} , 
 	{ "name": "m_axi_data_local_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data_local", "role": "BVALID" }} , 
 	{ "name": "m_axi_data_local_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data_local", "role": "BREADY" }} , 
 	{ "name": "m_axi_data_local_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "data_local", "role": "BRESP" }} , 
 	{ "name": "m_axi_data_local_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "data_local", "role": "BID" }} , 
 	{ "name": "m_axi_data_local_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "data_local", "role": "BUSER" }} , 
 	{ "name": "data_local_offset", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "data_local_offset", "role": "default" }} , 
 	{ "name": "data_local_offset1", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "data_local_offset1", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
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
			{"Name" : "data_local_offset1", "Type" : "None", "Direction" : "I"}]}]}


set ArgLastReadFirstWriteLatency {
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
	{"Name" : "Latency", "Min" : "10", "Max" : "10"}
	, {"Name" : "Interval", "Min" : "10", "Max" : "10"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	p_read { ap_none {  { p_read in_data 0 8 } } }
	p_read4 { ap_none {  { p_read4 in_data 0 8 } } }
	p_read8 { ap_none {  { p_read8 in_data 0 8 } } }
	p_read27 { ap_none {  { p_read27 in_data 0 8 } } }
	data_local { m_axi {  { m_axi_data_local_AWVALID VALID 1 1 }  { m_axi_data_local_AWREADY READY 0 1 }  { m_axi_data_local_AWADDR ADDR 1 64 }  { m_axi_data_local_AWID ID 1 1 }  { m_axi_data_local_AWLEN LEN 1 32 }  { m_axi_data_local_AWSIZE SIZE 1 3 }  { m_axi_data_local_AWBURST BURST 1 2 }  { m_axi_data_local_AWLOCK LOCK 1 2 }  { m_axi_data_local_AWCACHE CACHE 1 4 }  { m_axi_data_local_AWPROT PROT 1 3 }  { m_axi_data_local_AWQOS QOS 1 4 }  { m_axi_data_local_AWREGION REGION 1 4 }  { m_axi_data_local_AWUSER USER 1 1 }  { m_axi_data_local_WVALID VALID 1 1 }  { m_axi_data_local_WREADY READY 0 1 }  { m_axi_data_local_WDATA DATA 1 8 }  { m_axi_data_local_WSTRB STRB 1 1 }  { m_axi_data_local_WLAST LAST 1 1 }  { m_axi_data_local_WID ID 1 1 }  { m_axi_data_local_WUSER USER 1 1 }  { m_axi_data_local_ARVALID VALID 1 1 }  { m_axi_data_local_ARREADY READY 0 1 }  { m_axi_data_local_ARADDR ADDR 1 64 }  { m_axi_data_local_ARID ID 1 1 }  { m_axi_data_local_ARLEN LEN 1 32 }  { m_axi_data_local_ARSIZE SIZE 1 3 }  { m_axi_data_local_ARBURST BURST 1 2 }  { m_axi_data_local_ARLOCK LOCK 1 2 }  { m_axi_data_local_ARCACHE CACHE 1 4 }  { m_axi_data_local_ARPROT PROT 1 3 }  { m_axi_data_local_ARQOS QOS 1 4 }  { m_axi_data_local_ARREGION REGION 1 4 }  { m_axi_data_local_ARUSER USER 1 1 }  { m_axi_data_local_RVALID VALID 0 1 }  { m_axi_data_local_RREADY READY 1 1 }  { m_axi_data_local_RDATA DATA 0 8 }  { m_axi_data_local_RLAST LAST 0 1 }  { m_axi_data_local_RID ID 0 1 }  { m_axi_data_local_RUSER USER 0 1 }  { m_axi_data_local_RRESP RESP 0 2 }  { m_axi_data_local_BVALID VALID 0 1 }  { m_axi_data_local_BREADY READY 1 1 }  { m_axi_data_local_BRESP RESP 0 2 }  { m_axi_data_local_BID ID 0 1 }  { m_axi_data_local_BUSER USER 0 1 } } }
	data_local_offset { ap_none {  { data_local_offset in_data 0 64 } } }
	data_local_offset1 { ap_none {  { data_local_offset1 in_data 0 5 } } }
}
