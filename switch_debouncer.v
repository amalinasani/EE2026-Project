`timescale 1ns / 1ps

module switch_debouncer(
    input button,
    input clk_in,
    output out
    );
    wire [1:0]q;
    d_flip_flop dff1(button, clk_in, q[0]);
    d_flip_flop dff2(q[0], clk_in, q[1]);
    assign out = q[0] & ~q[1];
endmodule
