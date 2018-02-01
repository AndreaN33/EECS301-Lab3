`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Case Western Reserve University
// Engineer: Matt McConnell
// 
// Create Date:    10:40:00 09/11/2017 
// Project Name:   EECS301 Digital Design
// Design Name:    Lab #3 Project
// Module Name:    TF_CLS_LED_Output_Fader
// Target Devices: Altera Cyclone V
// Tool versions:  Quartus v17.0
// Description:    CLS LED Output Fader Test Bench
//
// Dependencies:   
//
//////////////////////////////////////////////////////////////////////////////////

module TF_CLS_LED_Output_Fader();

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
	reg        LED_FULL_ON;
	wire [6:0] PWM_CHANNEL_SIGS;
	wire       PWM_TIMER_TICK;
	wire       FADE_TIMER_TICK;
	wire       LEDR;
	
	CLS_LED_Output_Fader uut
	(
		// Input Signals
		.LED_FULL_ON( LED_FULL_ON ),
		.PWM_CHANNEL_SIGS( PWM_CHANNEL_SIGS ),
		.PWM_TIMER_TICK( PWM_TIMER_TICK ),
		.FADE_TIMER_TICK( FADE_TIMER_TICK ),
		
		// Output Signals
		.LEDR( LEDR ),
		
		// System Signals
		.CLK( CLOCK_50 )
	);

	
	//
	// Fadeout Timer Emulation
	//
	// Use the CLS_Fadeout_Timer module to generate the FADE_TIMER_TICK
	//
	localparam FADE_RATE_HZ = 10000; // 10 kHz
	
	CLS_Fadeout_Timer
	#(
		.CLK_RATE_HZ( CLK_RATE_HZ ),
		.FADE_RATE_HZ( FADE_RATE_HZ )
	)
	fadeout_timer
	(
		// Output Signals
		.FADEOUT_TICK( FADE_TIMER_TICK ),
		
		// System Signals
		.CLK( CLOCK_50 )
	);
	
	
	//
	// PWM Channel Emulation
	//
	// Generate PWM waveform signals for each PWM channel
	//
	localparam PWM_DUTY_RATE = 100000; // 100 kHz
	
	//
	// PWM Interval Timer
	//
	CLS_PWM_Interval_Timer
	#(
		.CLK_RATE_HZ( CLK_RATE_HZ ), // Hz
		.DUTY_RATE_HZ( PWM_DUTY_RATE ) // Hz
	)
	pwm_interval_timer
	(
		// Output Signals
		.PWM_TICK( PWM_TIMER_TICK ),
		
		// System Signals
		.CLK( CLOCK_50 )
	);
	
	
	//
	// PWM Duty Cycle Timer (one per LED channel)
	// 
	// Note: A generate block is used here to simplify instantiating 8
	//       instances of the same module.
	//
	localparam [7*7-1:0] PWM_DutyCycle_List = { 7'd100, 7'd50, 7'd25, 7'd13, 7'd6, 7'd3, 7'd1 };
		
	genvar i;  // General purpose variable used by generate for loops
	
	generate
	begin
	
		for (i=0; i < 7; i=i+1)
		begin : PWM_Channels
		
			//
			// PWM Duty Cycle Timer
			//
			CLS_PWM_DutyCycle_Timer
			#(
				.CLK_RATE_HZ( CLK_RATE_HZ ), // MHz
				.DUTY_RATE_HZ( PWM_DUTY_RATE ), // Hz
				.DUTY_PERCENT( PWM_DutyCycle_List[7*i +:7] ) // Cycle On-time %
			)
			pwm_dutycycle_timer
			(
				// Input Signals
				.PWM_INTERVAL_TICK( PWM_TIMER_TICK ),
				
				// Output Signals
				.PWM_OUT( PWM_CHANNEL_SIGS[i] ),
				
				// System Signals
				.CLK( CLOCK_50 )
			);
	
		end
		
	end
	endgenerate
	
	
	
	//
	// Test Stimulus
	//
	
	initial
	begin
	
		// Initialize Signals
		LED_FULL_ON = 1'b0;
		
		#1000;

		//
		// Begin Testing
		//
		
		// Wait for two PWM Timer cycles
		@(posedge PWM_TIMER_TICK);
		@(posedge PWM_TIMER_TICK);
		
		
		// Activate the LED for one Fade Timer cycle
		@(posedge CLOCK_50);  // Align input signals with Clock
		LED_FULL_ON = 1'b1;
		
		@(posedge FADE_TIMER_TICK);
		
		// Deassert the LED_FULL_ON signal
		@(posedge CLOCK_50);
		LED_FULL_ON = 1'b0;
		
		
		// Verify Fadeout Sequence
		//
		// Simulate 1 mS of time for full sequence
	
	end
	
endmodule
