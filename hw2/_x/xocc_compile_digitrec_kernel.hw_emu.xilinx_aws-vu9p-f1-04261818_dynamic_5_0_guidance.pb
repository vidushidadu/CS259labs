
�
Kxocc_compile_digitrec_kernel.hw_emu.xilinx_aws-vu9p-f1-04261818_dynamic_5_0$937d033c-17ba-4c48-968f-d26561578d88�xocc  -c --xp param:compiler.preserveHlsOutput=1 --xp param:compiler.generateExtraRunData=true -s -k digitrec_kernel -o xclbin/digitrec_kernel.hw_emu.xilinx_aws-vu9p-f1-04261818_dynamic_5_0.xo -t hw_emu --platform /home/centos/src/project_data/aws-fpga/SDAccel/aws_platform/xilinx_aws-vu9p-f1-04261818_dynamic_5_0/xilinx_aws-vu9p-f1-04261818_dynamic_5_0.xpfm ./digitrec.cpp --xp param:compiler.useHlsGpp=1 *�"�/home/centos/src/project_data/aws-fpga/SDAccel/examples/xilinx_2018.2/getting_started/cs-259-18f/hw2/_x/reports/digitrec_kernel.hw_emu.xilinx_aws-vu9p-f1-04261818_dynamic_5_0/xocc_compile_digitrec_kernel.hw_emu.xilinx_aws-vu9p-f1-04261818_dynamic_5_0_guidance.html2�"�/home/centos/src/project_data/aws-fpga/SDAccel/examples/xilinx_2018.2/getting_started/cs-259-18f/hw2/_x/xocc_compile_digitrec_kernel.hw_emu.xilinx_aws-vu9p-f1-04261818_dynamic_5_0_guidance.pb*�e
��HLS_WARNING"�
�
Vivado HLS User Guide (UG902)f"bwww.xilinx.com/support/documentation/sw_manuals/xilinx2017_4/ug902-vivado-high-level-synthesis.pdfJ�
�Inferring multiple bus burst read of variable length on port 'data_dram' (/home/centos/src/project_data/aws-fpga/SDAccel/examples/xilinx_2018.2/getting_started/cs-259-18f/hw2/digitrec.cpp:24:2). These data requests might be further partitioned to multiple requests during RTL generation, based on max_read_burst_length or max_write_burst_length settings.
�
�2�Inferring multiple bus burst read of variable length on port 'data_dram' (/home/centos/src/project_data/aws-fpga/SDAccel/examples/xilinx_2018.2/getting_started/cs-259-18f/hw2/digitrec.cpp:24:2). These data requests might be further partitioned to multiple requests during RTL generation, based on max_read_burst_length or max_write_burst_length settings.
R�
Please consult the !URI%1!�
��
Vivado HLS User Guide (UG902)f"bwww.xilinx.com/support/documentation/sw_manuals/xilinx2017_4/ug902-vivado-high-level-synthesis.pdf
��HLS_WARNING"�
�
Vivado HLS User Guide (UG902)f"bwww.xilinx.com/support/documentation/sw_manuals/xilinx2017_4/ug902-vivado-high-level-synthesis.pdfJ�
HOnly 0 loops out of a total 2 loops have been pipelined in this design.
L
J2HOnly 0 loops out of a total 2 loops have been pipelined in this design.
R�
Please consult the !URI%1!�
��
Vivado HLS User Guide (UG902)f"bwww.xilinx.com/support/documentation/sw_manuals/xilinx2017_4/ug902-vivado-high-level-synthesis.pdf
��HLS_WARNING"�
�
Vivado HLS User Guide (UG902)f"bwww.xilinx.com/support/documentation/sw_manuals/xilinx2017_4/ug902-vivado-high-level-synthesis.pdfJ�
�Unable to enforce a carried dependence constraint (II = 1, distance = 1, offset = 1)
   between 'store' operation (/home/centos/src/project_data/aws-fpga/SDAccel/examples/xilinx_2018.2/getting_started/cs-259-18f/hw2/digitrec.cpp:97) of variable 'tmp_13', /home/centos/src/project_data/aws-fpga/SDAccel/examples/xilinx_2018.2/getting_started/cs-259-18f/hw2/digitrec.cpp:97 on array 'dis[0]', /home/centos/src/project_data/aws-fpga/SDAccel/examples/xilinx_2018.2/getting_started/cs-259-18f/hw2/digitrec.cpp:82 and 'load' operation ('dis_0_load', /home/centos/src/project_data/aws-fpga/SDAccel/examples/xilinx_2018.2/getting_started/cs-259-18f/hw2/digitrec.cpp:97) on array 'dis[0]', /home/centos/src/project_data/aws-fpga/SDAccel/examples/xilinx_2018.2/getting_started/cs-259-18f/hw2/digitrec.cpp:82.
