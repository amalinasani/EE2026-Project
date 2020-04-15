`timescale 1ns / 1ps

module piano(
    input clk,
    input [3:0] note,
    input [12:0] pixel_index,
    output reg [15:0] pixel_data
    );
    
    reg [15:0] black = 16'h0000;
    reg [15:0] white = 16'hFFFF;
    reg [15:0] highlight = 16'hFFE0;
    
    reg [6:0] x = 0;
    reg [6:0] y = 0;
    
    reg [12:0] key [0:11];
    
    always @ (posedge clk) begin
           x = pixel_index % 96;
           y = pixel_index / 96;
           
        // white keys
        key[0] = ((x >= 3 && x <= 14) && (y >= 37 && y <= 63)) || ((x >= 3 && x <= 12) && (y >= 0 && y <= 36));
        key[2] = ((x >= 16 && x <= 27) && (y >= 37 && y <= 63)) || ((x >= 18 && x <= 25) && (y >= 0 && y <= 36));
        key[4] = ((x >= 29 && x <= 40) && (y >= 37 && y <= 63)) || ((x >= 31 && x <= 40) && (y >= 0 && y <= 36));
        key[5] = ((x >= 42 && x <= 53) && (y >= 37 && y <= 63)) || ((x >= 42 && x <= 51) && (y >= 0 && y <= 36));
        key[7] = ((x >= 55 && x <= 66) && (y >= 37 && y <= 63)) || ((x >= 57 && x <= 64) && (y >= 0 && y <= 36));
        key[9] = ((x >= 68 && x <= 79) && (y >= 37 && y <= 63)) || ((x >= 70  && x <= 76) && (y >= 0 && y <= 36));
        key[11] = ((x >= 81 && x <= 92) && (y >= 37 && y <= 63)) || ((x >= 82 && x <= 92) && (y >= 0 && y <= 36));
        
    
        // Black keys
        key[1] = (x >= 13 && x <= 17) && (y >= 0 && y <= 36);
        key[3] = (x >= 26 && x <= 30) && (y >= 0 && y <= 36);
        key[6] = (x >= 52 && x <= 56) && (y >= 0 && y <= 36);
        key[8] = (x >= 65 && x <= 69) && (y >= 0 && y <= 36);
        key[10] = (x >= 78 && x <= 82) && (y >= 0 && y <= 36);
        
        // Piano initial
        if (key[0] || key[2] || key[4] || key[5] || key[7] || key[9] || key[11]) begin
            pixel_data = white;
        end
        else if (key[1] || key[3] || key[6] || key[8] || key[10]) begin
            pixel_data = black;
        end
        else begin
            pixel_data = black;
        end
        
        case(note)
            0:  begin
                    if(key[0]) begin
                        pixel_data = highlight;
                    end
                end
            1:  begin
                    if(key[1]) begin
                        pixel_data = highlight;
                    end
                
                end
            2:  begin
                    if(key[2]) begin
                        pixel_data = highlight;
                    end
                end
            3:  begin
                    if(key[3]) begin
                        pixel_data = highlight;
                    end     
                end
            4:  begin
                    if(key[4]) begin
                        pixel_data = highlight;
                    end        
                end
            5:  begin
                    if(key[5]) begin
                        pixel_data = highlight;
                    end          
                end
            6:  begin
                    if(key[6]) begin
                        pixel_data = highlight;
                    end              
                end
            7:  begin
                    if(key[7]) begin
                        pixel_data = highlight;
                    end       
                end
            8:  begin
                    if(key[8]) begin
                        pixel_data = highlight;
                    end                      
                end
            9:  begin
                    if(key[9]) begin
                        pixel_data = highlight;
                    end                           
                end
            10: begin
                  if(key[10]) begin
                        pixel_data = highlight;
                    end                              
                end
            11: begin
                    if(key[11]) begin
                        pixel_data = highlight;
                    end                                   
                end 
  
        endcase
    end
    
endmodule
