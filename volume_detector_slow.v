`timescale 1ns / 1ps

module volume_detector_slow(
    input clk_in,
    input [11:0] mic_in,
    output reg [3:0] volume_out_lowres,
    output reg [7:0] volume_out_hires,
    output reg [3:0] volume_out_log
    );
    
    reg [13:0] counter = 0;
    reg [11:0] max = 0;
    reg [11:0] min = 12'b111111111111;
    reg [11:0] diff = 0;
    always @(posedge clk_in) begin
        counter = counter + 1;
        if (counter == 0) begin
            diff = max - min;
            volume_out_lowres = diff / 256;
            volume_out_hires = diff / 16;
            if (diff > 12'b100000000000) begin
                volume_out_log<= 12;
            end
            else if (diff > 12'b010000000000) begin
                volume_out_log = 11;
            end
            else if (diff > 12'b001000000000) begin
                volume_out_log = 10;
            end
            else if (diff > 12'b000100000000) begin
                volume_out_log = 9;
            end
            else if (diff > 12'b000010000000) begin
                volume_out_log = 8;        
            end
            else if (diff > 12'b000001000000) begin
                volume_out_log = 7;
            end
            else if (diff > 12'b000000100000) begin
                volume_out_log = 6;        
            end
            else if (diff > 12'b000000010000) begin
                volume_out_log = 5;
            end
            else if (diff > 12'b000000001000) begin
                volume_out_log = 4;                    
            end
            else if (diff > 12'b000000000100) begin
                volume_out_log = 3;
            end
            else if (diff > 12'b000000000010) begin
                volume_out_log = 2;            
            end
            else if (diff > 12'b000000000001) begin
                volume_out_log = 1;
            end
            else begin
                volume_out_log = 0;
            end
            max = 0;
            min = 12'b111111111111;
        end
        else begin
            max = (mic_in > max) ? mic_in : max;
            min = (mic_in < min) ? mic_in : min;
        end
    end
    
endmodule
