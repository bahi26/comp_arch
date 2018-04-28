vsim work.secondstage
# vsim work.secondstage 
# Start time: 06:49:13 on Apr 24,2018
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading work.secondstage(arch_secondstage)
# Loading work.dec3_8(arch_dec3_8)
# Loading work.reg(arch_reg)
# Loading work.sp_reg(arch_sp_reg)
# Loading work.mux3_1(arch_mux3_1)
# Loading work.mux2_1(arch_mux2_1)
# vsim work.secondstage 
# Start time: 06:01:16 on Apr 24,2018
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading work.secondstage(arch_secondstage)
# Loading work.dec3_8(arch_dec3_8)
# Loading work.reg(arch_reg)
# Loading work.sp_reg(arch_sp_reg)
# Loading work.mux3_1(arch_mux3_1)
# Loading work.mux2_1(arch_mux2_1)
add wave sim:/secondstage/*
force -freeze sim:/secondstage/Clk_SecondStage 1 0, 0 {50 ps} -r 100
force -freeze sim:/secondstage/Instr_SecondStage 0000000000000010 0
quit -sim
# End time: 06:08:57 on Apr 24,2018, Elapsed time: 0:07:41
# Errors: 0, Warnings: 0
vsim work.processor
# End time: 06:49:26 on Apr 24,2018, Elapsed time: 0:00:13
# Errors: 0, Warnings: 0
# vsim work.processor 
# Start time: 06:49:26 on Apr 24,2018
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading work.processor(arch_processor)
# Loading work.firststage(arch_firststage)
# Loading work.reg(arch_reg)
# Loading work.nadder(arch_nadder)
# Loading work.adder(arch_adder)
# Loading work.mux3_1(arch_mux3_1)
# Loading ieee.numeric_std(body)
# Loading work.instmem(arch_instmem)
# Loading work.if_id(arch_if_id)
# Loading work.mux2_1(arch_mux2_1)
# Loading work.reg_latch(arch_reg_latch)
# Loading work.secondstage(arch_secondstage)
# Loading work.dec3_8(arch_dec3_8)
# Loading work.sp_reg(arch_sp_reg)
# Loading work.id_ex(arch_id_ex)
# Loading work.ex_stage(ex_stage_arch)
# Loading work.mux3_2(mux_arch)
# ** Warning: (vsim-3473) Component instance "flag_register : flag_reg" is not bound.
#    Time: 0 ps  Iteration: 0  Instance: /processor/Processor_Execution_Stage File: /home/gehad/Ex_stage.vhd
# Loading work.alu(alu_arch)
# ** Warning: (vsim-3473) Component instance "forword_data : forward_unit" is not bound.
#    Time: 0 ps  Iteration: 0  Instance: /processor/Processor_Execution_Stage File: /home/gehad/Ex_stage.vhd
# Loading work.ex_mem_reg(ex_mem_arch)
# ** Warning: (vsim-8684) No drivers exist on inout port /processor/Processor_Execution_Stage/execute/flags(3), and its initial value is not used.
# Therefore, simulation behavior may occur that is not in compliance with
# the VHDL standard as the initial values come from the base signal /processor/Processor_Execution_Stage/flag_output(3).
# vsim work.processor 
# Start time: 06:09:22 on Apr 24,2018
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading work.processor(arch_processor)
# Loading work.firststage(arch_firststage)
# Loading work.reg(arch_reg)
# Loading work.nadder(arch_nadder)
# Loading work.adder(arch_adder)
# Loading work.mux3_1(arch_mux3_1)
# Loading ieee.numeric_std(body)
# Loading work.instmem(arch_instmem)
# Loading work.if_id(arch_if_id)
# Loading work.mux2_1(arch_mux2_1)
# Loading work.reg_latch(arch_reg_latch)
# Loading work.secondstage(arch_secondstage)
# Loading work.dec3_8(arch_dec3_8)
# Loading work.sp_reg(arch_sp_reg)
# Loading work.id_ex(arch_id_ex)
# Loading work.ex_stage(ex_stage_arch)
# Loading work.mux3_2(mux_arch)
# ** Warning: (vsim-3473) Component instance "flag_register : flag_reg" is not bound.
#    Time: 0 ps  Iteration: 0  Instance: /processor/Processor_Execution_Stage File: /home/gehad/Ex_stage.vhd
# Loading work.alu(alu_arch)
# ** Warning: (vsim-3473) Component instance "forword_data : forward_unit" is not bound.
#    Time: 0 ps  Iteration: 0  Instance: /processor/Processor_Execution_Stage File: /home/gehad/Ex_stage.vhd
# Loading work.ex_mem_reg(ex_mem_arch)
# ** Warning: (vsim-8684) No drivers exist on inout port /processor/Processor_Execution_Stage/execute/flags(3), and its initial value is not used.
# Therefore, simulation behavior may occur that is not in compliance with
# the VHDL standard as the initial values come from the base signal /processor/Processor_Execution_Stage/flag_output(3).
# vsim work.processor 
# Start time: 05:51:00 on Apr 24,2018
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading work.processor(arch_processor)
# Loading work.firststage(arch_firststage)
# Loading work.reg(arch_reg)
# Loading work.nadder(arch_nadder)
# Loading work.adder(arch_adder)
# Loading work.mux3_1(arch_mux3_1)
# Loading ieee.numeric_std(body)
# Loading work.instmem(arch_instmem)
# Loading work.if_id(arch_if_id)
# Loading work.mux2_1(arch_mux2_1)
# Loading work.reg_latch(arch_reg_latch)
# Loading work.secondstage(arch_secondstage)
# Loading work.dec3_8(arch_dec3_8)
# Loading work.sp_reg(arch_sp_reg)
# Loading work.id_ex(arch_id_ex)
# Loading work.ex_stage(ex_stage_arch)
# Loading work.mux3_2(mux_arch)
# ** Warning: (vsim-3473) Component instance "flag_register : flag_reg" is not bound.
#    Time: 0 ps  Iteration: 0  Instance: /processor/Processor_Execution_Stage File: /home/gehad/Ex_stage.vhd
# Loading work.alu(alu_arch)
# ** Warning: (vsim-3473) Component instance "forword_data : forward_unit" is not bound.
#    Time: 0 ps  Iteration: 0  Instance: /processor/Processor_Execution_Stage File: /home/gehad/Ex_stage.vhd
# Loading work.ex_mem_reg(ex_mem_arch)
# ** Warning: (vsim-8684) No drivers exist on inout port /processor/Processor_Execution_Stage/execute/flags(3), and its initial value is not used.
# Therefore, simulation behavior may occur that is not in compliance with
# the VHDL standard as the initial values come from the base signal /processor/Processor_Execution_Stage/flag_output(3).
# vsim work.processor 
# Start time: 21:13:19 on Apr 23,2018
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading work.processor(arch_processor)
# Loading work.firststage(arch_firststage)
# Loading work.reg(arch_reg)
# Loading work.nadder(arch_nadder)
# Loading work.adder(arch_adder)
# Loading work.mux3_1(arch_mux3_1)
# Loading ieee.numeric_std(body)
# Loading work.instmem(arch_instmem)
# Loading work.if_id(arch_if_id)
# Loading work.mux2_1(arch_mux2_1)
# Loading work.reg_latch(arch_reg_latch)
# Loading work.secondstage(arch_secondstage)
# Loading work.dec3_8(arch_dec3_8)
# Loading work.sp_reg(arch_sp_reg)
# Loading work.id_ex(arch_id_ex)
# Loading work.ex_stage(ex_stage_arch)
# Loading work.mux3_2(mux_arch)
# ** Warning: (vsim-3473) Component instance "flag_register : flag_reg" is not bound.
#    Time: 0 ps  Iteration: 0  Instance: /processor/Processor_Execution_Stage File: /home/gehad/Ex_stage.vhd
# Loading work.alu(alu_arch)
# ** Warning: (vsim-3473) Component instance "forword_data : forward_unit" is not bound.
#    Time: 0 ps  Iteration: 0  Instance: /processor/Processor_Execution_Stage File: /home/gehad/Ex_stage.vhd
# Loading work.ex_mem_reg(ex_mem_arch)
# ** Warning: (vsim-8684) No drivers exist on inout port /processor/Processor_Execution_Stage/execute/flags(3), and its initial value is not used.
# Therefore, simulation behavior may occur that is not in compliance with
# the VHDL standard as the initial values come from the base signal /processor/Processor_Execution_Stage/flag_output(3).
add wave sim:/processor/*
force -freeze sim:/processor/processor_Clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/processor/processor_Rst 1 0
force -freeze sim:/processor/enable_InstMem 1 0
run
force -freeze sim:/processor/processor_Rst 0 0
force -freeze sim:/processor/ID_EX_S12 0 0
force -freeze sim:/processor/EX_MEM_S12 0 0
force -freeze sim:/processor/MEM_WB_S12 0 0
force -freeze sim:/processor/flag_Reg 0000 0
force -freeze sim:/processor/enable_PC 1 0
force -freeze sim:/processor/selection_PC 001 0
force -freeze sim:/processor/enable_IF_ID 1 0
force -freeze sim:/processor/is_call 0 0
force -freeze sim:/processor/is_jmp 0 0
force -freeze sim:/processor/is_jz 0 0
force -freeze sim:/processor/is_jn 0 0
force -freeze sim:/processor/is_jc 0 0
force -freeze sim:/processor/IN_data 1111111111 0
force -freeze sim:/processor/IN_d1 0000111100 0
force -freeze sim:/processor/IN_M0 0000000000 0
force -freeze sim:/processor/IN_M1 0000000001 0
run
run
run
run
run
run
run
force -freeze sim:/processor/WriteSrcDst_enable 01 0
force -freeze sim:/processor/readEn_SP 0 0
force -freeze sim:/processor/WriteEn_SP 0 0
force -freeze sim:/processor/sel_LoadOrStore 0 0
force -freeze sim:/processor/Rdest_Mem_WB 000000 0
force -freeze sim:/processor/WriteData_Mem_WB 00000000000011101111111111110001 0
run
run
force -freeze sim:/processor/WriteEn_SP 1 0
force -freeze sim:/processor/WriteData_Mem_WB 00000000000000000000000011111111 0
run
force -freeze sim:/processor/WriteEn_SP 0 0
force -freeze sim:/processor/readEn_SP 1 0
run
force -freeze sim:/processor/sel_LoadOrStore 1 0
run
force -freeze sim:/processor/EX_Control 11111 0
force -freeze sim:/processor/EX_Control 11111 0
force -freeze sim:/processor/MEM_Control 000000 0
force -freeze sim:/processor/WB_Control 1 0
force -freeze sim:/processor/w_r_En_ID_EX 0 0
force -freeze sim:/processor/flag_enable 0 0
force -freeze sim:/processor/s12_ID_EX 1 0
force -freeze sim:/processor/s13_ID_EX 00 0
force -freeze sim:/processor/w_r_En_ID_EX 1 0
force -freeze sim:/processor/EX_Control 00000 0
force -freeze sim:/processor/MEM_Control 111111 0
force -freeze sim:/processor/WB_Control 0 0
run
force -freeze sim:/processor/ID_EX_en 1 0
run
