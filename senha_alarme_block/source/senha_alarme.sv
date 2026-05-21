module senha_alarme (
    input  logic clk,
    input  logic rst,
    input  logic enter,
    input  logic [3:0] senha,

    output logic ok,
    output logic alarme,
    output logic [2:0] tentativas
);

    logic senha_correta;

    // =====================================
    // LÓGICA COMBINACIONAL
    // =====================================
    always_comb begin
        senha_correta = (senha == 4'b1010);
    end

    // =====================================
    // LÓGICA SEQUENCIAL
    // =====================================
    always_ff @(posedge clk or posedge rst) begin

        if (rst) begin
            ok         <= 0;
            alarme     <= 0;
            tentativas <= 0;
        end

        else if (enter) begin

            // SENHA CORRETA
            if (senha_correta) begin
                ok         <= 1;
                alarme     <= 0;
                tentativas <= 0;
            end

            // SENHA ERRADA
            else begin

                ok <= 0;

                if (tentativas < 5)
                    tentativas <= tentativas + 1;

                // dispara alarme na 5ª tentativa
                if (tentativas == 4)
                    alarme <= 1;
            end
        end
    end

endmodule