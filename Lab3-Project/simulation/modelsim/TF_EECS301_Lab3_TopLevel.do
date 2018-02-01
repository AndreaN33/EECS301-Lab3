onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /TF_EECS301_Lab3_TopLevel/KEY
add wave -noupdate /TF_EECS301_Lab3_TopLevel/SW
add wave -noupdate -radix hexadecimal -childformat {{{/TF_EECS301_Lab3_TopLevel/HEX0[6]} -radix hexadecimal} {{/TF_EECS301_Lab3_TopLevel/HEX0[5]} -radix hexadecimal} {{/TF_EECS301_Lab3_TopLevel/HEX0[4]} -radix hexadecimal} {{/TF_EECS301_Lab3_TopLevel/HEX0[3]} -radix hexadecimal} {{/TF_EECS301_Lab3_TopLevel/HEX0[2]} -radix hexadecimal} {{/TF_EECS301_Lab3_TopLevel/HEX0[1]} -radix hexadecimal} {{/TF_EECS301_Lab3_TopLevel/HEX0[0]} -radix hexadecimal}} -subitemconfig {{/TF_EECS301_Lab3_TopLevel/HEX0[6]} {-height 15 -radix hexadecimal} {/TF_EECS301_Lab3_TopLevel/HEX0[5]} {-height 15 -radix hexadecimal} {/TF_EECS301_Lab3_TopLevel/HEX0[4]} {-height 15 -radix hexadecimal} {/TF_EECS301_Lab3_TopLevel/HEX0[3]} {-height 15 -radix hexadecimal} {/TF_EECS301_Lab3_TopLevel/HEX0[2]} {-height 15 -radix hexadecimal} {/TF_EECS301_Lab3_TopLevel/HEX0[1]} {-height 15 -radix hexadecimal} {/TF_EECS301_Lab3_TopLevel/HEX0[0]} {-height 15 -radix hexadecimal}} /TF_EECS301_Lab3_TopLevel/HEX0
add wave -noupdate -radix hexadecimal /TF_EECS301_Lab3_TopLevel/HEX1
add wave -noupdate -radix hexadecimal /TF_EECS301_Lab3_TopLevel/HEX2
add wave -noupdate -radix hexadecimal -childformat {{{/TF_EECS301_Lab3_TopLevel/HEX3[6]} -radix hexadecimal} {{/TF_EECS301_Lab3_TopLevel/HEX3[5]} -radix hexadecimal} {{/TF_EECS301_Lab3_TopLevel/HEX3[4]} -radix hexadecimal} {{/TF_EECS301_Lab3_TopLevel/HEX3[3]} -radix hexadecimal} {{/TF_EECS301_Lab3_TopLevel/HEX3[2]} -radix hexadecimal} {{/TF_EECS301_Lab3_TopLevel/HEX3[1]} -radix hexadecimal} {{/TF_EECS301_Lab3_TopLevel/HEX3[0]} -radix hexadecimal}} -subitemconfig {{/TF_EECS301_Lab3_TopLevel/HEX3[6]} {-height 15 -radix hexadecimal} {/TF_EECS301_Lab3_TopLevel/HEX3[5]} {-height 15 -radix hexadecimal} {/TF_EECS301_Lab3_TopLevel/HEX3[4]} {-height 15 -radix hexadecimal} {/TF_EECS301_Lab3_TopLevel/HEX3[3]} {-height 15 -radix hexadecimal} {/TF_EECS301_Lab3_TopLevel/HEX3[2]} {-height 15 -radix hexadecimal} {/TF_EECS301_Lab3_TopLevel/HEX3[1]} {-height 15 -radix hexadecimal} {/TF_EECS301_Lab3_TopLevel/HEX3[0]} {-height 15 -radix hexadecimal}} /TF_EECS301_Lab3_TopLevel/HEX3
add wave -noupdate -radix hexadecimal /TF_EECS301_Lab3_TopLevel/HEX4
add wave -noupdate -radix hexadecimal /TF_EECS301_Lab3_TopLevel/HEX5
add wave -noupdate -divider CLS_Scanner_0
add wave -noupdate /TF_EECS301_Lab3_TopLevel/uut/key_event
add wave -noupdate /TF_EECS301_Lab3_TopLevel/uut/sw_led_enable
add wave -noupdate {/TF_EECS301_Lab3_TopLevel/uut/led_out[0]}
add wave -noupdate -divider CLS_Scanner_1
add wave -noupdate /TF_EECS301_Lab3_TopLevel/uut/key_event
add wave -noupdate /TF_EECS301_Lab3_TopLevel/uut/sw_led_enable
add wave -noupdate {/TF_EECS301_Lab3_TopLevel/uut/led_out[1]}
add wave -noupdate -divider LED_Mapper
add wave -noupdate -expand /TF_EECS301_Lab3_TopLevel/uut/led_mapper/led_out_reg
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {3730070000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 127
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
WaveRestoreZoom {0 ps} {15750 us}
run 15 ms
