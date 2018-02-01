`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Case Western Reserve University
// Engineer: Matt McConnell
// 
// Create Date:    14:48:00 09/10/2017 
// Project Name:   EECS301 Digital Design
// Design Name:    Lab #3 Project
// Module Name:    CLS_LED_Output_Fader
// Target Devices: Altera Cyclone V
// Tool versions:  Quartus v17.0
// Description:    CLS LED Output Fader
//
//                 The LED Output Fader will set the LEDR output to full brightness
//                 when the LED_FULL_ON signal is asserted.  When released,
//                 the LED output is decreased one step per FADE_TIMER_TICK.
//                 Any changes to the LED output should happen on the assertion
//                 of PWM_TIMER_TICK.
//                 
// Dependencies:   
//
//////////////////////////////////////////////////////////////////////////////////

module CLS_LED_Output_Fader
(
	// Input Signals
	input            LED_FULL_ON,
	input      [6:0] PWM_CHANNEL_SIGS,
	input            PWM_TIMER_TICK,
	input            FADE_TIMER_TICK,
	
	// Output Signals
	output reg       LEDR,
	
	// System Signals
	input CLK
);

	//
	// Initialize Register values
	//
	reg  [2:0] led_mux_select;
	reg  [2:0] led_brightness_reg;
	
	initial
	begin
		LEDR <= 1'b0;
		led_mux_select <= 3'h0;
		led_brightness_reg <= 3'h0;
	end
	
	
	//
	// Current Brightness Register
	//
	// Set the register to full brightness when LED_FULL_ON asserts.
	// Decrement register until 0 on each FADE_TIMER_TICK assertion.
	//

	// !! LAB 3: Add led_brightness_reg implementation here !!
	
	
	//
	// Syncronize mux changes with the PWM timer tick
	//
	// Load led_mux_select with led_brightness_reg value when 
	//   PWM_TIMER_TICK asserts.
	//

	// !! LAB 3: Add led_mux_select implementation here !!
	
	
	//
	// LED Output PWM Multiplexer
	//

	// !! LAB 3: Add LEDR implementation here !!
	
endmodule
