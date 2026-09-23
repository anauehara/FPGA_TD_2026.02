quit -sim

vlib work

vcom alu.vhd
vcom alu_tb.vhd

vsim -c work.alu_tb

# INPUTS
add wave -divider Inputs:
add wave -color cyan uut/i_sel
add wave -color yellow uut/i_a
add wave -color yellow uut/i_b


# OUTPUTS
add wave -divider Outputs:
add wave uut/o_result

run -all