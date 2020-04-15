`timescale 1ns / 1ps

module drake(
    input clk,
    input [3:0] volume,
    input [12:0] pixel_index,
    output reg [15:0] pixel_data
    );

    reg [15:0] no [0:6143];
    reg [15:0] yes [0:6143];  
    
    initial begin
        $readmemb("drakeno.mem", no);
        $readmemb("drakeyes.mem", yes);
    end
    
    always @ (posedge clk) begin
        pixel_data = (volume >= 5 && volume <= 10) ? yes [pixel_index] : no [pixel_index];
    end

endmodule
