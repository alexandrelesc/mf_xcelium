module tb;

    logic [3:0] A, B;
    logic [1:0] op;
    logic [3:0] Y;

    ula_top dut (
        .A(A),
        .B(B),
        .op(op),
        .Y(Y)
    );

    initial begin
        A = 4'd5;
        B = 4'd3;

        for (int i = 0; i < 4; i++) begin
            op = i;
            #1;
            $display("op=%b A=%0d B=%0d Y=%0d", op, A, B, Y);
        end

        $finish;
    end

endmodule
