`timescale 1ns/1ps

module senha_alarme_tb;

    logic clk, rst, enter;
    logic [3:0] senha;
    logic ok, alarme;

    senha_alarme dut (
        .clk(clk),
        .rst(rst),
        .enter(enter),
        .senha(senha),
        .ok(ok),
        .alarme(alarme)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("senha_alarme.vcd");
        $dumpvars(0, senha_alarme_tb);

        clk = 0;
        rst = 1;
        enter = 0;
        senha = 4'b0000;

        #10 rst = 0;

        // senha errada
        senha = 4'b0011;
        enter = 1;
        #10 enter = 0;

        #10;

        // senha correta
        senha = 4'b1010;
        enter = 1;
        #10 enter = 0;

        #20 $finish;
    end

endmodule