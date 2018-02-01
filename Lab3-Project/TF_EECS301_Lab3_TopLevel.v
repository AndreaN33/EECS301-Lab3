`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Case Western Reserve University
// Engineer: Matt McConnell
// 
// Create Date:    19:42:00 09/01/2017 
// Project Name:   EECS301 Digital Design
// Design Name:    Lab #2 Project
// Module Name:    TF_EECS301_Lab3_TopLevel
// Target Devices: Altera Cyclone V
// Tool versions:  Quartus v17.0
// Description:    EECS301 Lab3 Top Level Test Bench
//                 
// Dependencies:   
//
//////////////////////////////////////////////////////////////////////////////////

module TF_EECS301_Lab3_TopLevel();


	//
	// System Clock Emulation
	//
	// Toggle the CLOCK_50 signal every 10 ns to create to 50MHz clock signal
	//
	localparam CLK_RATE_HZ = 50000000; // Hz
	localparam CLK_HALF_PER = ((1.0 / CLK_RATE_HZ) * 1000000000.0) / 2.0; // ns
	
	reg        CLOCK_50;
	
	initial
	begin
		CLOCK_50 = 1'b0;
		forever #(CLK_HALF_PER) CLOCK_50 = ~CLOCK_50;
	end

	
	//
	// Unit Under Test: CLS_LED_Output_Fader
	//
	wire [9:0] LEDR;
	wire [6:0] HEX0;
	wire [6:0] HEX1;
	wire [6:0] HEX2;
	wire [6:0] HEX3;
	wire [6:0] HEX4;
	wire [6:0] HEX5;
	reg  [3:0] KEY;
	reg  [1:0] SW;
	
	EECS301_Lab3_TopLevel
	#(
		// Shorten the delay times for simulation
		.KEY_LOCK_DELAY( 100000 ),  // 100 uS
		.SW_DEBOUNCE_TIME( 100 ),   // 100 nS
		.PWM_DUTY_RATE( 100000 ),   // 100 kHz
		.FADE_RATE_HZ( 10000 )      // 10 kHz
	)
	uut
	(
		// Clock Signals
		.CLOCK_50( CLOCK_50 ),

		// LED Signals
		.LEDR( LEDR ),
		
		// 7-Segment Display Signals (Active-Low)
		.HEX0( HEX0 ),
		.HEX1( HEX1 ),
		.HEX2( HEX2 ),
		.HEX3( HEX3 ),
		.HEX4( HEX4 ),
		.HEX5( HEX5 ),

		// Button Signals (Active-Low)
		.KEY( KEY ),
		
		// Switch Signals
		.SW( SW )
	);

	
	//
	// Test Stimulus
	//
	initial
	begin
		// Initialize Signals
		KEY = 4'hF;  // Active-Low
		SW = 2'h3;
		
		#1000;
		
		
		//
		// Begin Testing
		//
		
		KEY[0] = 1'b0; // Press LED1 Right Button
		
		KEY[3] = 1'b0; // Press LED2 Left Button
		
		// Wait 5 ms
		#5000000;
		
		KEY[0] = 1'b1; // Release LED1 Right Button
		
		KEY[1] = 1'b0; // Press LED1 Left Button
		KEY[3] = 1'b0; // Press LED2 Left Button
		
		// Wait 5 ms
		#5000000;
		
		KEY[3] = 1'b1; // Release LED2 Left Button
		
		KEY[1] = 1'b0; // Press LED1 Left Button
		KEY[2] = 1'b0; // Press LED2 Right Button
		
		
		// Run simulation for 15 mS
		
	end
	
endmodule
