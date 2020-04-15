`timescale 1ns / 1ps

module seven_seg(
    input [4:0] digit1,
    input [4:0] digit2,
    input [4:0] digit3,
    input [4:0] digit4,
    input clk_in,
    input flash,
    input [1:0] an_toflash,
    output [6:0] seg,
    output [3:0] an,
    output dp
    );
    
    wire[6:0] digit1_decoded, digit2_decoded, digit3_decoded, digit4_decoded;
    
    seven_seg_decoder decoder_1(digit1, clk_in, digit1_decoded);
    seven_seg_decoder decoder_2(digit2, clk_in, digit2_decoded);
    seven_seg_decoder decoder_3(digit3, clk_in, digit3_decoded);
    seven_seg_decoder decoder_4(digit4, clk_in, digit4_decoded);
    
    seven_seg_driver driver(digit1_decoded, digit2_decoded, digit3_decoded, digit4_decoded, clk_in, flash, an_toflash, seg, an, dp);
    
endmodule
