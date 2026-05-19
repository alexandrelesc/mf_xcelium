`timescale 1ns/1ps
module senha_alarme (
    input  logic clk,
    input  logic rst,
    input  logic enter,
    input  logic [3:0] senha,
    output logic ok,
    output logic alarme
);

    logic senha_correta;

    // Lógica combinacional
    always_comb begin
        senha_correta = (senha == 4'b1010);
    end

    // Lógica sequencial
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            ok     <= 1'b0;
            alarme <= 1'b0;
        end
        else if (enter) begin
            if (senha_correta) begin
                ok     <= 1'b1;
                alarme <= 1'b0;
            end
            else begin
                ok     <= 1'b0;
                alarme <= 1'b1;
            end
        end
    end

endmodule