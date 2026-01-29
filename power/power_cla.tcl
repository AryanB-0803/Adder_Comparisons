set LIB ~/GF180_libs/gf180mcu_fd_sc_mcu7t5v0__ss_n40C_1v62.lib
set WIDTH 16; #can be changed to any bitwidth for power analysis
set VCD ~/Verilog_codes/CLA_v_KSA/cla.vcd
set OUT ~/Verilog_codes/CLA_v_KSA/netlist_cla/reports/power_report_cla_${WIDTH}.rpt

read_liberty $LIB
read_verilog netlist_${WIDTH}_bit.v
link_design CLA_parameterized

#dummy clock for power reference; has no real significance as cla is a purely combinational circuit
create_clock -name tclk -period 10 

read_vcd -scope cla_tb/uut $VCD
report_power > $OUT
