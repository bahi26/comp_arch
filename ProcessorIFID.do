vsim work.processor
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
