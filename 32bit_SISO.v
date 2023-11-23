module sisomod_32bit (
  input clk,     // Clock signal
  input si,      // Serial input
  input clear,   // Clear signal
  output so      // Serial output
);

  reg so;         // Serial output
  reg [31:0] tmp; // 32-bit shift register

always @(posedge clk) begin
  if (clear) begin
    tmp <= 32'b0; // Clear the shift register
  end else begin
    tmp <= {si, tmp[31:1]}; // Shift left for SISO
  end
end


  always @(posedge clk or posedge clear) begin
    if (clear) begin
      so <= 1'b0; // Clear the serial output
    end else begin
      so <= tmp[31]; // Output the most significant bit
    end
  end

endmodule
