`timescale 1ns/1ps

module tb();

    logic clk;                     // Clock da simulação
    logic rst;                     // Reset
    logic start;                   // Sinal de início

    logic [7:0] dados [0:3];       // Vetor de entrada

    logic [9:0] soma;              // Resultado
    logic done;                    // Fim da operação

    // Instância do módulo testado
    vetor_sum dut(
        .clk(clk),
        .rst(rst),
        .start(start),
        .dados(dados),
        .soma(soma),
        .done(done)
    );

    // Geração de clock com período de 10 unidades de tempo
    always #5 clk = ~clk;

    // Task para carregar vetor e iniciar operação
    task automatic envia_vetor();
        begin
            // Preenche vetor usando for
            for(int i=0;i<4;i++) begin
                dados[i] = i + 1;
            end

            start = 1;             // Ativa início
            #10;                   // Mantém por um ciclo
            start = 0;             // Desativa início
        end
    endtask

    initial begin
        clk = 0;                   // Valor inicial do clock
        rst = 1;                   // Ativa reset
        start = 0;                 // Start inativo

        #20;
        rst = 0;                   // Libera reset

        envia_vetor();             // Executa task de estímulo

        wait(done);                // Espera operação terminar

        $display("Soma = %0d", soma);

        #20;
        $finish;                   // Finaliza simulação
    end

endmodule