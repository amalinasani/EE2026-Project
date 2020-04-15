`timescale 1ns / 1ps

module frequency_calculator(
    input [11:0] audio_in,
    input [3:0] volume_in,
    input clk,
    output reg [3:0] frequency,
    output reg [3:0] note // note represents musical note, where A is 0, Bb is 1, B is 2, C is 3 etc. etc. 
    );
    
    reg [15:0] counter = 0;
    reg [13:0] counter2 = 0;
    reg [3:0] note_temp;
    
    
    always @(posedge clk) begin
        if(counter2 == 0) begin
            note = note_temp;
        end
        counter2 = counter2 + 1;
        if(audio_in > 12'd1980 && audio_in < 12'd2000 && volume_in > 0) begin
            if(counter > 16'd111) begin
                frequency = 0;
                note_temp = 0;            
            end
            else if(counter > 16'd105) begin
                frequency = 1;
                note_temp = 1;                        
            end
            else if(counter > 16'd99) begin
                frequency = 2;
                note_temp = 2;                        
            end
            else if(counter > 16'd93) begin
                frequency = 3;
                note_temp = 3;           
            end  
            else if(counter > 16'd88) begin
                frequency = 4; 
                note_temp = 4;                      
            end
            else if(counter > 16'd83) begin
                frequency = 5;
                note_temp = 5;            
            end
            else if(counter > 16'd79) begin
                frequency = 6; 
                note_temp = 6;                       
            end
            else if(counter > 16'd74) begin
                frequency = 7;
                note_temp = 7;                       
            end
            else if(counter > 16'd70) begin
                frequency = 8; 
                note_temp = 8;           
            end
            else if(counter > 16'd66) begin
                frequency = 9;
                note_temp = 9;                        
            end
            else if(counter > 16'd62) begin
                frequency = 10;
                note_temp = 10;                       
            end
            else if(counter > 16'd59) begin
                frequency = 11; 
                note_temp = 11;           
            end                    
            counter = 0;
        end
        else begin
            counter = counter + 1; // counter increments every 40.96 microseconds
        end
    end
    
endmodule