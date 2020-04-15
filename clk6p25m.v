`timescale 1ns / 1ps

module clk6p25m(
    input clk_in,
    output reg clk_out
    );
    reg [3:0] counter;
    
    always @(posedge clk_in) begin
        counter = counter + 1;
        clk_out = (counter == 0) ? 1 : 0;
    end
endmodule
