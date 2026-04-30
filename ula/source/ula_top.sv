module ula_top (
    input  logic [3:0] A,
    input  logic [3:0] B,
    input  logic [1:0] op,
    output logic [3:0] Y
);

    logic [3:0] Y_logico;
    logic [3:0] Y_aritmetico;

    bloco_logico U_LOG (
        .A(A),
        .B(B),
        .sel(op[0]),
        .Y(Y_logico)
    );

    bloco_aritmetico U_ARIT (
        .A(A),
        .B(B),
        .sel(op[0]),
        .Y(Y_aritmetico)
    );

    mux_resultado U_MUX (
        .Y_logico(Y_logico),
        .Y_aritmetico(Y_aritmetico),
        .sel(op[1]),
        .Y(Y)
    );

endmodule
