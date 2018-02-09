`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Case Western Reserve University
// Engineer: Matt McConnell
// 
// Create Date:    00:35:00 01/25/2017 
// Project Name:   EECS301 Digital Design
// Design Name:    Lab #2 Project
// Module Name:    CLS_Fadeout_Timer
// Target Devices: Altera Cyclone V
// Tool versions:  Quartus v15.0
// Description:    PWM Interval Timer
//                 
// Dependencies:   
//
//////////////////////////////////////////////////////////////////////////////////

module CLS_Fadeout_Timer
#(
	parameter CLK_RATE_HZ = 50000000, // Hz
	parameter FADE_RATE_HZ = 10     // Hz
)
(
	// Output Signals
	output reg FADEOUT_TICK,
	
	// System Signals
	input CLK
);

	// Include Standard Functions header file (needed for bit_index())
	`include "StdFunctions.vh"
	
	// Initial Parameters
	initial
	begin
		FADEOUT_TICK <= 1'b0;
	end

	//!! Add Implementation Here !!
	
	//Compute the PWM Interval Counter Parameters
	localparam PWM_INV_TICKS = CLK_RATE_HZ/FADE_RATE_HZ;
	localparam PWM_REG_WIDTH = bit_index(PWM_INV_TICKS);
	localparam [PWM_REG_WIDTH:0] PWM_INV_LOADVAL = {1'b1,{PWM_REG_WIDTH{1'b0}}} - PWM_INV_TICKS[PWM_REG_WIDTH:0] + 1'b1;
	
	
	//Declarations
	wire pwm_inv_tick;
	reg [PWM_REG_WIDTH:0] pwm_inv_count_reg;
	reg  [PWM_REG_WIDTH:0] pdc_count_reg;
	
	// Initialize Registers
	initial
	begin
		pwm_inv_count_reg = PWM_INV_LOADVAL;
	end
	
	
	// PWM Interval Counter
	assign pwm_inv_tick = pwm_inv_count_reg[PWM_REG_WIDTH];
	
	always @(posedge CLK)
	begin
		if(pwm_inv_tick)
			pwm_inv_count_reg <= PWM_INV_LOADVAL;
		else
			pwm_inv_count_reg <= pwm_inv_count_reg + 1'b1;
	end
	
	//register
	always @(posedge CLK)
	begin
		FADEOUT_TICK <= pwm_inv_tick;
	end
	
endmodule
