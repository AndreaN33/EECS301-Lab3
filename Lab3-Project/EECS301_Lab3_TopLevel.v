`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Case Western Reserve University
// Engineer: Matt McConnell
// 
// Create Date:    19:42:00 09/01/2017 
// Project Name:   EECS301 Digital Design
// Design Name:    Lab #2 Project
// Module Name:    EECS301_Lab3_TopLevel
// Target Devices: Altera Cyclone V
// Tool versions:  Quartus v17.0
// Description:    EECS301 Lab3 Top Level File
//                 
// Dependencies:   
//
//////////////////////////////////////////////////////////////////////////////////

module EECS301_Lab3_TopLevel
#(
	// These parameters are listed here so they can be overridden in simulation.
	parameter KEY_LOCK_DELAY = 80000000, // 80 mS
	parameter SW_DEBOUNCE_TIME = 10000000, // 10 mS
	parameter PWM_DUTY_RATE = 1000, // 1 kHz
	parameter FADE_RATE_HZ = 10  // 10 Hz
)
(
	// Clock Signals
	input         CLOCK_50,

	// LED Signals
	output  [9:0] LEDR,
	
	// 7-Segment Display Signals (Active-Low)
	output  [6:0] HEX0,
	output  [6:0] HEX1,
	output  [6:0] HEX2,
	output  [6:0] HEX3,
	output  [6:0] HEX4,
	output  [6:0] HEX5,

	// Button Signals (Active-Low)
	input   [3:0] KEY,
	
	// Switch Signals
	input   [1:0] SW
);

	localparam CLOCK_50_RATE = 50000000; // 50 MHz 

	//
	// Unused LED signals
	//
	assign LEDR = 10'h000;
	
	
	////////////////////////////////////////////////////////
	//
	// Key Input Synchronizers
	//
	wire [3:0] key_event;
	
	genvar i;
	
	generate
	begin
	
		for (i = 0; i < 4; i=i+1)
		begin : key_sync_gen
		
			Key_Synchronizer_Module
			#(
				.CLK_RATE_HZ( CLOCK_50_RATE ),
				.KEY_LOCK_DELAY( KEY_LOCK_DELAY ) // mS
			)
			key_synchronizer
			(
				// Input Signals
				.KEY( KEY[i] ),
				
				// Output Signals
				.KEY_EVENT( key_event[i] ),
				
				// System Signals
				.CLK( CLOCK_50 )
			);
		
		end
		
	end
	endgenerate
	
	
	////////////////////////////////////////////////////////
	//
	// Switch Input Debounce Synchronizers
	//
	wire [1:0] sw_led_enable;
	
	generate
	begin
	
		for (i = 0; i < 2; i=i+1)
		begin : sw_sync_gen

			Switch_Debounce_Synchronizer
			#(
				.CLK_RATE_HZ( CLOCK_50_RATE ),
				.DEBOUNCE_TIME( SW_DEBOUNCE_TIME ), // nS
				.SIG_OUT_INIT( 1'b0 )
			)
			sw_synchronizer
			(
				// Input  Signals (asynchronous)
				.SIG_IN( SW[i] ),
				
				// Output Signals (synchronized to CLK domain)
				.SIG_OUT( sw_led_enable[i] ),
				
				// System Signals
				.CLK( CLOCK_50 )
			);
	
		end
		
	end
	endgenerate
	
	
	////////////////////////////////////////////////////////
	//
	// LED Key Scanner
	//
	wire [15:0] led_out [1:0];
	
	generate
	begin
	
		for (i = 0; i < 2; i=i+1)
		begin : cls_scanners_gen
		
			CLS_Scanner_Module
			#(
				.CLK_RATE_HZ( CLOCK_50_RATE ),
				.LED_NUM( 16 ),
				.PWM_DUTY_RATE( PWM_DUTY_RATE ),
				.FADE_RATE_HZ( FADE_RATE_HZ )
			)
			key_scanner
			(
				// Input Signals
				.RIGHT_KEY_EVENT( key_event[i*2] ),
				.LEFT_KEY_EVENT( key_event[i*2+1] ),
				
				// Output Signals
				.LED_OUT( led_out[i] ),
				
				// System Signals
				.CLK( CLOCK_50 )
			);
			
		end
		
	end
	endgenerate
	
	
	////////////////////////////////////////////////////////
	//
	// 7-Segment Display Mapping
	//
	
	LED_Segment_Mapper led_mapper
	(
		// Control Signals
		.LED_ENABLE_1( sw_led_enable[0] ),
		.LED_ENABLE_2( sw_led_enable[1] ),
		
		// LED Data Signals
		.LED_DATA_1( led_out[0] ),
		.LED_DATA_2( led_out[1] ),
		
		// Output Signals
		.HEX0( HEX0 ),
		.HEX1( HEX1 ),
		.HEX2( HEX2 ),
		.HEX3( HEX3 ),
		.HEX4( HEX4 ),
		.HEX5( HEX5 ),
		
		// System Signals
		.CLK( CLOCK_50 )
	);
	
endmodule
