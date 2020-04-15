`timescale 1ns / 1ps

module seven_seg_decoder(
    input [4:0] digit,
    input clk_in,
    output reg [6:0] disp
    );
    always @(posedge clk_in) begin
        case (digit)
            0: //0 or O
            disp = 7'b1000000;
            1: //1
            disp = 7'b1111001;
            2: //2
            disp = 7'b0100100;
            3: //3
            disp = 7'b0110000;
            4: //4
            disp = 7'b0011001;
            5: //5
            disp = 7'b0010010;
            6: //6
            disp = 7'b0000010;
            7: //7
            disp = 7'b1111000;
            8: //8
            disp = 7'b0000000;
            9: //9
            disp = 7'b0010000;
            
            10: //two lines (||)
            disp = 7'b1001001;
            
            11: //A
            disp = 7'b0001000;
            12: //B
            disp = 7'b0000011; 
            13: //C
            disp = 7'b1000110;
            14: //D
            disp = 7'b0100001;
            15: //E
            disp = 7'b0000110;
            16: //F
            disp = 7'b0001110;
            17: //G
            disp = 7'b1000010;
            
            18: //blank
            disp = 7'b1111111;
            
        endcase
    end
endmodule