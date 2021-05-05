module halfadd (
    a,b,sum,cout
);

input wire a, b;
output cout;
output [1:0] sum;

assign cout = a*b;
assign sum = a^b;
    
endmodule