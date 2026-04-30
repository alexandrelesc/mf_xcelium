module bloco_logico (
    input  logic [3:0] A,
    input  logic [3:0] B,
    input  logic       sel,
    output logic [3:0] Y
);

    always_comb begin
        case (sel)
            1'b0: Y = A & B;
            1'b1: Y = A | B;
            default: Y = 4'b0000;
        endcase
    end

endmodule
