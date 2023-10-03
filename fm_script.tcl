


set synopsys_auto_setup true

set_svf "UART_RX.svf"

############################## Formality Setup File ##############################

set SSLIB "/home/IC/Labs/UART_RX/std_cells/scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.db"
set TTLIB "/home/IC/Labs/UART_RX/std_cells/scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"
set FFLIB "/home/IC/Labs/UART_RX/std_cells/scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.db"

## Read Reference Design Files
read_verilog -container Ref "/home/IC/Labs/UART_RX/rtl/UART_RX.v"
read_verilog -container Ref "/home/IC/Labs/UART_RX/rtl/data_sampling.v"
read_verilog -container Ref "/home/IC/Labs/UART_RX/rtl/deserializer.v"
read_verilog -container Ref "/home/IC/Labs/UART_RX/rtl/edge_bit_counter.v"

read_verilog -container Ref "/home/IC/Labs/UART_RX/rtl/FSM.v"
read_verilog -container Ref "/home/IC/Labs/UART_RX/rtl/parity_check.v"
read_verilog -container Ref "/home/IC/Labs/UART_RX/rtl/stop_check.v"
read_verilog -container Ref "/home/IC/Labs/UART_RX/rtl/start_check.v"



#loading libraries
read_db -container Ref "/home/IC/Labs/UART_RX/std_cells/scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"

## set the top Reference Design (module name)
set_reference_design UART_RX
set_top UART_RX





## Read Implementation Design Files
read_verilog -netlist -container Imp "/home/IC/Labs/UART_RX/syn/UART_RX.v"

## Read Implementation technology libraries
read_db -container Imp "/home/IC/Labs/UART_RX/std_cells/scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"

## set the top Implementation Design
set_implementation_design UART_RX
set_top UART_RX



## matching Compare points
match


## verify
set successful [verify]
if {!$successful} {
diagnose
analyze_points -failing
}

#Reports
report_passing_points > "passing_points.rpt"
report_failing_points > "failing_points.rpt"
report_aborted_points > "aborted_points.rpt"
report_unverified_points > "unverified_points.rpt"


start_gui

