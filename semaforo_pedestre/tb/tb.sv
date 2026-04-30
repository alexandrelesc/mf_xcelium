module tb;

    logic [1:0] estado;
    logic pedestre;

    logic main_red;
    logic main_yellow;
    logic main_green;

    logic ped_red;
    logic ped_green;

    semaforo_pedestre dut (
        .estado(estado),
        .pedestre(pedestre),
        .main_red(main_red),
        .main_yellow(main_yellow),
        .main_green(main_green),
        .ped_red(ped_red),
        .ped_green(ped_green)
    );

    task testa(input logic [1:0] estado_t, input logic pedestre_t);
    begin
        estado   = estado_t;
        pedestre = pedestre_t;
        #1;

        $display("estado=%b pedestre=%0d | MAIN: R=%0d Y=%0d G=%0d | PED: R=%0d G=%0d",
                 estado, pedestre,
                 main_red, main_yellow, main_green,
                 ped_red, ped_green);
    end
    endtask

    initial begin
        $display("Teste do semaforo com pedestre");
        $display("--------------------------------");

        testa(2'b00, 1'b0);
        testa(2'b01, 1'b0);
        testa(2'b10, 1'b0);
        testa(2'b11, 1'b0);

        $display("--------------------------------");

        testa(2'b00, 1'b1);
        testa(2'b01, 1'b1);
        testa(2'b10, 1'b1);
        testa(2'b11, 1'b1);

        $finish;
    end

endmodule
