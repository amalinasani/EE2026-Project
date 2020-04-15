`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
//
//  FILL IN THE FOLLOWING INFORMATION:
//
//  LAB SESSION DAY: THURSDAY P.M
//
//  STUDENT A NAME: NEIL BANERJEE
//  STUDENT A MATRICULATION NUMBER: A0201175U
//
//  STUDENT B NAME: NUR AMALINA BINTE MOHAMED SANI
//  STUDENT B MATRICULATION NUMBER: A0205174M
//
//////////////////////////////////////////////////////////////////////////////////


module Top_Student (
    input  J_MIC3_Pin3,     // Connect from this signal to Audio_Capture.v
    output J_MIC3_Pin1,     // Connect to this signal from Audio_Capture.v
    output J_MIC3_Pin4,     // Connect to this signal from Audio_Capture.v
    input CLK100MHZ,
    input [15:0] sw,
    input btnC, btnR, btnL,
    output reg [15:0]led,
    output [6:0]seg,
    output [3:0]an,
    output dp,
    output cs, sdin, sclk, d_cn, resn, vccen, pmoden
    );
    
    // Clock signals
    wire clk_mic, clk_dis, clk_deb; 
    clk_20_KHz audioclock(CLK100MHZ, clk_mic);
    clk6p25m displayclock(CLK100MHZ, clk_dis);
    clk_381_Hz debounceclock(CLK100MHZ, clk_deb);
    
    
    ////////////////////////////// MICROPHONE /////////////////////////////////
    
    wire [4:0] digit3;
    wire [4:0] digit2; 
    wire [4:0] digit1; 
    wire [4:0] digit0;
    
    wire [11:0]mic_in;          // Input from the microphone

    wire [3:0] volume_lowres;   // Last sampled volume of the sound going into the microphone. USE THIS FOR ALL DISPLAYS: LED, 7-seg, OLED etc. 
    wire [7:0] volume_hires;
    wire [3:0] volume_log;
    
    wire [3:0] volume_lowres_slow;
    wire [3:0] volume_lowres_fast;
    wire [7:0] volume_hires_slow; 
    wire [7:0] volume_hires_fast;
    wire [3:0] volume_log_slow; 
    wire [7:0] volume_log_fast;
    
    wire [3:0] freq;
    wire [3:0] note;
    
    volume_detector_slow slow_detector(clk_mic, mic_in, volume_lowres_slow, volume_hires_slow, volume_log_slow);
    volume_detector_fast fast_detector(clk_mic, mic_in, volume_lowres_fast, volume_hires_fast, volume_log_fast);
  
    volume_selector volume_demux(volume_lowres_slow, volume_hires_slow, volume_log_slow, volume_lowres_fast, volume_hires_fast, volume_log_fast, sw[15], volume_lowres, volume_hires, volume_log);
    
    always @(posedge CLK100MHZ) begin
        led = (sw[0] == 1) ?  mic_in : (16'b1111111111111111 >> ((sw[11] == 1) ? 16 - freq : 16 - volume_lowres));
    end

    frequency_calculator calculator(mic_in, volume_lowres_fast, clk_mic, freq, note);
    
    seg_selector sevensegdigitselector(volume_lowres, volume_hires, volume_log, sw[14:11], CLK100MHZ, digit3, digit2, digit1, digit0);
    
    seven_seg sevensegmod(digit3, digit2, digit1, digit0, clk_deb, 0, 0, seg, an, dp);
    
    Audio_Capture audiomod(CLK100MHZ, clk_mic, J_MIC3_Pin3, J_MIC3_Pin1, J_MIC3_Pin4, mic_in);
    
    
    
   ////////////////////////////////// DISPLAY /////////////////////////////////////
   
   wire clk, frame_begin, sending_pixels, sample_pixel, teststate; 
   wire [15:0] pixel_data;  // the pixel colour to be sent to the OLED
   wire [12:0] pixel_index;
   
   wire reset;
   wire right_btn;     
   wire left_btn;
   switch_debouncer reset_button (btnC, clk_deb, reset);        // Button to reset display
   switch_debouncer right_button (btnR, clk_deb, right_btn);    // Button to change colour theme 
   switch_debouncer left_button (btnL, clk_deb, left_btn);      // Button to freeze frame
   
   // Data for pixel_data
   wire [15:0] vol_data;
   wire [15:0] drake_data;
   wire [15:0] piano_data;
    
   // Display Modes    
   Oled_volume displayvolume(clk_dis, sw[3:1], right_btn, left_btn, volume_lowres, pixel_index, vol_data); // Volume bar mode
   drake covsplan(clk_dis, volume_lowres, pixel_index, drake_data); // Drake mode
   piano ypphard(clk_dis, note, pixel_index, piano_data);           // Piano mode
   
   display_mode mode(vol_data, drake_data, piano_data, sw[11:10], pixel_data);
   
   Oled_Display displaymod(clk_dis, reset, frame_begin, sending_pixels, sample_pixel, pixel_index, pixel_data, cs, sdin, sclk, d_cn, resn, vccen, pmoden,teststate);

endmodule