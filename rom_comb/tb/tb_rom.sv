`timescale 1ns/1ps

module rom_simples_tb;

    logic [2:0] addr;
    logic [7:0] data;

    rom dut (
        .addr(addr),
        .data(data)
    );

    initial begin
        $dumpfile("rom_simples.vcd");
        $dumpvars(0, rom_simples_tb);

        $display("tempo | addr | data");
        $display("-------------------");

        addr = 3'd0; #10;
        addr = 3'd1; #10;
        addr = 3'd2; #10;
        addr = 3'd3; #10;
        addr = 3'd4; #10;
        addr = 3'd5; #10;
        addr = 3'd6; #10;
        addr = 3'd7; #10;

        $finish;
    end

    initial begin
        $monitor("%5t |  %0d   | 0x%02h", $time, addr, data);
    end

endmodule