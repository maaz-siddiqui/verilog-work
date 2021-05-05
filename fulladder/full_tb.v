`timescale 1ns/1ns

module full_tb;
    initial begin
        $dumpfile("full_tb.vcd");
        $dumpvars(0,full_tb);
    end
//xor = sum and and = cout
    reg  a_tb , b_tb, c_tb;
    wire cout1_tb, cout2_tb, cout_tb;
    wire [1:0] sum1_tb, sum2_tb;
    wire sum_tb;

    halfadd halfadd1
    (
        .a(a_tb),
        .b(b_tb),
        .cout(cout1_tb),
        .sum(sum1_tb)
    );
    halfadd halfadd2(
        .a(sum1_tb[0]),
        .b(c_tb),
        .cout(cout2_tb),
        .sum(sum2_tb)
    );

    assign cout_tb = cout1_tb | cout2_tb; //or gate |
    assign sum_tb = sum2_tb;
    initial begin
        a_tb = 1'b0;
        b_tb = 1'b0;
        c_tb = 1'b0;
        #5
        a_tb = 1'b0;
        b_tb = 1'b1;
        c_tb = 1'b0;
        #5
        a_tb = 1'b1;
        b_tb = 1'b0;
        c_tb = 1'b0;
        #5
        a_tb = 1'b1;
        b_tb = 1'b1;
        c_tb = 1'b0;
        #5
        a_tb = 1'b0;
        b_tb = 1'b0;
        c_tb = 1'b1;
        #5
        a_tb = 1'b0;
        b_tb = 1'b1;
        c_tb = 1'b1;
        #5
        a_tb = 1'b1;
        b_tb = 1'b0;
        c_tb = 1'b1;
        #5
        a_tb = 1'b1;
        b_tb = 1'b1;
        c_tb = 1'b1;
        #40
        $display("Test Completed!");
        $finish;
    end

endmodule