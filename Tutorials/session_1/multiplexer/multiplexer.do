quit -sim

vlib work

vcom multiplexer.vhd
vcom multiplexer_tb.vhd

vsim -c work.multiplexer_tb

# INPUTS
add wave -divider Inputs:
add wave -color yellow uut/s
add wave -color yellow uut/a
add wave -color yellow uut/b

# OUTPUTS
add wave -divider Outputs:
add wave uut/d

run -all