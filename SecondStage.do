vsim work.secondstage
# vsim work.secondstage 
# Start time: 05:24:05 on Apr 24,2018
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
# Start time: 05:09:35 on Apr 24,2018
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
force -freeze sim:/secondstage/Clk_SecondStage 0 0, 1 {50 ps} -r 100
force -freeze sim:/secondstage/Instr_SecondStage 1111111111111111 0
force -freeze sim:/secondstage/PCinc_IF_ID 0000001000 0
force -freeze sim:/secondstage/Mem_WB_Rdest 001000 0
force -freeze sim:/secondstage/Write_data 00000000000011101111111111110001 0
force -freeze sim:/secondstage/WriteSrcDst_en 01 0
force -freeze sim:/secondstage/SP_readEn 0 0
force -freeze sim:/secondstage/SP_WriteEn 0 0
force -freeze sim:/secondstage/Rst_Reg0 0 0
force -freeze sim:/secondstage/Rst_Reg1 0 0
force -freeze sim:/secondstage/Rst_Reg2 0 0
force -freeze sim:/secondstage/Rst_Reg3 0 0
force -freeze sim:/secondstage/Rst_Reg4 0 0
force -freeze sim:/secondstage/Rst_SP 0 0
force -freeze sim:/secondstage/LoadOrStore_sel 0 0
run
force -freeze sim:/secondstage/Instr_SecondStage 0000000100000000 0
run
force -freeze sim:/secondstage/Mem_WB_Rdest 011000 0
run
force -freeze sim:/secondstage/Instr_SecondStage 0000001100000000 0
run
force -freeze sim:/secondstage/SP_WriteEn 1 0
force -freeze sim:/secondstage/Write_data 11110000111100001111111111111111 0
run
force -freeze sim:/secondstage/SP_readEn 1 0
run
force -freeze sim:/secondstage/LoadOrStore_sel 1 0
run


