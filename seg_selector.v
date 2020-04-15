`timescale 1ns / 1ps

module seg_selector(
    input [3:0] volume_lowres,
    input [7:0] volume_highres,
    input [3:0] volume_log,
    input [3:0] note,
    input [3:0] sw,
    input clk,
    output reg [4:0] digit3, 
    output reg [4:0] digit2,
    output reg [4:0] digit1,
    output reg [4:0] digit0    
    );
    
    always @(posedge clk) begin
        // high-resolution display mode
        if(sw[3] == 1) begin
            digit3 = 18;
            digit2 = (volume_highres >= 100) ? volume_highres / 100 : 18;
            digit1 = (volume_highres >= 10) ? ((volume_highres / 10) % 10) : 18;
            digit0 = volume_highres % 10; 
        end
        // log display mode
        else if(sw[2] == 1) begin
            digit3 = 18;
            digit2 = 18;
            digit1 = (volume_log / 10 > 0) ? volume_log / 10 : 18;
            digit0 = volume_log % 10;
        end
        // bar display mode
        else if(sw[1] == 1) begin
            digit3 = (volume_lowres >= 14) ? 10 : (volume_lowres >= 12) ? 1 : 18;
            digit2 = (volume_lowres >= 10) ? 10 : (volume_lowres >= 8) ? 1 : 18;
            digit1 = (volume_lowres >= 6) ? 10 : (volume_lowres >= 4) ? 1 : 18;
            digit0 = (volume_lowres >= 2) ? 10 : (volume_lowres >= 0) ? 1 : 18;
        end
        else if(sw[0] == 1) begin
            digit3 = 18;
            if(note == 0 || note == 11) begin
                digit2 = 11;
            end
            if(note == 1 || note == 2) begin
                digit2 = 12;
            end
            if(note == 3 || note == 4) begin
                digit2 = 13;
            end
            if(note == 5) begin
                digit2 = 14;
            end
            if(note == 6 || note == 7) begin
                digit2 = 15;
            end
            if(note == 8 || note == 9) begin
                digit2 = 16;
            end
            if(note == 10) begin
                digit2 = 17;
            end
            if(note == 11 || note == 1 || note == 6) begin
                digit1 = 12;
            end
            else if(note == 4 || note == 9) begin
                digit1 = 5;
            end
            else begin
                digit1 = 18;
            end
            digit0 = 18;
        end
        // normal display mode
        else begin
            digit3 = 18;
            digit2 = 18;
            digit1 = (volume_lowres >= 10) ? volume_lowres / 10 : 18;
            digit0 = volume_lowres % 10;
        end
    end
    
endmodule