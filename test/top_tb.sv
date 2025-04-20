// Include timescale if defined separately
`include "../src/utils/timescale.v"

// Import test utilities package
import test_utilities_pkg::*;

module top_tb;

    // Parameters
    localparam CLOCK_PERIOD = 10; // ns (for 100 MHz)

    // Signals
    logic clk;
    logic rst_n;
    // Add wires/regs to connect to DUT ports

    // Instantiate DUT
    top uut (
        .clk(clk),
        .rst_n(rst_n)
        // Connect other ports
    );

    // Clock Generation
    always begin
        clk = 1'b0;
        #(CLOCK_PERIOD / 2.0);
        clk = 1'b1;
        #(CLOCK_PERIOD / 2.0);
    end

    // Test Sequence
    initial begin
        // Waveform dump
        $dumpfile("waveform.vcd");
        $dumpvars(0, top_tb); // Dump all signals in this module and below

        // Reset sequence
        rst_n = 1'b0; // Assert reset
        repeat(5) @(posedge clk);
        rst_n = 1'b1; // Deassert reset
        @(posedge clk);

        // Add test stimulus here

        // Finish simulation
        #1000; // Run for some time
        $display("Simulation finished at time %0t ns", $time);
        $finish;
    end

endmodule : top_tb