`timescale 1ns/1ps

module tb_rom;

    logic clk;

    logic [1:0] linha;
    logic [1:0] coluna;

    logic [7:0] data;

    rom dut (
        .clk(clk),
        .linha(linha),
        .coluna(coluna),
        .data(data)
    );

    always #5 clk = ~clk;

    initial begin

        $dumpfile("rom_matriz.vcd");
        $dumpvars(0, rom_matriz_tb);

        clk = 0;

        linha = 0; coluna = 0; #10;
        linha = 0; coluna = 3; #10;

        linha = 1; coluna = 2; #10;

        linha = 2; coluna = 1; #10;

        linha = 3; coluna = 3; #10;

        #20 $finish;

    end

    initial begin

        $display("tempo | linha | coluna | data");

        $monitor("%4t | %0d | %0d | 0x%02h",
                 $time,
                 linha,
                 coluna,
                 data);

    end

endmodule