�
�2�Unable to enforce a carried dependence constraint (II = 1, distance = 1, offset = 1)
   between 'store' operation (/home/centos/src/project_data/aws-fpga/SDAccel/examples/xilinx_2018.2/getting_started/cs-259-18f/hw2/digitrec.cpp:97) of variable 'tmp_13', /home/centos/src/project_data/aws-fpga/SDAccel/examples/xilinx_2018.2/getting_started/cs-259-18f/hw2/digitrec.cpp:97 on array 'dis[0]', /home/centos/src/project_data/aws-fpga/SDAccel/examples/xilinx_2018.2/getting_started/cs-259-18f/hw2/digitrec.cpp:82 and 'load' operation ('dis_0_load', /home/centos/src/project_data/aws-fpga/SDAccel/examples/xilinx_2018.2/getting_started/cs-259-18f/hw2/digitrec.cpp:97) on array 'dis[0]', /home/centos/src/project_data/aws-fpga/SDAccel/examples/xilinx_2018.2/getting_started/cs-259-18f/hw2/digitrec.cpp:82.
R�
Please consult the !URI%1!�
��
Vivado HLS User Guide (UG902)f"bwww.xilinx.com/support/documentation/sw_manuals/xilinx2017_4/ug902-vivado-high-level-synthesis.pdf
��HLS_WARNING"�
�
Vivado HLS User Guide (UG902)f"bwww.xilinx.com/support/documentation/sw_manuals/xilinx2017_4/ug902-vivado-high-level-synthesis.pdfJ�
�Unable to enforce a carried dependence constraint (II = 2, distance = 1, offset = 1)
   between 'store' operation (/home/centos/src/project_data/aws-fpga/SDAccel/examples/xilinx_2018.2/getting_started/cs-259-18f/hw2/digitrec.cpp:97) of variable 'tmp_13', /home/centos/src/project_data/aws-fpga/SDAccel/examples/xilinx_2018.2/getting_started/cs-259-18f/hw2/digitrec.cpp:97 on array 'dis[0]', /home/centos/src/project_data/aws-fpga/SDAccel/examples/xilinx_2018.2/getting_started/cs-259-18f/hw2/digitrec.cpp:82 and 'load' operation ('dis_0_load', /home/centos/src/project_data/aws-fpga/SDAccel/examples/xilinx_2018.2/getting_started/cs-259-18f/hw2/digitrec.cpp:97) on array 'dis[0]', /home/centos/src/project_data/aws-fpga/SDAccel/examples/xilinx_2018.2/getting_started/cs-259-18f/hw2/digitrec.cpp:82.
�
�2�Unable to enforce a carried dependence constraint (II = 2, distance = 1, offset = 1)
   between 'store' operation (/home/centos/src/project_data/aws-fpga/SDAccel/examples/xilinx_2018.2/getting_started/cs-259-18f/hw2/digitrec.cpp:97) of variable 'tmp_13', /home/centos/src/project_data/aws-fpga/SDAccel/examples/xilinx_2018.2/getting_started/cs-259-18f/hw2/digitrec.cpp:97 on array 'dis[0]', /home/centos/src/project_data/aws-fpga/SDAccel/examples/xilinx_2018.2/getting_started/cs-259-18f/hw2/digitrec.cpp:82 and 'load' operation ('dis_0_load', /home/centos/src/project_data/aws-fpga/SDAccel/examples/xilinx_2018.2/getting_started/cs-259-18f/hw2/digitrec.cpp:97) on array 'dis[0]', /home/centos/src/project_data/aws-fpga/SDAccel/examples/xilinx_2018.2/getting_started/cs-259-18f/hw2/digitrec.cpp:82.
