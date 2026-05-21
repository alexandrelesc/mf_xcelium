`timescale 1ns/1ps

module rom_matriz (
    input  logic       clk,

    input  logic [1:0] linha,
    input  logic [1:0] coluna,

    output logic [7:0] data
);

    logic [7:0] rom [0:3][0:3];

    // inicialização da ROM
    initial begin

        rom[0][0] = 8'h10;
        rom[0][1] = 8'h11;
        rom[0][2] = 8'h12;
        rom[0][3] = 8'h13;

        rom[1][0] = 8'h20;
        rom[1][1] = 8'h21;
        rom[1][2] = 8'h22;
        rom[1][3] = 8'h23;

        rom[2][0] = 8'h30;
        rom[2][1] = 8'h31;
        rom[2][2] = 8'h32;
        rom[2][3] = 8'h33;

        rom[3][0] = 8'h40;
        rom[3][1] = 8'h41;
        rom[3][2] = 8'h42;
        rom[3][3] = 8'h43;

    end

    // leitura síncrona
    always_ff @(posedge clk) begin
        data <= rom[linha][coluna];
    end

endmodule