module RCA_parameterized #(parameter n = 32)(
    input [n-1:0]a,b,
    input cin,
    output [n-1:0] sum,
    output cout,
    output [n:0]final_sum
);
wire [n:0]c;

//first carry
assign c[0] = cin;

//intermediate carry generation
genvar i;
generate
    for(i = 1; i <= n; i=i+1) begin : gen_carry_intermediate
        assign c[i] = a[i-1]&b[i-1] | c[i-1]&(a[i-1]^b[i-1]);
    end
endgenerate

//final cout assignment
assign cout = c[n];

//sum generation
genvar k;
generate
    for(k = 0; k < n; k=k+1) begin : gen_sum
        assign sum[k] = a[k] ^ b[k] ^ c[k];
    end
endgenerate

//final sum assignment
assign final_sum = {cout,sum};
endmodule

/*
**FOR SIMULATION ONLY**
//TESTBENCH
module RCA_parameterized_tb;
parameter n = 4;
wire [n-1:0]sum;
wire cout;
wire [n:0]final_sum;
reg [n-1:0]a,b;
reg cin;
RCA_parameterized uut(a,b,cin,sum,cout,final_sum);
initial begin
    $dumpfile("rca.vcd");
    $dumpvars(0,RCA_parameterized_tb);
    a = 4'd5; b = 4'd9; cin = 0;
    #10 a = 4'd10; b = 4'd10; cin = 1;
    #10 $finish;
end
endmodule
*/
