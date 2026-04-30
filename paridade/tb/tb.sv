module tb;

    logic [3:0] dados;
    logic par;
    logic impar;

    paridade dut (
        .dados(dados),
        .par(par),
        .impar(impar)
    );

    initial begin
        $display("Teste do detector de paridade");
        $display("--------------------------------");
        $display("dados | par impar");
        $display("--------------------------------");

        // Gera todas as combinações de 4 bits
        for (int i = 0; i < 16; i++) begin
            dados = i;
            #1;

            $display("%04b  |  %0d    %0d", dados, par, impar);
        end

        $finish;
    end

endmodule
