`timescale 1ns/1ps

module freq_div_config (
    input  logic        clk,
    input  logic        rst,
    input  logic [31:0] div_value,
    output logic        clk_div
);

    logic [31:0] counter;

    always_ff @(posedge clk)
    begin
        if (rst) begin
            counter <= 32'd0;
            clk_div <= 1'b0;
        end
        else begin
            if (counter == div_value - 1) begin
                counter <= 32'd0;
                clk_div <= ~clk_div;
            end
            else begin
                counter <= counter + 1'b1;
            end
        end
    end

endmodule