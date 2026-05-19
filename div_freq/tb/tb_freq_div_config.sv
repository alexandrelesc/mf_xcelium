`timescale 1ns/1ps

module tb_freq_div_config;

    logic clk;
    logic rst;
    logic [31:0] div_value;
    logic clk_div;

    // DUT
    freq_div_config dut (
        .clk(clk),
        .rst(rst),
        .div_value(div_value),
        .clk_div(clk_div)
    );

    // Clock de entrada: período de 10 ns
    initial clk = 0;
    always #5 clk = ~clk;

    // Geração do VCD
    initial begin
        $dumpfile("freq_div_config.vcd");
        $dumpvars(0, tb_freq_div_config);
    end

    // Estímulos
    initial begin
        rst = 1;
        div_value = 32'd4;

        #20;
        rst = 0;

        // div_value = 4
        // clk_div alterna a cada 4 ciclos de clk
        #200;

        // muda divisor para 8
        div_value = 32'd8;
        #300;

        // muda divisor para 2
        div_value = 32'd2;
        #150;

        $finish;
    end

endmodule