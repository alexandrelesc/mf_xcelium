module paridade (
    input  logic [3:0] dados,
    output logic       par,
    output logic       impar
);

    logic [2:0] qtd_uns;

    // -------------------------------------------------
    // Bloco 1: conta quantos bits estão em nível lógico 1
    // -------------------------------------------------
    always_comb begin
        qtd_uns = 3'd0;

        for (int i = 0; i < 4; i++) begin
            qtd_uns = qtd_uns + dados[i];
        end
    end

    // -------------------------------------------------
    // Bloco 2: verifica se a quantidade de bits 1 é par ou ímpar
    // -------------------------------------------------
    always_comb begin
        par   = 1'b0;
        impar = 1'b0;

        if (qtd_uns[0] == 1'b0)
            par = 1'b1;
        else
            impar = 1'b1;
    end

endmodule
