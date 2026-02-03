`timescale 1ns/1ps

module cla_tb;
  parameter n = 16;
  
  reg [n-1:0] a, b;
  reg cin;
  wire [n-1:0] sum;
  wire cout;
  wire [n:0] final_sum;
  
  CLA_parameterized #(.n(n)) uut (
      .a(a),
      .b(b),
      .cin(cin),
      .sum(sum),
      .cout(cout),
      .final_sum(final_sum)
  );
  
  initial begin
    $dumpfile("cla_16.vcd");      
    $dumpvars(0, cla_tb);
  end
  
  // Stimulus generation
  integer i;
  initial begin
    a   = 0;
    b   = 0;
    cin = 0;
    #5;
    
    // Main stimulus loop
    for (i = 0; i < 200; i = i + 1) begin
      a   = $random;
      b   = $random;
      cin = $random;
      #10;
    end
    
    #10 $finish;
  end
endmodule
