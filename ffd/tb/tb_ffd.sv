`timescale 1ns/1ps
`timescale 1ns/1ps

module tb_ffd;

    logic clk;
    logic rst;
    logic d;
    logic q;

    ffd dut (
        .clk(clk),
        .rst(rst),
        .d(d),
        .q(q)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("ffd.vcd");
        $dumpvars(0, ffd_tb);

        clk = 0;
        rst = 1;
        d   = 0;

        #12 rst = 0;

        #8  d = 1;
        #10 d = 0;
        #10 d = 1;
        #10 d = 0;
        #10 d = 1;

        #20 $finish;
    end

    initial begin
        $display("Tempo | clk | rst | d | q");
        $display("-------------------------");
        $monitor("%5t |  %0b  |  %0b  | %0b | %0b",
                 $time, clk, rst, d, q);
    end

endmodule