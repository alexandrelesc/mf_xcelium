module semaforo_pedestre (
    input  logic [1:0] estado,
    input  logic       pedestre,

    output logic main_red,
    output logic main_yellow,
    output logic main_green,

    output logic ped_red,
    output logic ped_green
);

    // -------------------------------------------------
    // Bloco 1: controle das luzes da via principal
    // -------------------------------------------------
    always_comb begin
        main_red    = 1'b0;
        main_yellow = 1'b0;
        main_green  = 1'b0;

        case (estado)
            2'b00: main_green  = 1'b1; // via principal liberada
            2'b01: main_yellow = 1'b1; // atenção
            2'b10: main_red    = 1'b1; // via principal parada
            2'b11: main_red    = 1'b1; // estado de transição/segurança
            default: begin
                main_red    = 1'b1;
                main_yellow = 1'b0;
                main_green  = 1'b0;
            end
        endcase
    end

    // -------------------------------------------------
    // Bloco 2: controle das luzes do pedestre
    // -------------------------------------------------
    always_comb begin
        ped_red   = 1'b1;
        ped_green = 1'b0;

        if ((estado == 2'b10) && (pedestre == 1'b1)) begin
            ped_red   = 1'b0;
            ped_green = 1'b1;
        end
    end

endmodule
