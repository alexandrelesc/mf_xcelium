`timescale 1ns/1ps

module tb_senha_alarme;

    logic clk;
    logic rst;
    logic enter;
    logic [3:0] senha;

    logic ok;
    logic alarme;
    logic [2:0] tentativas;

    senha_alarme dut (
        .clk(clk),
        .rst(rst),
        .enter(enter),
        .senha(senha),
        .ok(ok),
        .alarme(alarme),
        .tentativas(tentativas)
    );

    always #5 clk = ~clk;

    task tentativa_errada;
    begin
        senha = 4'b0000;
        enter = 1;
        #10;
        enter = 0;
        #10;
    end
    endtask

    initial begin

        $dumpfile("senha_alarme.vcd");
        $dumpvars(0, senha_alarme_tb);

        clk = 0;
        rst = 1;
        enter = 0;
        senha = 0;

        #10 rst = 0;

        tentativa_errada();
        tentativa_errada();
        tentativa_errada();
        tentativa_errada();
        tentativa_errada();

        #20;

        senha = 4'b1010;
        enter = 1;
        #10;

        $finish;
    end

    initial begin
        $display("tempo | senha | tentativas | ok | alarme");
        $monitor("%4t | %b | %0d | %b | %b",
                 $time, senha, tentativas, ok, alarme);
    end

endmodule