`timescale 1ns/1ns
// `include "fulladd.v"

module fulladd_tb;
    initial begin
        $dumpfile("fulladd_tb.vcd");
        $dumpvars(0,fulladd_tb);
    end

    reg  a_tb , b_tb;
    wire c_tb;

    fulladd fulladd1
    (
        .a(a_tb),
        .b(b_tb),
        .c(c_tb)
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