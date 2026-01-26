# Adder_Comparisons
Timing comparison of parameterized Carry Lookahead Adder (CLA) and Ripple Carry Adder (RCA) using gate-level STA, with analysis and visualization of delay scaling across bit-widths.

## OVERVIEW
- Parameterized CLA and RCA designs written in Verilog
- Gate-level synthesis and timing analysis
- Delay analysis across multiple bit-widths (4, 8, 16 & 32)
- Visualization os STA results using MATLAB

## REPOSITORY STRUCTURE
- 'rtl/'
  Parameterized Verilog designs of CLA and RCA

- 'yosys/'
  Yosys synthesis scripts used to prepare netlist for STA

- 'sta/'
  TCL scripts for running static timing analysis

- 'analysis/'
  MATLAB script and generated plots for delay comparison

## TOOLS USED
- Verilog HDL
- Yosys
- OpenSTA (for static timing analysis)
- MATLAB

## RESULTS
The following plot shows the gate-level STA DELAY comparison between CLA and RCA across multiple bit-widths

![STA delay vs bit-width (RCA vs CLA)](analysis/delay_vs_bitwidth(rca_vs_cla).png)

The results are consistent with the expected linear delay growth for RCA and sub-linear delay growth for CLA according to their respective carry propagation methods

## NOTES
- The delay time units are units reported from STA which are defined by the standard-cell library used (GlobalFoundries 180 nm Mixed-Signal CMOS (GF180MCU) - SS corner used)

## FUTURE WORK
- Comparison with parallel-prefix adders (e.g Brent-Kung adder)
- Extend timing analysis across different power-voltage-temperature corners


