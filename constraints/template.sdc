# Example constraint for a 100 MHz clock (10 ns period)
# Ensure 'clk' matches the clock port name in your top module
create_clock -period 10.0 [get_ports clk]