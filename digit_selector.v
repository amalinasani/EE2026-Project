`timescale 1ns / 1ps

module digit_selector(
    input [6:0] digit1,
    input [6:0] digit2,
    input [6:0] digit3,
    input [6:0] digit4,
    input [1:0] select,
    input [6:0] digitout
    );
    
    assign digitout = (select == 0) ? digit1 : (select == 1) ? digit2 : (select == 2) ? digit3 : digit4;
    
endmodule
