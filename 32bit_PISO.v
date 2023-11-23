module shift_register_piso_32bit (
  input C,       // Clock signal
  input [31:0] PI,  // Parallel input
  output wire SO  // Serial output
);

  reg [31:0] tmp;  // 32-bit shift register

  initial begin
	  assign tmp = PI;
  end

  always @(posedge C) begin
    assign tmp[31:1] = tmp[30:0];  
  end

  assign SO = tmp[31];

endmodule
