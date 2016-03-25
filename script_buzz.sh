#!/bin/bash
# script for running Leceture Assignment

ghdl -a buzzer.vhdl
echo "Executed : ghdl -a buzzer.vhdl"
ghdl -e buzzer
echo "Executed : ghdl -e buzzer"
ghdl -a tb_buzzer.vhdl
echo "Executed : ghdl -a tb_buzzer.vhdl"
ghdl -e tb_buzzer
echo "Executed : ghdl -e tb_buzzer"
./tb_buzzer --vcd=buzz.vcd
echo "Executed : ./tb_buzzer --vcd=buzz.vcd"
gtkwave buzz.vcd
echo "Executed : gtkwave buzz.vcd"