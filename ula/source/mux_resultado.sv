module mux_resultado (
    input  logic [3:0] Y_logico,
    input  logic [3:0] Y_aritmetico,
    input  logic       sel,
    output logic [3:0] Y
);

    always_comb begin
        case (sel)
            1'b0: Y = Y_logico;
            1'b1: Y = Y_aritmetico;
            default: Y = 4'b0000;
        endcase
    end

endmodule
