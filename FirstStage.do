vsim work.firststage
# vsim work.firststage 
# Start time: 18:40:46 on Apr 23,2018
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading work.firststage(arch_firststage)
# Loading work.reg(arch_reg)
# Loading work.nadder(arch_nadder)
# Loading work.adder(arch_adder)
# Loading work.mux3_1(arch_mux3_1)
# Loading ieee.numeric_std(body)
# Loading work.instmem(arch_instmem)
add wave sim:/firststage/*
force -freeze sim:/firststage/Rst_PC 1 0
force -freeze sim:/firststage/InstMem_en 1 0
force -freeze sim:/firststage/Clk_FirstStage 1 0, 0 {50 ps} -r 100
run
force -freeze sim:/firststage/en_PC 1 0
force -freeze sim:/firststage/Rst_PC 0 0
force -freeze sim:/firststage/data 1111111111 0
force -freeze sim:/firststage/d1 0000111100 0
force -freeze sim:/firststage/M0 0000000000 0
force -freeze sim:/firststage/M1 0000000001 0
force -freeze sim:/firststage/PC_Sel 001 0
run
run
run
run
run
run
