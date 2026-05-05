`timescale 1ns/1ps

module tb_pwm;

    logic clk;
    logic rst;
    logic [7:0] duty;
    logic pwm_out;

    // Instância do DUT
    pwm dut (
        .clk(clk),
        .rst(rst),
        .duty(duty),
        .pwm_out(pwm_out)
    );

    // Clock (10 ns período)
    initial begin 
		clk = 0;
	end
		
    always #5 clk = ~clk;

    // Estímulos
    initial begin
        // Dump waveform
        $dumpfile("pwm.vcd");
        $dumpvars(0, tb_pwm);

        rst = 1;
        duty = 0;

        #20;
        rst = 0;

        // 25% duty
        duty = 8'd64;
        #2000;

        // 50% duty
        duty = 8'd128;
        #2000;

        // 75% duty
        duty = 8'd192;
        #2000;

        // 100% (quase)
        duty = 8'd255;
        #2000;

        $finish;
    end

endmodule