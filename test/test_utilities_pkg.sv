package test_utils_pkg;

  // Task to compare specific bits of two vectors (registers).
  // Displays masked values in hex.
  task automatic inspect_register (
    input logic [31:0] actual,     // Signal value from DUT
    input logic [31:0] expected,   // Expected value
    input int          width,      // Number of bits to compare (from LSB)
    input string       name        // Name of the register/signal for messages
  );
    logic [31:0] mask;
    begin
      if (width <= 0 || width > 32) begin
        $error("inspect_register: Invalid width %0d", width);
        return; // Exit task
      end
      // Create a mask for the lower 'width' bits
      mask = (width == 32) ? 32'hFFFFFFFF : (32'h1 << width) - 1;

      // Compare only the masked bits
      if ((actual & mask) !== (expected & mask)) begin
           $display("\033[0;31mAssertion Failed: %s (%0d bits). Actual: %h, Expected: %h\033[0m",
                    name, width, actual & mask, expected & mask);
           // Optionally add $error("Assertion Failed: %s", name); to stop simulation on failure
      end else begin
           $display("\033[0;32mAssertion Passed: %s (%0d bits) = %h\033[0m",
                    name, width, actual & mask);
      end
    end
  endtask

  // Task to apply reset and wait for a number of clock cycles.
  // Assumes 'clk' and 'reset' signals exist in the calling scope.
  task automatic reset_and_wait (
      input int cycles_to_wait
  );
    begin
      reset = 1; // Assumes active-high reset in TB scope
      @(posedge clk); // Wait for at least one edge while reset is high
      #1ps; // Allow combinational logic to settle after reset edge
      reset = 0;
      if (cycles_to_wait > 0) begin
          repeat (cycles_to_wait) @(posedge clk);
      end
      #1ps; // Allow combinational logic to settle after last clock edge
    end
  endtask

endpackage : test_utils_pkg