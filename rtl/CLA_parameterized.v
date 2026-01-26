module CLA_parameterized #(
    parameter n = 8 
) (
    input  [n-1:0] a,
    input  [n-1:0] b,
    input          cin,
    output [n-1:0] sum,
    output         cout,
    output [  n:0] final_sum
);

  //g and p generation
  wire [n-1:0] g, p;
  genvar i;

  generate
    for (i = 0; i < n; i = i + 1) begin : gen_gp
      assign g[i] = a[i] & b[i];
      assign p[i] = a[i] ^ b[i];
    end
  endgenerate

  //carries
  wire [n:0] c;
  assign c[0] = cin;

  //basic carries...easy to assign 
  assign c[1] = g[0] | (p[0] & cin);

  assign c[2] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & cin);


  //deeper carries..for after c[2] til c[n]   
  genvar k, m;
  generate
    for (k = 2; k < n; k = k + 1) begin : gen_carry
      wire [k-1:1] deep_terms;
      for (m = 1; m < k; m = m + 1) begin : gen_deep
        assign deep_terms[m] = (&p[k:m]) & g[m-1];
      end

      assign c[k+1] = g[k] | (p[k] & g[k-1]) | (|deep_terms) | ((&p[k:0]) & cin);
    end
  endgenerate

  assign cout = c[n];

  //sum generation
  genvar s;
  generate
    for (s = 0; s < n; s = s + 1) begin : gen_sum
      assign sum[s] = p[s] ^ c[s];
    end
  endgenerate

  assign cout = c[n];

  //final sum assignment
  assign final_sum = {cout, sum};
endmodule


/*
**FOR SIMULATION ONLY**
//testbench
module cla_tb;
  parameter n = 8;
  wire [n-1:0] sum;
  wire cout;
  reg [n-1:0] a, b;
  reg cin;
  wire [n:0] final_sum;
  CLA_parameterized uut (
      a,
      b,
      cin,
      sum,
      cout,
      final_sum
  );
  initial begin
    $dumpfile("cla.vcd");
    $dumpvars(0, cla_tb);
    a   = 8'd255;
    b   = 8'd0;
    cin = 1;  //WORST CASE STATE...full carry logic is utilized   
    #10 a = 8'd200;
    b   = 8'd100;
    cin = 0;  //exp 8'd44 sum 1 cout
    #10 $finish;
  end
endmodule
*/
