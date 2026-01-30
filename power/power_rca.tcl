#TECHNOLOGY : GF180 MCU 7T (SS corner)
set BASE /home/aryan/Verilog_codes/CLA_v_KSA
set LIB ~/GF180_libs/gf180mcu_fd_sc_mcu7t5v0__ss_n40C_1v62.lib
set WIDTH 32
set VCD $BASE/rca.vcd
set NETLIST $BASE/netlist_rca/netlist_${WIDTH}_bit_rca.v
set report_power_check $BASE/netlist_rca/reports_rca/power_report_rca_${WIDTH}.rpt 

read_liberty $LIB
read_verilog $NETLIST
link_design RCA_parameterized

#dummy clock for power reference; has no real significance as rca is a purely combinational circuit
create_clock -name tclk -period 10

read_vcd -scope rca_tb/uut $VCD ; #file dumped with $dumpvars(0,rca_tb) and DUT instance name is 'uut'
report_power > $report_power_check
