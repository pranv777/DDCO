module ShiftRegister_SIPO_32bit_tb;

  reg serial_in;
  reg clock;
  reg reset;
  wire [31:0] parallel_out;

  // Instantiate the SIPO shift register module
  ShiftRegister_SIPO_32bit uut (
    .serial_in(serial_in),
    .clock(clock),
    .reset(reset),
    .parallel_out(parallel_out)
  );

  // Clock generation
  initial begin
    clock = 0;
    forever #5 clock = ~clock;
  end

  // Test stimulus
  initial begin
    reset = 1;
    serial_in = 1'b0;

    #10 reset = 0;
    #10 serial_in = 1'b0;
    #10 serial_in = 1'b0;
    #10 serial_in = 1'b1;
    #10 serial_in = 1'b0;
    #10 serial_in = 1'b0;
    #10 serial_in = 1'b1;
    #10 serial_in = 1'b0;


    #300 $finish;
  end

  // Monitor for debugging
  initial begin
    $dumpfile("out.vcd");
    $dumpvars(0, ShiftRegister_SIPO_32bit_tb);

    $monitor("Time=%0t: serial_in=%b, parallel_out=%b", $time, serial_in, parallel_out);
    #300 $finish;
  end

endmodule

