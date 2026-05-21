`timescale 1ns/1ps

module pipeline_sum (
    input  logic clk,
    input  logic rst,
    input  logic [7:0] a,
    input  logic [7:0] b,
    output logic [8:0] y
);

    logic [8:0] soma;

    // Lógica combinacional
    always_comb begin
        soma = a + b;
    end

    // Lógica sequencial
    always_ff @(posedge clk or posedge rst) begin
        if (rst)
            y <= 9'd0;
        else
            y <= soma;
    end

endmodule