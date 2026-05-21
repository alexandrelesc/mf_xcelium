`timescale 1ns/1ps
`timescale 1ns/1ps

module tb_pipeline_sum;

    logic clk;
    logic rst;
    logic [7:0] a;
    logic [7:0] b;
    logic [8:0] y;

    pipeline dut (
        .clk(clk),
        .rst(rst),
        .a(a),
        .b(b),
        .y(y)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("pipeline.vcd");
        $dumpvars(0, pipeline_tb);

        clk = 0;
        rst = 1;
        a = 0;
        b = 0;

        #12 rst = 0;

        a = 8'd10;  b = 8'd20;
        #10;

        a = 8'd30;  b = 8'd40;
        #10;

        a = 8'd100; b = 8'd50;
        #10;

        a = 8'd200; b = 8'd55;
        #10;

        #20 $finish;
    end

    initial begin
        $display("tempo | a | b | y");
        $display("-------------------");
        $monitor("%5t | %3d | %3d | %3d", $time, a, b, y);
    end

endmodule