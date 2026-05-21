`timescale 1ns/1ps

module rom (
    input  logic       clk,
    input  logic [2:0] addr,
    output logic [7:0] data
);

    always_ff @(posedge clk) begin

        case (addr)

            3'd0: data <= 8'h11;
            3'd1: data <= 8'h22;
            3'd2: data <= 8'h33;
            3'd3: data <= 8'h44;
            3'd4: data <= 8'h55;
            3'd5: data <= 8'h66;
            3'd6: data <= 8'h77;
            3'd7: data <= 8'h88;

            default: data <= 8'h00;

        endcase

    end

endmodule