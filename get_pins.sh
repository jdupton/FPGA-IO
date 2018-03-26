#!/bin/bash
#############################################################################
#File: retrieve_pin.sh
#Description: Retrieves the pin names from a refdes (for generating top level FPGA)
#
#
#  example:
#   ./retrieve_pins.sh CAHF0_Sonic_R01_0314a_RTP.brd U201 sonic_p1
#   ./retrieve_pins.sh [1]unnamed.brd [2]U1 [3]unnamed
#############################################################################

# Build script file to execute Allegro commands
echo "show element" > dostuff.scr
echo "symbol select $2" >> dostuff.scr
echo "setwindow text" >> dostuff.scr
echo "save" >> dostuff.scr
echo "fillin \"element.dat\"" >> dostuff.scr
echo "quit" >> dostuff.scr

# Run allegro and execute the script that was made above
allegro -product Allegro_performance -s dostuff.scr -nographic $1 > test.dat

# Clean up the files that were generated from running allegro
rm test.dat
rm allegro.jrl*
rm -rf signoise.run
rm dostuff.scr

# Refine element.dat to contain only pin IO
sed -e '1,/Pin IO Information/d' element.dat> $3.dat
rm element.dat

# Run python to create Pin IO Excel workbook
python extract_pins.py $3 
