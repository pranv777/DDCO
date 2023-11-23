module pipomod_32bit_tb;
  reg clk;              
  reg clear;           
  reg [31:0] pi;      
  wire [31:0] po;    

  pipomod_32bit uut (
    .clk(clk),
    .clear(clear),
    .pi(pi),
    .po(po)
  );

  always begin
    #5 clk = ~clk;
  end

  initial begin
    $dumpfile("out.vcd");  
    $dumpvars(0, pipomod_32bit_tb); 

    $monitor("Time=%0t clk=%b clear=%b po=%b pi=%b", $time, clk, clear, po, pi);

    clk = 0;
    clear = 0;
    pi = 32'b0;

    #5 clear = 1'b1;
    #5 clear = 1'b0;

    #10 pi = 32'b1001;
    #10 pi = 32'b1010;
    #10 pi = 32'b1011;
    #10 pi = 32'b1110;
    #10 pi = 32'b1111;
    #10 pi = 32'b0000;
    $finish;
  end
endmodule




