#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /home/centos/src/project_data/aws-fpga/SDAccel/examples/xilinx_2018.2/getting_started/cs-259-18f/hw1/_x/dot_prod_kernel.hw_emu.xilinx_aws-vu9p-f1-04261818_dynamic_5_0/dot_prod_kernel/dot_prod_kernel/solution/.autopilot/db/a.g.bc ${1+"$@"}
