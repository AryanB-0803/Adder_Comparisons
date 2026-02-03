`timescale 1ns / 1ps

module rca_tb;
  parameter n = 16;  //4, 8 and 32 bits can also be tested similarly

  reg [n-1:0] a, b;
  reg cin;
  wire [n-1:0] sum;
  wire cout;
  wire [n:0] final_sum;

  RCA_parameterized #(
      .n(n)
  ) uut (
      .a(a),
      .b(b),
      .cin(cin),
      .sum(sum),
      .cout(cout),
      .final_sum(final_sum)
  );

  initial begin
    $dumpfile("rca_16.vcd");
    $dumpvars(0, rca_tb);
  end

  integer i;
  initial begin
    a   = 0;
    b   = 0;
    cin = 0;
    #5;

    for (i = 0; i < 200; i = i + 1) begin
      a   = $random;
      b   = $random;
      cin = $random;
      #10;
    end

    #10 $finish;
  end
endmodule
