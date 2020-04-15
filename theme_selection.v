`timescale 1ns / 1ps

module theme_selection(
    input btn,
    output reg [15:0] back_col, 
    output reg [15:0] low_col, 
    output reg [15:0] med_col, 
    output reg [15:0] high_col, 
    output reg [15:0] border_col
    );
    
    reg [1:0] theme = 0;
    
    always @ (posedge btn) begin
        theme <= (theme == 2) ? 0 : theme + 1;
        
        case (theme) 

            0:  begin 
                    back_col <= 16'h0000;    // black
                    low_col <= 16'h07E0;     // green
                    med_col <= 16'hFFE0;     // yellow
                    high_col <= 16'hF800;    // green
                    border_col <= 16'hFFFF;  // white
                end

            1: begin
                    back_col = 16'hDFE0;    // yellow
                    low_col = 16'hF80F;     // blue
                    med_col = 16'hC81F;     // teal
                    high_col = 16'h681F;    // green
                    border_col = 16'hFC00;  // blue
               end
            
            2: begin
                    back_col = 16'h3D19;    // blue
                    low_col = 16'h31A6;     // dark grey
                    med_col = 16'h632C;     // grey
                    high_col = 16'hAD55;    // light grey
                    border_col = 16'h0000;  // black
               end
        endcase
    end
endmodule
