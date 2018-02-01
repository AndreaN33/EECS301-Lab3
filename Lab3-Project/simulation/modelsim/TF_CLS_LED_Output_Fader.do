onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /TF_CLS_LED_Output_Fader/CLOCK_50
add wave -noupdate /TF_CLS_LED_Output_Fader/LED_FULL_ON
add wave -noupdate /TF_CLS_LED_Output_Fader/PWM_CHANNEL_SIGS
add wave -noupdate /TF_CLS_LED_Output_Fader/PWM_TIMER_TICK
add wave -noupdate /TF_CLS_LED_Output_Fader/FADE_TIMER_TICK
add wave -noupdate /TF_CLS_LED_Output_Fader/LEDR
add wave -noupdate -divider CLS_LED_Output_Fader
add wave -noupdate -radix hexadecimal /TF_CLS_LED_Output_Fader/uut/led_brightness_reg
add wave -noupdate -radix hexadecimal /TF_CLS_LED_Output_Fader/uut/led_mux_select
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {1050 us}
run 1 ms
