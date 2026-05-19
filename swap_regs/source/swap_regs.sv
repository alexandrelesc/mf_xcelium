`timescale 1ns/1ps

module swap_regs (
    input  logic clk,
    input  logic rst,
    output logic [7:0] a,
    output logic [7:0] b
);

    always_ff @(posedge clk)
    begin
        if (rst) begin
            a <= 8'd5;
            b <= 8'd10;
        end
        else begin
            a = b;
            b = a;
        end
    end

endmodule