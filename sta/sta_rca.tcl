read_liberty ~/GF180_libs/gf180mcu_fd_sc_mcu7t5v0__ss_125C_1v62.lib
read_verilog netlist_32_bit_rca.v
link_design RCA_parameterized
create_clock -name VCLK -period 10
set_input_delay 0 -clock VCLK [all_inputs]
set_output_delay 0 -clock VCLK [all_outputs]
report_checks -path_delay max
