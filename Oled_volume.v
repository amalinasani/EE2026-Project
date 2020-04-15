`timescale 1ns / 1ps

module Oled_volume(
    input clk,
    input [2:0] sw,
    input btnR, btnL,
    input [3:0] volume,
    input [12:0] pixel_index,
    output reg [15:0] pixel_data
    );
    
    reg [3:0] volume_update;
    wire [15:0] back_col;
    wire [15:0] low_col;
    wire [15:0] med_col;
    wire [15:0] high_col;
    wire [15:0] border_col;
    
    theme_selection theme(btnR, back_col, low_col, med_col, high_col, border_col);
    
    reg freeze_mode = 0;
    reg [6:0] x = 0;
    reg [6:0] y = 0;
    
    always @ (posedge btnL) begin
        freeze_mode = (freeze_mode == 0) ? 1 : 0;
    end
    
    always @ (posedge clk) begin
        if (freeze_mode == 0) begin
          volume_update = volume;  
        end
        
        x = pixel_index % 96;
        y = pixel_index / 96;
        
        // 1px border
        if (sw[0] && ~sw[1]) begin
            if (x == 0 || x == 95 || y == 0 || y == 63) begin 
               pixel_data = border_col;
            end
            else begin
                pixel_data = back_col;
            end
        end
            
        // 3px border
        else if (~sw[0] && sw[1]) begin
            if (x < 3 || x > 92 || y < 3 || y > 60) begin
               pixel_data = border_col;
            end
            else begin
                pixel_data = back_col;
            end
        end   
        
        // No border     
        else begin
            pixel_data = back_col;
        end
        
        // Volume bar
        if (sw[2]) begin 
            if ((x > 41 && x <= 53) && (y <= 60)) begin
                case (volume_update)
                    1:  begin
                            if (y > 56) begin
                                pixel_data = low_col;
                            end
                        end 
                    2:  begin
                            if (y > 53) begin
                                pixel_data = low_col;
                            end
                        end
                    3:  begin
                            if (y > 50) begin
                                pixel_data = low_col;
                            end
                        end
                    4:  begin
                            if (y > 47) begin
                                pixel_data = low_col;
                            end
                        end
                    5:  begin
                            if (y > 44) begin
                                pixel_data = low_col;
                            end
                        end
                        
                    6:  begin
                            if (y > 41) begin
                                if (y > 44) begin
                                    pixel_data = low_col;
                                end
                                else begin
                                    pixel_data = med_col;
                                end
                            end
                        end 
                    7:  begin
                            if (y > 38) begin
                                if (y > 44) begin
                                    pixel_data = low_col;
                                end
                                else begin
                                    pixel_data = med_col;
                                end
                            end
                        end
                    8:  begin
                            if (y > 35) begin
                                if (y > 44) begin
                                    pixel_data = low_col;
                                end
                                else begin
                                    pixel_data = med_col;
                                end
                            end
                        end
                    9:  begin
                            if (y > 32) begin
                                if (y > 44) begin
                                    pixel_data = low_col;
                                end
                                else begin
                                    pixel_data = med_col;
                                end
                            end
                        end
                    10:  begin
                            if (y > 29) begin
                                if (y > 44) begin
                                    pixel_data = low_col;
                                end
                                else begin
                                    pixel_data = med_col;
                                end
                            end
                        end
                    11:  begin
                            if (y > 26) begin
                                if (y > 29) begin
                                    if (y > 44) begin
                                        pixel_data = low_col;
                                    end
                                    else begin
                                        pixel_data = med_col;
                                    end
                                end
                                else begin
                                    pixel_data = high_col;
                                end
                            end
                        end
                    12:  begin
                            if (y > 23) begin
                                if (y > 29) begin
                                    if (y > 44) begin
                                        pixel_data = low_col;
                                    end
                                    else begin
                                        pixel_data = med_col;
                                    end
                                end
                                else begin
                                    pixel_data = high_col;
                                end
                            end
                        end
                    13:  begin
                            if (y > 20) begin
                                if (y > 29) begin
                                    if (y > 44) begin
                                        pixel_data = low_col;
                                    end
                                    else begin
                                        pixel_data = med_col;
                                    end
                                end
                                else begin
                                    pixel_data = high_col;
                                end
                            end
                        end
                    14:  begin
                            if (y > 17) begin
                                if (y > 29) begin
                                    if (y > 44) begin
                                        pixel_data = low_col;
                                    end
                                    else begin
                                        pixel_data = med_col;
                                    end
                                end
                                else begin
                                    pixel_data = high_col;
                                end
                            end
                        end
                    15: begin
                            if (y > 14) begin
                                if (y > 29) begin
                                    if (y > 44) begin
                                        pixel_data = low_col;
                                    end
                                    else begin
                                        pixel_data = med_col;
                                    end
                                end
                                else begin
                                    pixel_data = high_col;
                                end
                            end
                        end
                endcase
            end 
        end     
    end
    
endmodule
