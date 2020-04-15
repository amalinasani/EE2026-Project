`timescale 1ns / 1ps

module display_mode(
    input [15:0] volbar_mode,
    input [15:0] drake_mode,
    input [15:0] piano_mode,
    input [1:0] S,
    output [15:0] OUT
    );
    
    assign OUT = (S[1] ? piano_mode : (S[0] ? drake_mode : volbar_mode));
    
endmodule
