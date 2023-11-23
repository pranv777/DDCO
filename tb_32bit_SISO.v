module sisomod_32bit_tb;
  reg clk;              // Clock signal
  reg clear;            // Clear signal
  reg si;               // Serial input
  wire so;              // Serial output

  sisomod_32bit uut (
    .clk(clk),
    .clear(clear),
    .si(si),
    .so(so)
  );

  // Clock generation (50% duty cycle)
  always begin
    #5 clk = ~clk;
  end

initial begin
    $dumpfile("out.vcd");
    $dumpvars(0, sisomod_32bit_tb);
    $monitor("Time=%0t clk=%b clear=%b si=%b so=%b", $time, clk, clear, si, so);

    clk = 0;
    clear = 0;
    si = 0;

    // Clear the shift register
    #5 clear = 1'b1;
    #5 clear = 1'b0;

    #10 si = 1'b1;
    #10 si = 1'b0;
    #10 si = 1'b0;
    #10 si = 1'b1;
    #10 si = 1'b0;
    #10 si = 1'bx;  // Test for unknown (X) value

    $finish;
  end
endmodule

