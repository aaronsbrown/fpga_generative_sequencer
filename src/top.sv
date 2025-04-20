// Include timescale definition if using timescale.v
`include "utils/timescale.v"

// Import package if using one
// import arch_defs_pkg::*;

module top (
    input wire clk,
    input wire rst_n // Example reset (active low)
    // Add other top-level ports here (leds, buttons, etc.)
);

    // Instantiate your core logic here

    // Example reset synchronizer (if needed)
    logic reset_sync;
    always_ff @(posedge clk) begin
        reset_sync <= ~rst_n; // Convert active low async to active high sync
    end

endmodule : top