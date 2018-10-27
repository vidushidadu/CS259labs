# This script segment is generated automatically by AutoPilot

set id 96
set name digitrec_kernel_digitrec_kernel_mul_mul_11ns_7ns_17_1_1
set corename simcore_mul
set op mul
set stage_num 1
set max_latency -1
set registered_input 1
set in0_width 11
set in0_signed 0
set in1_width 7
set in1_signed 0
set out_width 17
set exp i0*i1
set arg_lists {i0 {11 0 +} i1 {7 0 +} p {17 0 +} acc {0} }
set TrueReset 0
if {${::AESL::PGuard_simmodel_gen}} {
if {[info proc ap_gen_simcore_mul] == "ap_gen_simcore_mul"} {
eval "ap_gen_simcore_mul { \
    id ${id} \
    name ${name} \
    corename ${corename} \
    op ${op} \
    reset_level 1 \
    sync_rst true \
    true_reset ${TrueReset} \
    stage_num ${stage_num} \
    max_latency ${max_latency} \
    registered_input ${registered_input} \
    in0_width ${in0_width} \
    in0_signed ${in0_signed} \
    in1_width ${in1_width} \
    in1_signed ${in1_signed} \
    out_width ${out_width} \
    exp ${exp} \
    arg_lists {${arg_lists}} \
}"
} else {
puts "@W \[IMPL-100\] Cannot find ap_gen_simcore_mul, check your AutoPilot builtin lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler ${name}
}


set op mul
set corename DSP48
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_dsp48] == "::AESL_LIB_VIRTEX::xil_gen_dsp48"} {
eval "::AESL_LIB_VIRTEX::xil_gen_dsp48 { \
    id ${id} \
    name ${name} \
    corename ${corename} \
    op ${op} \
    reset_level 1 \
    sync_rst true \
    true_reset ${TrueReset} \
    stage_num ${stage_num} \
    max_latency ${max_latency} \
    registered_input ${registered_input} \
    in0_width ${in0_width} \
    in0_signed ${in0_signed} \
    in1_width ${in1_width} \
    in1_signed ${in1_signed} \
    out_width ${out_width} \
    exp ${exp} \
    arg_lists {${arg_lists}} \
}"
} else {
puts "@W \[IMPL-101\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_dsp48, check your platform lib"
}
}


# Memory (RAM/ROM)  definition:
set ID 98
set hasByteEnable 0
set MemName digitrec_kernel_compute_local_temp_0
set CoreName ap_simcore_mem
set PortList { 2 3 }
set DataWd 64
set AddrRange 225
set AddrWd 8
set impl_style block
set TrueReset 0
set HasInitializer 0
set IsROM 0
set ROMData {}
set NumOfStage 2
set MaxLatency -1
set DelayBudget 1.158
set ClkPeriod 4
set RegisteredInput 0
if {${::AESL::PGuard_simmodel_gen}} {
if {[info proc ap_gen_simcore_mem] == "ap_gen_simcore_mem"} {
    eval "ap_gen_simcore_mem { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 2 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    style ${impl_style} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
} else {
    puts "@W \[IMPL-102\] Cannot find ap_gen_simcore_mem, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
  ::AP::rtl_comp_handler $MemName
}


set CoreName RAM
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_RAM] == "::AESL_LIB_VIRTEX::xil_gen_RAM"} {
    eval "::AESL_LIB_VIRTEX::xil_gen_RAM { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 2 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    style ${impl_style} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
  } else {
    puts "@W \[IMPL-104\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_RAM, check your platform lib"
  }
}


# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 100 \
    name train_images_0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename train_images_0 \
    op interface \
    ports { train_images_0_address0 { O 8 vector } train_images_0_ce0 { O 1 bit } train_images_0_q0 { I 64 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'train_images_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 101 \
    name train_images_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename train_images_1 \
    op interface \
    ports { train_images_1_address0 { O 8 vector } train_images_1_ce0 { O 1 bit } train_images_1_q0 { I 64 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'train_images_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 102 \
    name train_images_2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename train_images_2 \
    op interface \
    ports { train_images_2_address0 { O 8 vector } train_images_2_ce0 { O 1 bit } train_images_2_q0 { I 64 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'train_images_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 103 \
    name train_images_3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename train_images_3 \
    op interface \
    ports { train_images_3_address0 { O 8 vector } train_images_3_ce0 { O 1 bit } train_images_3_q0 { I 64 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'train_images_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 104 \
    name train_images_4 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename train_images_4 \
    op interface \
    ports { train_images_4_address0 { O 8 vector } train_images_4_ce0 { O 1 bit } train_images_4_q0 { I 64 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'train_images_4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 105 \
    name train_images_5 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename train_images_5 \
    op interface \
    ports { train_images_5_address0 { O 8 vector } train_images_5_ce0 { O 1 bit } train_images_5_q0 { I 64 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'train_images_5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 106 \
    name train_images_6 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename train_images_6 \
    op interface \
    ports { train_images_6_address0 { O 8 vector } train_images_6_ce0 { O 1 bit } train_images_6_q0 { I 64 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'train_images_6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 107 \
    name train_images_7 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename train_images_7 \
    op interface \
    ports { train_images_7_address0 { O 8 vector } train_images_7_ce0 { O 1 bit } train_images_7_q0 { I 64 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'train_images_7'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 99 \
    name test_image \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_test_image \
    op interface \
    ports { test_image { I 64 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 108 \
    name knn_mat_0_0_read \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_knn_mat_0_0_read \
    op interface \
    ports { knn_mat_0_0_read { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 109 \
    name knn_mat_0_1_read \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_knn_mat_0_1_read \
    op interface \
    ports { knn_mat_0_1_read { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 110 \
    name knn_mat_0_2_read \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_knn_mat_0_2_read \
    op interface \
    ports { knn_mat_0_2_read { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 111 \
    name knn_mat_0_3_read \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_knn_mat_0_3_read \
    op interface \
    ports { knn_mat_0_3_read { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 112 \
    name knn_mat_1_0_read \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_knn_mat_1_0_read \
    op interface \
    ports { knn_mat_1_0_read { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 113 \
    name knn_mat_1_1_read \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_knn_mat_1_1_read \
    op interface \
    ports { knn_mat_1_1_read { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 114 \
    name knn_mat_1_2_read \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_knn_mat_1_2_read \
    op interface \
    ports { knn_mat_1_2_read { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 115 \
    name knn_mat_1_3_read \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_knn_mat_1_3_read \
    op interface \
    ports { knn_mat_1_3_read { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 116 \
    name knn_mat_2_0_read \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_knn_mat_2_0_read \
    op interface \
    ports { knn_mat_2_0_read { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 117 \
    name knn_mat_2_1_read \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_knn_mat_2_1_read \
    op interface \
    ports { knn_mat_2_1_read { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 118 \
    name knn_mat_2_2_read \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_knn_mat_2_2_read \
    op interface \
    ports { knn_mat_2_2_read { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 119 \
    name knn_mat_2_3_read \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_knn_mat_2_3_read \
    op interface \
    ports { knn_mat_2_3_read { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 120 \
    name knn_mat_3_0_read \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_knn_mat_3_0_read \
    op interface \
    ports { knn_mat_3_0_read { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 121 \
    name knn_mat_3_1_read \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_knn_mat_3_1_read \
    op interface \
    ports { knn_mat_3_1_read { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 122 \
    name knn_mat_3_2_read \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_knn_mat_3_2_read \
    op interface \
    ports { knn_mat_3_2_read { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 123 \
    name knn_mat_3_3_read \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_knn_mat_3_3_read \
    op interface \
    ports { knn_mat_3_3_read { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 124 \
    name knn_mat_4_0_read \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_knn_mat_4_0_read \
    op interface \
    ports { knn_mat_4_0_read { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 125 \
    name knn_mat_4_1_read \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_knn_mat_4_1_read \
    op interface \
    ports { knn_mat_4_1_read { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 126 \
    name knn_mat_4_2_read \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_knn_mat_4_2_read \
    op interface \
    ports { knn_mat_4_2_read { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 127 \
    name knn_mat_4_3_read \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_knn_mat_4_3_read \
    op interface \
    ports { knn_mat_4_3_read { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 128 \
    name knn_mat_5_0_read \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_knn_mat_5_0_read \
    op interface \
    ports { knn_mat_5_0_read { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 129 \
    name knn_mat_5_1_read \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_knn_mat_5_1_read \
    op interface \
    ports { knn_mat_5_1_read { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 130 \
    name knn_mat_5_2_read \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_knn_mat_5_2_read \
    op interface \
    ports { knn_mat_5_2_read { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 131 \
    name knn_mat_5_3_read \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_knn_mat_5_3_read \
    op interface \
    ports { knn_mat_5_3_read { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 132 \
    name knn_mat_6_0_read \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_knn_mat_6_0_read \
    op interface \
    ports { knn_mat_6_0_read { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 133 \
    name knn_mat_6_1_read \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_knn_mat_6_1_read \
    op interface \
    ports { knn_mat_6_1_read { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 134 \
    name knn_mat_6_2_read \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_knn_mat_6_2_read \
    op interface \
    ports { knn_mat_6_2_read { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 135 \
    name knn_mat_7_0_read \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_knn_mat_7_0_read \
    op interface \
    ports { knn_mat_7_0_read { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 136 \
    name knn_mat_7_1_read \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_knn_mat_7_1_read \
    op interface \
    ports { knn_mat_7_1_read { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 137 \
    name knn_mat_7_2_read \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_knn_mat_7_2_read \
    op interface \
    ports { knn_mat_7_2_read { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 138 \
    name local_num_elements \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_local_num_elements \
    op interface \
    ports { local_num_elements { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -1 \
    name ap_ctrl \
    type ap_ctrl \
    reset_level 1 \
    sync_rst true \
    corename ap_ctrl \
    op interface \
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -2 \
    name ap_return \
    type ap_return \
    reset_level 1 \
    sync_rst true \
    corename ap_return \
    op interface \
    ports { ap_return { O 1 vector } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -3 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_clk \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-113\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}


# Adapter definition:
set PortName ap_rst
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -4 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_rst \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-114\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


