#!/bin/bash
# script for running Leceture Assignment

ghdl -a buzzer.vhdl &&
echo "Executed : ghdl -a buzzer.vhdl"  &&
ghdl -e buzzer &&
echo "Executed : ghdl -e buzzer" &&
ghdl -a buzzer_tb.vhdl &&
echo "Executed : ghdl -a buzzer_tb.vhdl" &&
ghdl -e buzzer_tb &&
echo "Executed : ghdl -e buzzer_tb" &&
./buzzer_tb --vcd=buzz.vcd &&
echo "Executed : ./buzzer_tb --vcd=buzz.vcd" &&
gtkwave buzz.vcd &&
echo "Executed : gtkwave buzz.vcd"
