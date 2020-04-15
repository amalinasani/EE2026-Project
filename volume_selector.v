`timescale 1ns / 1ps

module volume_selector(
    input [3:0] volume_slow_lowres,
    input [7:0] volume_slow_hires,
    input [3:0] volume_slow_log,
    input [3:0] volume_fast_lowres,
    input [7:0] volume_fast_hires,
    input [3:0] volume_fast_log,
    input sw,
    output [3:0] volume_out_lowres,
    output [7:0] volume_out_hires,
    output [3:0] volume_out_log
    );
    
    assign volume_out_lowres = (sw == 0) ? volume_slow_lowres : volume_fast_lowres;
    assign volume_out_hires = (sw == 0) ? volume_slow_hires : volume_fast_hires;
    assign volume_out_log = (sw == 0) ? volume_slow_log : volume_fast_log;
    
endmodule
