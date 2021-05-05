`timescale 1ns/1ns
// `include "fulladd.v"

module halfadd_tb;
    initial begin
        $dumpfile("halfadd_tb.vcd");
        $dumpvars(0,halfadd_tb);
    end

    reg  a_tb , b_tb;
    wire cout_tb;
    wire [1:0] sum_tb;

    halfadd halfadd1
    (
        .a(a_tb),
        .b(b_tb),
        .cout(cout_tb),
        .sum(sum_tb)
    );

    initial begin
        a_tb = 1'b0;
        b_tb = 1'b0;
        #5
        a_tb = 1'b0;
        b_tb = 1'b1;
        #5
        a_tb = 1'b1;
        b_tb = 1'b0;
        #5
        a_tb = 1'b1;
        b_tb = 1'b1;
        #40
        $display("Test Completed!");
        $finish;
    end

endmodule