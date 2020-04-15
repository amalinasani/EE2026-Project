`timescale 1ns / 1ps

module seven_seg_driver(
    input [6:0] digit1,
    input [6:0] digit2,
    input [6:0] digit3,
    input [6:0] digit4,
    input clk_in,
    input flash,
    input [1:0] an_toflash,
    output reg [6:0] seg,
    output reg [3:0] an,
    output reg dp
    );
    
    reg [1:0] an_pos = 0;
    reg [6:0] curr_digit;
    
    digit_selector selector(digit1, digit2, digit3, digit4, an_pos, curr_digit);
    
    always @(posedge clk_in) begin
        if(((3 - an_toflash) == an_pos) && flash == 1) begin
            an = 4'b1111;
        end
        else begin
            an = ~(4'b1000 >> an_pos);
        end
        seg = curr_digit;       
        an_pos = an_pos + 1;  
    end
    
endmodule
