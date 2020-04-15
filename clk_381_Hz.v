`timescale 1ns / 1ps

module clk_381_Hz(
    input clk_in,
    output reg clk_out
    );
    reg [17:0] counter;
    
    always @(posedge clk_in) begin
        counter = counter + 1;
        clk_out = (counter == 0) ? 1 : 0;
    end
endmodule
