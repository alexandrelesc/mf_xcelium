`timescale 1ns/1ps

module rom_simples (
    input  logic [2:0] addr,
    output logic [7:0] data
);

    always_comb begin
        case (addr)
            3'd0: data = 8'h10;
            3'd1: data = 8'h22;
            3'd2: data = 8'h35;
            3'd3: data = 8'h47;
            3'd4: data = 8'h59;
            3'd5: data = 8'h6A;
            3'd6: data = 8'h7C;
            3'd7: data = 8'h8F;
            default: data = 8'h00;
        endcase
    end

endmodule