R�
Please consult the !URI%1!�
��
Vivado HLS User Guide (UG902)f"bwww.xilinx.com/support/documentation/sw_manuals/xilinx2017_4/ug902-vivado-high-level-synthesis.pdf
��HLS_WARNING"�
�
Vivado HLS User Guide (UG902)f"bwww.xilinx.com/support/documentation/sw_manuals/xilinx2017_4/ug902-vivado-high-level-synthesis.pdfJ�
xLoop - Loop 2 has an initiation interval that is equal to the pipeline depth (1) - this results in an unpipelined loop.
|
z2xLoop - Loop 2 has an initiation interval that is equal to the pipeline depth (1) - this results in an unpipelined loop.
R�
Please consult the !URI%1!�
��
Vivado HLS User Guide (UG902)f"bwww.xilinx.com/support/documentation/sw_manuals/xilinx2017_4/ug902-vivado-high-level-synthesis.pdf
�	�	HLS_WARNING"�
�
Vivado HLS User Guide (UG902)f"bwww.xilinx.com/support/documentation/sw_manuals/xilinx2017_4/ug902-vivado-high-level-synthesis.pdfJ�
wLoop - dis_L has an initiation interval that is equal to the pipeline depth (3) - this results in an unpipelined loop.
{
y2wLoop - dis_L has an initiation interval that is equal to the pipeline depth (3) - this results in an unpipelined loop.
R�
Please consult the !URI%1!�
��
Vivado HLS User Guide (UG902)f"bwww.xilinx.com/support/documentation/sw_manuals/xilinx2017_4/ug902-vivado-high-level-synthesis.pdf
�
�
HLS_WARNING"�
�
Vivado HLS User Guide (UG902)f"bwww.xilinx.com/support/documentation/sw_manuals/xilinx2017_4/ug902-vivado-high-level-synthesis.pdfJ�
xLoop - Loop 2 has an initiation interval that is equal to the pipeline depth (1) - this results in an unpipelined loop.
|
z2xLoop - Loop 2 has an initiation interval that is equal to the pipeline depth (1) - this results in an unpipelined loop.
R�
Please consult the !URI%1!�
��
Vivado HLS User Guide (UG902)f"bwww.xilinx.com/support/documentation/sw_manuals/xilinx2017_4/ug902-vivado-high-level-synthesis.pdf
��HLS_WARNING"�
�
Vivado HLS User Guide (UG902)f"bwww.xilinx.com/support/documentation/sw_manuals/xilinx2017_4/ug902-vivado-high-level-synthesis.pdfJ�
wLoop - dis_L has an initiation interval that is equal to the pipeline depth (3) - this results in an unpipelined loop.
{
y2wLoop - dis_L has an initiation interval that is equal to the pipeline depth (3) - this results in an unpipelined loop.
R�
Please consult the !URI%1!�
��
Vivado HLS User Guide (UG902)f"bwww.xilinx.com/support/documentation/sw_manuals/xilinx2017_4/ug902-vivado-high-level-synthesis.pdf
��HLS_WARNING"�
�
Vivado HLS User Guide (UG902)f"bwww.xilinx.com/support/documentation/sw_manuals/xilinx2017_4/ug902-vivado-high-level-synthesis.pdfJ�
xLoop - Loop 2 has an initiation interval that is equal to the pipeline depth (1) - this results in an unpipelined loop.
|
z2xLoop - Loop 2 has an initiation interval that is equal to the pipeline depth (1) - this results in an unpipelined loop.
R�
Please consult the !URI%1!�
��
Vivado HLS User Guide (UG902)f"bwww.xilinx.com/support/documentation/sw_manuals/xilinx2017_4/ug902-vivado-high-level-synthesis.pdf
��HLS_WARNING"�
�
Vivado HLS User Guide (UG902)f"bwww.xilinx.com/support/documentation/sw_manuals/xilinx2017_4/ug902-vivado-high-level-synthesis.pdfJ�
wLoop - dis_L has an initiation interval that is equal to the pipeline depth (3) - this results in an unpipelined loop.
{
y2wLoop - dis_L has an initiation interval that is equal to the pipeline depth (3) - this results in an unpipelined loop.
R�
Please consult the !URI%1!�
��
Vivado HLS User Guide (UG902)f"bwww.xilinx.com/support/documentation/sw_manuals/xilinx2017_4/ug902-vivado-high-level-synthesis.pdf
��HLS_WARNING"�
�
Vivado HLS User Guide (UG902)f"bwww.xilinx.com/support/documentation/sw_manuals/xilinx2017_4/ug902-vivado-high-level-synthesis.pdfJ�
xLoop - Loop 2 has an initiation interval that is equal to the pipeline depth (1) - this results in an unpipelined loop.
|
z2xLoop - Loop 2 has an initiation interval that is equal to the pipeline depth (1) - this results in an unpipelined loop.
R�
Please consult the !URI%1!�
��
Vivado HLS User Guide (UG902)f"bwww.xilinx.com/support/documentation/sw_manuals/xilinx2017_4/ug902-vivado-high-level-synthesis.pdf
��HLS_WARNING"�
�
Vivado HLS User Guide (UG902)f"bwww.xilinx.com/support/documentation/sw_manuals/xilinx2017_4/ug902-vivado-high-level-synthesis.pdfJ�
wLoop - dis_L has an initiation interval that is equal to the pipeline depth (3) - this results in an unpipelined loop.
{
y2wLoop - dis_L has an initiation interval that is equal to the pipeline depth (3) - this results in an unpipelined loop.
R�
Please consult the !URI%1!�
��
Vivado HLS User Guide (UG902)f"bwww.xilinx.com/support/documentation/sw_manuals/xilinx2017_4/ug902-vivado-high-level-synthesis.pdf
��HLS_WARNING"�
�
Vivado HLS User Guide (UG902)f"bwww.xilinx.com/support/documentation/sw_manuals/xilinx2017_4/ug902-vivado-high-level-synthesis.pdfJ�
�Cannot unroll loop 'Loop-3.1' (/home/centos/src/project_data/aws-fpga/SDAccel/examples/xilinx_2018.2/getting_started/cs-259-18f/hw2/digitrec.cpp:94) in function 'compute': cannot completely unroll a loop with a variable trip count.
�
�2�Cannot unroll loop 'Loop-3.1' (/home/centos/src/project_data/aws-fpga/SDAccel/examples/xilinx_2018.2/getting_started/cs-259-18f/hw2/digitrec.cpp:94) in function 'compute': cannot completely unroll a loop with a variable trip count.
R�
Please consult the !URI%1!�
��
Vivado HLS User Guide (UG902)f"bwww.xilinx.com/support/documentation/sw_manuals/xilinx2017_4/ug902-vivado-high-level-synthesis.pdf
��HLS_WARNING"�
�
Vivado HLS User Guide (UG902)f"bwww.xilinx.com/support/documentation/sw_manuals/xilinx2017_4/ug902-vivado-high-level-synthesis.pdfJ�
�Cannot flatten a loop nest 'Loop-1' (/home/centos/src/project_data/aws-fpga/SDAccel/examples/xilinx_2018.2/getting_started/cs-259-18f/hw2/digitrec.cpp:40:17) in function 'update' : 

the outer loop is not a perfect loop because there is nontrivial logic before entering the inner loop.
�
�2�Cannot flatten a loop nest 'Loop-1' (/home/centos/src/project_data/aws-fpga/SDAccel/examples/xilinx_2018.2/getting_started/cs-259-18f/hw2/digitrec.cpp:40:17) in function 'update' : 

the outer loop is not a perfect loop because there is nontrivial logic before entering the inner loop.
R�
Please consult the !URI%1!�
��
Vivado HLS User Guide (UG902)f"bwww.xilinx.com/support/documentation/sw_manuals/xilinx2017_4/ug902-vivado-high-level-synthesis.pdf
��HLS_WARNING"�
�
Vivado HLS User Guide (UG902)f"bwww.xilinx.com/support/documentation/sw_manuals/xilinx2017_4/ug902-vivado-high-level-synthesis.pdfJ�
�Inferring multiple bus burst write of a total cumulative length 3 on port 'data_local' (/home/centos/src/project_data/aws-fpga/SDAccel/examples/xilinx_2018.2/getting_started/cs-259-18f/hw2/digitrec.cpp:24:2). These data requests might be further partitioned to multiple requests during RTL generation, based on max_read_burst_length or max_write_burst_length settings.
�
�2�Inferring multiple bus burst write of a total cumulative length 3 on port 'data_local' (/home/centos/src/project_data/aws-fpga/SDAccel/examples/xilinx_2018.2/getting_started/cs-259-18f/hw2/digitrec.cpp:24:2). These data requests might be further partitioned to multiple requests during RTL generation, based on max_read_burst_length or max_write_burst_length settings.
R�
Please consult the !URI%1!�
��
Vivado HLS User Guide (UG902)f"bwww.xilinx.com/support/documentation/sw_manuals/xilinx2017_4/ug902-vivado-high-level-synthesis.pdfB�
�
HLS_WARNING�
HLS_WARNINGHLS Warning"%sBPlease consult the !URI%1!J�
�
Vivado HLS User Guide (UG902)f"bwww.xilinx.com/support/documentation/sw_manuals/xilinx2017_4/ug902-vivado-high-level-synthesis.pdfP