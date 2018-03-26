# FPGA-IO
Extract one or more board files' pin information and generate a top level hardware description language module.

In cmd line the user should run the shell file "get_pins.sh"
Example:  ./retrieve_pins.sh board_file_name part_number board name 
          ./retrieve_pins.sh CAHF0_Sonic_R01_0314a_RTP.brd U201 sonic_p1
      
get_pins.sh retrieves the pin names from a refdes and runs the Python program "extract_pins.py" to format the extracted information into a Microsoft Excel file for ease of use.

Then the user consolidates the pin information with previously gathered information in his/her control file.
After which, in the cmd line the user should run the python program "fpga_top"
Example:  python fpga_top.py >jet_fpga.vhd
