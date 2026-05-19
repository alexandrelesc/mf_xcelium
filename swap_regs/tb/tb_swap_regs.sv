`timescale 1ns/1ps

module tb_swap_regs();

    logic clk;
    logic rst;
    logic [7:0] a;
    logic [7:0] b;

    // Instância do DUT
    swap_regs dut (
        .clk(clk),
        .rst(rst),
        .a(a),
        .b(b)
    );

    // Clock
    initial clk = 0;
    always #5 clk = ~clk;

    // Cabeçalho
    initial begin
        $display("Tempo\t a\t b");
        $display("----------------------");
    end

    // Estímulos
    initial begin
        rst = 1;
        #10;
        rst = 0;

        #100;
        $finish;
    end

    // Impressão a cada clock
    always @(posedge clk) begin
        $display("t%0t\t %0d\t %0d", $time/10, a, b);
    end

endmodule