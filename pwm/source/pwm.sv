`timescale 1ns/1ps

module pwm (
    input  logic clk,
    input  logic rst,
    input  logic [7:0] duty,   // nível de controle (0–255)
    output logic pwm_out
);

    logic [7:0] counter;

    always_ff @(posedge clk)
    begin
        if (rst)
        begin
            counter <= 0;
            pwm_out <= 0;
        end
        else
        begin
            counter <= counter + 1;

            if (counter < duty)
                pwm_out <= 1;
            else
                pwm_out <= 0;
        end
    end

endmodule