`timescale 1ns/1ps

module tb_rom;

    logic clk;
    logic [2:0] addr;
    logic [7:0] data;

    rom dut (
        .clk(clk),
        .addr(addr),
        .data(data)
    );

    always #5 clk = ~clk;

    initial begin

        $dumpfile("rom_sync.vcd");
        $dumpvars(0, rom_sync_tb);

        clk  = 0;
        addr = 0;

        #10;

        addr = 1;
        #10;

        addr = 2;
        #10;

        addr = 3;
        #10;

        addr = 4;
        #10;

        #20 $finish;

    end

    initial begin

        $display("tempo | addr | data");

        $monitor("%4t | %0d | 0x%02h",
                 $time,
                 addr,
                 data);

    end

endmodule