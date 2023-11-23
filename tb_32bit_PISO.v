module testbench_shift_register_piso_32bit;

  reg C;              // Clock signal
  reg [31:0] PI;      // Parallel input
  wire SO;            // Serial output

  // Instantiate the 32-bit PISO shift register module
  shift_register_piso_32bit uut (
    .C(C),
    .PI(PI),
    .SO(SO)
  );

  // Clock generation (50% duty cycle)
  always begin
    #2 C = ~C;
  end

  // Monitor signals and display their values
  initial begin
    // Output VCD file for GTKWave
    $dumpfile("out.vcd");
    $dumpvars(0, testbench_shift_register_piso_32bit);

    $monitor("Time=%0t C=%b PI=%b SO=%b", $time, C, PI, SO);

    C = 0;
    PI = 32'b0;

    PI = 32'b11010000010010010010000010000111;

    #64 $finish;
  end

endmodule
