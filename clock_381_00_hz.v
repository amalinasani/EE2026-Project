`timescale 1ns / 1ps

module clock_381_00_hz(
    input clk_in,
    output reg clk_out
    );
    reg [17:0] count = 0;
    always @(posedge clk_in) begin
        clk_out = (count == 0);
        count = count + 1;
    end
endmodule
