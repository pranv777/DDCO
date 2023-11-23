module pipomod_32bit (
  input clk,    // Clock signal
  input clear,  // Clear signal
  input [31:0] pi,  // Parallel input data
  output reg [31:0] po  // Parallel output data
);

  always @(posedge clk) begin
    if (clear) begin
      po <= 32'b0;  // Clear the shift register
    end else begin
      po[31:1] <= pi[30:0]; 
      po[0] <= 1'b0;
    end
  end

endmodule

