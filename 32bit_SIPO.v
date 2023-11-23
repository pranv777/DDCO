module ShiftRegister_SIPO_32bit(
  input wire serial_in,
  input wire clock,
  input wire reset,
  output reg [31:0] parallel_out
);

  reg [31:0] shift_register;

  always @(posedge clock or posedge reset) begin
    if (reset)
      shift_register <= 32'b0;
    else begin
      shift_register[31:1] <= shift_register[30:0];
      shift_register[0] <= serial_in;
    end
  end

  always @* begin
    parallel_out = shift_register;
  end

endmodule
