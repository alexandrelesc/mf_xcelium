`timescale 1ns/1ps

module vetor_sum (
    input  logic clk,              // Sinal de clock
    input  logic rst,              // Reset do circuito
    input  logic start,            // Sinal para iniciar a operação

    input  logic [7:0] dados [0:3],// Vetor com 4 elementos de 8 bits

    output logic [9:0] soma,       // Resultado da soma
    output logic done              // Indica fim da operação
);

    // Estados possíveis da máquina de estados
    typedef enum logic [1:0] {
        IDLE,                      // Estado parado
        SOMANDO,                   // Estado de soma
        FINALIZADO                 // Estado final
    } estado_t;

    estado_t estado, prox_estado;  // Estado atual e próximo estado

    // Struct para agrupar sinais internos de controle
    typedef struct packed {
        logic [9:0] acumulador;    // Guarda soma parcial
        logic [1:0] indice;        // Índice do vetor
    } controle_t;

    controle_t ctrl;               // Variável do tipo struct

    // Função combinacional para somar acumulador com novo dado
    function automatic logic [9:0] soma_elemento(
        input logic [9:0] a,
        input logic [7:0] b
    );
        return a + b;              // Retorna soma
    endfunction

    // Bloco sequencial: atualiza registradores no clock
    always_ff @(posedge clk or posedge rst) begin
        if(rst) begin
            estado <= IDLE;        // Volta ao estado inicial
            ctrl.acumulador <= 0;  // Zera acumulador
            ctrl.indice     <= 0;  // Zera índice
        end
        else begin
            estado <= prox_estado; // Atualiza estado

            case(estado)

                IDLE: begin
                    ctrl.acumulador <= 0; // Prepara nova soma
                    ctrl.indice     <= 0;
                end

                SOMANDO: begin
                    // Soma um elemento por ciclo de clock
                    ctrl.acumulador <= soma_elemento(
                        ctrl.acumulador,
                        dados[ctrl.indice]
                    );

                    ctrl.indice <= ctrl.indice + 1; // Avança índice
                end

                FINALIZADO: begin
                    // Mantém valores até voltar para IDLE
                end

            endcase
        end
    end

    // Bloco combinacional: decide próximo estado e saída done
    always_comb begin
        prox_estado = estado;      // Valor padrão evita latch
        done = 0;                  // Por padrão, ainda não terminou

        case(estado)

            IDLE: begin
                if(start)
                    prox_estado = SOMANDO; // Inicia soma
            end

            SOMANDO: begin
                if(ctrl.indice == 3)
                    prox_estado = FINALIZADO; // Último elemento
            end

            FINALIZADO: begin
                done = 1;          // Operação finalizada
                prox_estado = IDLE;
            end

        endcase
    end

    assign soma = ctrl.acumulador; // Saída recebe acumulador

endmodule