#!/bin/bash

cd $AWS_FPGA_REPO_DIR
source sdaccel_setup.sh
cd $SDACCEL_DIR/examples/xilinx/getting_started
cd cs-259-18f/hw2
#export $AWS_PLATFORM=xilinx_aws-vu9p-f1-04261818_dynamic_5_0
#make check TARGETS=sw_emu DEVICES=$AWS_PLATFORM all
make check TARGETS=sw_emu DEVICES=$AWS_PLATFORM all
#make TARGETS=sw_emu DEVICES=$AWS_PLATFORM all
#XCL_EMULATION_MODE=sw_emu DEVICES=$AWS_PLATFORM ./digitrec_host ./data
