import os
import sys
from datetime import datetime


# function to display the external ports
def print_external_ports( pins, direction, type_check, signal_format,  line_count):
    for each in sorted(list(pins)):
        if direction[each] == type_check:
            line_count += 1
            if line_count != len(pins):
                if 'DIFF' in type_check:
                    print(signal_format % ('E_'+each+'_P', ';', direction[each]))
                    print(signal_format % ('E_'+each+'_N', ';', direction[each]))
                else:
                    print(signal_format % ('E_'+each+'  ', ';', direction[each]))
            else:
                if 'DIFF' in type_check:
                    print(signal_format % ('E_'+each+'_P', ';', direction[each]))
                    print(signal_format % ('E_'+each+'_N', ' ', direction[each]))  # handle end of port
                else:
                    print(signal_format % ('E_'+each+'  ', ' ', direction[each]))  # handle end of port
    return line_count


# function to display the internal ports
def print_internal_ports( pins, direction, ddr, type_check, signal_format):
    for each in sorted(list(pins)):
        if ddr[each] == '-':
            if direction[each] == type_check:
                if type_check == 'IN_CLK' or type_check == 'IN' or type_check == 'DIFF_IN':
                    print (signal_format % (each + '     ', 'in   ', ';', direction[each]))
                elif type_check == 'BIDI'or type_check == 'DIFF_BIDI':
                    print (signal_format % (each + '_IN  ', 'in   ', ';', direction[each]))
                    print (signal_format % (each + '_OUT ', 'out  ', ';', ''))
                    print (signal_format % (each + '_OE_N', 'out  ', ';', ''))
                elif type_check == 'OUT' or type_check == 'OUT_OD' or type_check == 'DIFF_OUT':
                    print (signal_format % (each + '     ', 'out  ', ';', direction[each]))
                elif type_check == 'OUT_OE' or type_check == 'DIFF_OUT_OE':
                    print (signal_format % (each + '     ', 'out  ', ';', direction[each]))
                    print (signal_format % (each + '_OE_N', 'out  ', ';', ''))
        else:
            if direction[each] == type_check:
                if type_check == 'IN_CLK' or type_check == 'IN' or type_check == 'DIFF_IN':
                    print (signal_format % (each + '_D   ', 'in   ', '_vector(1 downto 0);', direction[each]))
                    print (signal_format % (each + '_CLK ', 'out  ', '_vector(1 downto 0);', '    DDR Clock vector 0 for Data0 and 1 for Data1'))
                    print (signal_format % (each + '_CE  ', 'out  ', ';                   ', '    DDR clock enable 1= clock enable   0= no change'))
                    print (signal_format % (each + '_R   ', 'out  ', ';                   ', '    When set to 1 set to invert inital conditions of DDR'))
                elif type_check == 'BIDI'or type_check == 'DIFF_BIDI':
                    print (signal_format % (each + '_DIN ', 'in   ', '_vector(1 downto 0);', direction[each]))
                    print (signal_format % (each + '_DOUT', 'out  ', '_vector(1 downto 0);', ''))
                    print (signal_format % (each + '_OE_N', 'out  ', ';                   ', ''))
                    print (signal_format % (each + '_CLK ', 'out  ', '_vector(1 downto 0);', '    DDR Clock vector 0 for Data0 and 1 for Data1'))
                    print (signal_format % (each + '_CE  ', 'out  ', ';                   ', '    DDR clock enable 1= clock enable   0= no change'))
                    print (signal_format % (each + '_R   ', 'out  ', ';                   ', '    When set to 1 set to invert inital conditions of DDR'))
                elif type_check == 'OUT' or type_check == 'OUT_OD' or type_check == 'DIFF_OUT':
                    print (signal_format % (each + '_D   ', 'out  ', '_vector(1 downto 0);',direction[each]))
                    print (signal_format % (each + '_CLK ', 'out  ', '_vector(1 downto 0);','    DDR Clock vector 0 for Data0 and 1 for Data1'))
                    print (signal_format % (each + '_CE  ', 'out  ', ';                   ','    DDR clock enable 1= clock enable   0= no change'))
                    print (signal_format % (each + '_R   ', 'out  ', ';                   ','    When set to 1 set to invert inital conditions of DDR'))
                elif type_check == 'OUT_OE' or type_check == 'DIFF_OUT_OE':
                    print (signal_format % (each + '_D   ', 'out  ', '_vector(1 downto 0);',direction[each]))
                    print (signal_format % (each + '_OE_N', 'out  ', ';                   ',''))
                    print (signal_format % (each + '_CLK ', 'out  ', '_vector(1 downto 0);','    DDR Clock vector 0 for Data0 and 1 for Data1'))
                    print (signal_format % (each + '_CE  ', 'out  ', ';                   ','    DDR clock enable 1= clock enable   0= no change'))
                    print (signal_format % (each + '_R   ', 'out  ', ';                   ','    When set to 1 set to invert inital conditions of DDR'))
    return


# function to display the internal signals
def print_internal_signals(part, pins, direction, init0, time_domain, debounce_clk, signal_format, use_direction):
    for each in sorted(list(pins)):
        if use_direction == "DIRECTION":
            if direction[each] == 'IN_CLK' or direction[each] == 'DIFF_IN':
                print (signal_format % (each+'     ','',direction[each]))
            elif direction[each] == 'IN':
                if time_domain[each] == '-':
                    print (signal_format % (each+'     ','',direction[each]))
                else:
                    print(signal_format % (each, ' := \'' + init0[each] + '\' ', direction[each]))
                    print(signal_format % (each + '_ML1 ', ' := \'' + init0[each] + '\' ', direction[each]))
                    print(signal_format % (each + '_ML2 ', ' := \'' + init0[each] + '\' ', direction[each]))
                    if debounce_clk[each] != '-':
                        print (signal_format % (each + '_DBNC', ' := \'' + init0[each] + '\' ', direction[each]))
            elif direction[each] == 'BIDI'or direction[each] == 'DIFF_BIDI':
                if time_domain[each] == '-':
                    print(signal_format % (each+'_IN  ','',direction[each]))
                else:
                    print (signal_format % (each+'_IN     ',' := \''+init0[each]+'\' ',direction[each]))
                    print (signal_format % (each+'_IN_ML1 ',' := \''+init0[each]+'\' ',direction[each]))
                    print (signal_format % (each+'_IN_ML2 ',' := \''+init0[each]+'\' ',direction[each]))
                    if debounce_clk[each] != '-':
                         print (signal_format % (each+'_IN_DBNC',' := \''+init0[each]+'\' ',direction[each]))
                if power_en[each] != '-':
                    print(signal_format % (each + '_IN_PRE  ', '', direction[each]))
                print (signal_format % (each+'_OUT ','',''))
                print (signal_format % (each+'_OE_N','',''))
                # since logic already written in top with IO to the _oe_n create the _oe here and assign the "not _oe_n"
                if part == 'cyclone4':
                    print (signal_format % (each + '_OE', '', ''))
            elif direction[each] == 'OUT' or direction[each] == 'DIFF_OUT':
                print (signal_format % (each + '     ', '', direction[each]))
            elif direction[each] == 'OUT_OE' or direction[each] == 'OUT_OD' or direction[each] == 'DIFF_OUT_OE':
                print (signal_format % (each + '     ', '', direction[each]))
                # if ((part == 'spartan3') or (part == 'spartan6')):
                print (signal_format % (each + '_OE_N', '', ''))
                if part == 'cyclone4':
                    print (signal_format % (each + '_OE', '', ''))
            else:
                print ('ERROR: Signal (%s) has unknown type "%s"' % each, direction[each])
                quit()
        elif use_direction == 'SIGNALS':
            print (signal_format % (each + '     ', '', '-- Power control'))
        elif use_direction == 'VECTORS':
            print (signal_format % (each + '     ', '_vector(7 downto 0) := x"' + pins[each] + '"', '-- Vectors'))
    return


# function to display the instance ports
def print_instance_ports( pins, direction, ddr, type_check, signal_format):
    for each in sorted(list(pins)):
        if ddr[each] == '-':
            if direction[each] == type_check:
                if type_check == 'IN_CLK' or type_check == 'IN' or type_check == 'DIFF_IN' or type_check == 'OUT' or type_check == 'OUT_OD' or type_check == 'DIFF_OUT':
                    print(signal_format % (each + '     ', each + ',     ', direction[each]))
                elif type_check == 'BIDI'or type_check == 'DIFF_BIDI':
                    print(signal_format % (each + '_IN  ', each + '_IN,  ', direction[each]))
                    print(signal_format % (each + '_OUT ', each + '_OUT, ', ''))
                    print(signal_format % (each + '_OE_N', each + '_OE_N,', ''))
                elif type_check == 'OUT_OE' or type_check == 'DIFF_OUT_OE':
                    print(signal_format % (each + '     ', each + ',     ', direction[each]))
                    print(signal_format % (each + '_OE_N', each + '_OE_N,', ''))
        else:
            if direction[each] == type_check:
                if type_check == 'IN_CLK' or type_check == 'IN' or type_check == 'DIFF_IN' or type_check == 'OUT' or type_check == 'OUT_OD' or type_check=='DIFF_OUT':
                    print(signal_format % (each + '_D   ', each + '_D,  ', direction[each]))
                    print(signal_format % (each + '_CLK ', each + '_CLK,', '    DDR Clock vector 0 for Data0 and 1 for Data1'))
                    print(signal_format % (each + '_CE  ', each + '_CE, ', '    DDR clock enable 1= clock enable   0= no change'))
                    print(signal_format % (each + '_R   ', each + '_R,  ', '    When set to 1 set to invert inital conditions of DDR'))
                elif type_check == 'BIDI'or type_check == 'DIFF_BIDI':
                    print(signal_format % (each + '_DIN ', each + '_DIN, ', direction[each]))
                    print(signal_format % (each + '_DOUT', each + '_DOUT,', ''))
                    print(signal_format % (each + '_OE_N', each + '_OE_N,', ''))
                    print(signal_format % (each + '_CLK ', each + '_CLK, ', '    DDR Clock vector 0 for Data0 and 1 for Data1'))
                    print(signal_format % (each + '_CE  ', each + '_CE,  ', '    DDR clock enable 1= clock enable   0= no change'))
                    print(signal_format % (each + '_R   ', each + '_R,   ', '    When set to 1 set to invert inital conditions of DDR'))
                elif type_check == 'OUT_OE' or type_check == 'DIFF_OUT_OE':
                    print(signal_format % (each + '_D   ', each + '_D,   ', direction[each]))
                    print(signal_format % (each + '_OE_N', each + '_OE_N,', ''))
                    print(signal_format % (each + '_CLK ', each + '_CLK, ', '    DDR Clock vector 0 for Data0 and 1 for Data1'))
                    print(signal_format % (each + '_CE  ', each + '_CE,  ', '    DDR clock enable 1= clock enable   0= no change'))
                    print(signal_format % (each + '_R   ', each + '_R,   ', '    When set to 1 set to invert inital conditions of DDR'))
    return


# function to take out of a dictionary items that start with the same prefix
def find_sigs(pins, location):
    new_list = []
    for key in pins.keys():
        if pins[key] == location:
            new_list += [key]
    return new_list


# function to take out of a dictionary items that start with the same prefix
def slice(sourcedict, string):
    new_dict = {}
    for key in sourcedict.keys():
        if not key.startswith(string):
            new_dict[key] = sourcedict[key]
    return new_dict


# function to take out of a dictionary items that start with the same prefix
def join(first, second):
    new_dict = {}
    for key in first.keys():
        new_dict[key] = first[key]
    for key in second.keys():
        new_dict[key] = second[key]
    return new_dict


# function to take out of a dictionary items that start with the same prefix
def prefix(source_list, string):
    new_list = []
    for each in source_list:
        new_list += [string+each]
    return new_list


# Create the internal signals
def print_internal_signals_section(part, pins, direction, power_en,ddr, init0,time_domain, debounce_clk, debounce_cnt, signals, max_len_sig):

    print('--------------------- Internal Signals ----------------------')

    signal_format = 'signal %s-%d.%ds : std_logic%ss; --%ss'%('%',max_len_sig+5,max_len_sig+5,'%','%')
    print_internal_signals(part, pins, direction, init0, time_domain, debounce_clk, signal_format, 'DIRECTION')
    print_internal_signals(part, component_out_list, direction, init0, time_domain, debounce_clk, signal_format,
                           'SIGNALS')  # value of direction not used for "SIGNALS"
    for each in sorted(list(pins)):
        if power_en[each] != '-':
            if ((direction[each] == 'BIDI') or (direction[each] == 'DIFF_BIDI') or (direction[each] == 'OUT_OD') or
                    (direction[each] == 'OUT_OE') or (direction[each] == 'OUT') or (direction[each] == 'DIFF_OUT') or
                    (direction[each] == 'DIFF_OUT_OE')):
                if (part == 'spartan3') or (part == 'spartan6'):
                    print(signal_format % (each+'_T_N','',' Conditioned output'))
                elif part == 'cyclone4':
                    print(signal_format % (each+'_T','',' Conditioned output'))
                else:
                    print('ERROR unknown part type %s' % part)
                    exit()
            elif (direction[each] == 'IN') and (time_domain[each] == '-'):
                print (signal_format % (each+'_IN_PRE','',' Conditioned input'))
    for each in sorted(list(pins)):
        if ddr[each] != '-':
            if direction[each] == 'BIDI' or direction[each] == 'DIFF_BIDI':
                print (signal_format % (each+'_DIN ', '_vector(1 downto 0)',' DDR internal signal'))
                print (signal_format % (each+'_DOUT', '_vector(1 downto 0)',' DDR internal signal'))
                print (signal_format % (each+'_DDRT', '_vector(1 downto 0)',' DDR internal signal'))
            else:
                print (signal_format % (each+'_D   ','_vector(1 downto 0)',' DDR internal signal'))
                if direction[each] == "OUT_OE" or direction[each] == "DIFF_OUT_OE" or power_en[each] != '-':
                    print (signal_format % (each+'_DDRT','',' DDR internal signal'))
            print (signal_format % (each+'_CLK ','_vector(1 downto 0)',' DDR internal signal'))
            print (signal_format % (each+'_CE  ','',' DDR internal signal'))
            print (signal_format % (each+'_R   ','',' DDR internal signal'))
    for each in sorted(list(pins)):
        if ((direction[each] == "BIDI") or (direction[each] == "DIFF_BIDI"))and (time_domain[each] != '-'):
            print (signal_format % (each+'_ML1','',' Metastablity bidi (input portion)'))
            print (signal_format % (each+'_ML2','',' Metastablity bidi (input portion)'))

    # value of direction not used for "VECTORS"
    print_internal_signals(part, signals, direction, init0, time_domain, debounce_clk, signal_format, 'VECTORS')

    print ('\n')

    return


'''
****************************************************************************
Initial variable setup (generate blank dictionaries)
****************************************************************************
'''
signals = {}

# Dictionaries for pins on ALL boards
pins = {}
names = {}
boards = {}
direction = {}
types = {}
slew = {}
drive = {}
pull = {}
power_en = {}
ddr = {}
srtype = {}
init0 = {}
init1 = {}
time_domain = {}
debounce_clk = {}
debounce_cnt = {}

# Dictionaries for pins NOT on all boards
multi_pins = {}
multi_boards = {}
multi_direction = {}
multi_types = {}
multi_slew = {}
multi_drive = {}
multi_pull = {}
multi_power_en = {}
multi_ddr = {}
multi_srtype = {}
multi_init0 = {}
multi_init1 = {}
multi_time_domain = {}
multi_debounce_clk = {}
multi_debounce_cnt = {}
duplicate_pins = {}
duplicate_boards = {}

ucf_line = {}
ucf = 0

path = os.getcwd()
file = 'unnamed.ctl'
full_path = (os.path.join(path, file))

script_version = '0.1'
module = file.split('.')[0]

# #########################
# part - spartan3
#      - spartan6
#      - cyclone4
# #########################

part = 'cyclone4'
'''
****************************************************************************
Read in the file contents
****************************************************************************
'''
try:
    filein = open(full_path, "r")
    try:
        lines = filein.readlines()
        for line in lines:
            if len(line.strip()) > 1:  # remember that the cr is a position
                if line[0] not in '#':
                    if line[0:2].upper() in 'PIN':
                        pin = line.split()
                        '''
                        Pin attributes by index
                        [1]  name
                        [2]  location
                        [3]  board
                        [4]  direction
                        [5]  io_standard
                        [6]  slew
                        [7]  drive
                        [8]  pull_up
                        [9]  ddr
                        [10] srtype
                        [11] init0
                        [12] init1
                        [13] power_en
                        [14] time_domain
                        [15] debounce_clk
                        [16] debounce_cnt
                        '''

                        name = pin[1]
                        if name[0] in '0123456789':
                            name = ('FPGA_%s' % pin[1])
                        board = pin[3]
                        if board in 'ALL':
                            pins[name] = pin[2]
                            names[pin[2]] = name
                            boards[name] = pin[3]
                            direction[name] = pin[4]
                            types[name] = pin[5]
                            slew[name] = pin[6]
                            drive[name] = pin[7]
                            pull[name] = pin[8]
                            ddr[name] = pin[9]
                            srtype[name] = pin[10]
                            init0[name] = pin[11]
                            init1[name] = pin[12]
                            power_en[name] = pin[13]
                            power_en_test = power_en[name]
                            if power_en_test[0] in '0123456789':
                                power_en[name] = ('FPGA_%s' % pin[13])
                            time_domain[name] = pin[14]
                            debounce_clk[name] = pin[15]
                            debounce_cnt[name] = pin[16]
                        else:
                            fix_pin = ('FPGA_MULTI_PIN_%s' % pin[2])
                            if fix_pin not in pins:
                                if name not in multi_pins:
                                    # print "Not in multi pins (%s)" % name
                                    multi_pins[name] = pin[2]
                                    multi_boards[name] = pin[3]
                                    multi_direction[name] = pin[4]
                                    multi_types[name] = pin[5]
                                    multi_slew[name] = pin[6]
                                    multi_drive[name] = pin[7]
                                    multi_pull[name] = pin[8]
                                    multi_ddr[name] = pin[9]
                                    multi_srtype[name] = pin[10]
                                    multi_init0[name] = pin[11]
                                    multi_init1[name] = pin[12]
                                    multi_power_en[name] = pin[13]
                                    power_en_test = multi_power_en[name]
                                    if power_en_test[0] in '0123456789':
                                        multi_power_en[name] = ('FPGA_%s' % pin[13])
                                    multi_time_domain[name] = pin[14]
                                    multi_debounce_clk[name] = pin[15]
                                    multi_debounce_cnt[name] = pin[16]

                                    pins[fix_pin] = multi_pins[name]
                                    names[pin[2]] = fix_pin
                                    boards[fix_pin] = multi_boards[name]
                                    direction[fix_pin] = multi_direction[name]
                                    types[fix_pin] = multi_types[name]
                                    slew[fix_pin] = multi_slew[name]
                                    drive[fix_pin] = multi_drive[name]
                                    pull[fix_pin] = multi_pull[name]
                                    ddr[fix_pin] = multi_ddr[name]
                                    srtype[fix_pin] = multi_srtype[name]
                                    init0[fix_pin] = multi_init0[name]
                                    init1[fix_pin] = multi_init1[name]
                                    power_en[fix_pin] = multi_power_en[name]
                                    time_domain[fix_pin] = '-'  # multi_time_domain[name]
                                    debounce_clk[fix_pin] = '-'  # multi_debounce_clk[name]
                                    debounce_cnt[fix_pin] = '-'  # multi_debounce_cnt[name]

                                else:
                                    if name not in duplicate_pins:
                                        search = ''
                                        if multi_direction[name] != pin[4]:
                                            search = 'direction'
                                        if multi_types[name] != pin[5]:
                                            search = 'types'
                                        if multi_slew[name] != pin[6]:
                                            search = 'slew'
                                        if multi_drive[name] != pin[7]:
                                            search = 'drive'
                                        if multi_pull[name] != pin[8]:
                                            search = 'pull'
                                        if multi_ddr[name] != pin[9]:
                                            search = 'ddr'
                                        if multi_srtype[name] != pin[10]:
                                            search = 'srtype'
                                        if multi_init0[name] != pin[11]:
                                            search = 'init0'
                                        if multi_init1[name] != pin[12]:
                                            search = 'init1'
                                        if multi_power_en[name] != pin[13]:
                                            search = 'power_en'
                                        if multi_time_domain[name] != pin[14]:
                                            search = 'time_domain'
                                        if multi_debounce_clk[name] != pin[15]:
                                            search = 'debounce_clk'
                                        if multi_debounce_cnt[name] != pin[16]:
                                            search = 'debounce_cnt'
                                        if search != '':
                                            print('Duplicate Pin (%s:%s) use conflict %s need to correct'
                                                   % (multi_pins[name],name,search))
                                            exit()
                                        # print ('Duplicate name in use -> %s' % name)
                                        duplicate_pins[name] = pin[2]
                                        duplicate_boards[name] = pin[3]

                                        pins[fix_pin] = pin[2]
                                        names[pin[2]] = name
                                        boards[fix_pin] = pin[3]
                                        direction[fix_pin] = pin[4]
                                        types[fix_pin] = pin[5]
                                        slew[fix_pin] = pin[6]
                                        drive[fix_pin] = pin[7]
                                        pull[fix_pin] = pin[8]
                                        ddr[fix_pin] = pin[9]
                                        srtype[fix_pin] = pin[10]
                                        init0[fix_pin] = pin[11]
                                        init1[fix_pin] = pin[12]
                                        power_en[fix_pin] = pin[13]
                                        power_en_test = power_en[fix_pin]
                                        if power_en_test[0] in '0123456789':
                                            power_en[fix_pin] = ('FPGA_%s' % pin[13])
                                        time_domain[fix_pin] = pin[14]
                                        debounce_clk = pin[15]
                                        debounce_cnt = pin[16]

                                    else:  # if name in duplicate_pins:
                                        print ('Multiple duplicates in use -> %s' % name)
                                        exit()
                            else:  # if fix_pin in pins:
                                if name not in multi_pins:
                                    multi_pins[name] = pin[2]
                                    multi_boards[name] = pin[3]
                                    multi_direction[name] = pin[4]
                                    multi_types[name] = pin[5]
                                    multi_slew[name] = pin[6]
                                    multi_drive[name] = pin[7]
                                    multi_pull[name] = pin[8]
                                    multi_ddr[name] = pin[9]
                                    multi_srtype[name] = pin[10]
                                    multi_init0[name] = pin[11]
                                    multi_init1[name] = pin[12]
                                    multi_power_en[name] = pin[13]
                                    power_en_test = multi_power_en[name]
                                    if power_en_test[0] in '0123456789':
                                        multi_power_en[name] = ('FPGA_%s' % pin[13])
                                    multi_time_domain[name] = pin[14]
                                    multi_debounce_clk[name] = pin[15]
                                    multi_debounce_cnt[name] = pin[16]
                                    # print ('Pin in use -> %s:%s' % (pin[2],name) )
                                    search = ''
                                    for each in multi_pins:
                                        if multi_pins[each] == multi_pins[name]:
                                            if multi_direction[each] != multi_direction[name]:
                                                if ((multi_direction[each] not in 'IN_CLK') or
                                                        (multi_direction[name] not in 'IN_CLK')):
                                                    direction[fix_pin] = "BIDI"
                                                else:
                                                    search = 'direction'
                                                    break
                                            if multi_types[each] != multi_types[name]:
                                                search = 'types'
                                                break
                                            if multi_slew[each] != multi_slew[name]:
                                                if multi_slew[each] in '-':
                                                    slew[fix_pin] = multi_slew[name]
                                                elif multi_slew[name] in '-':
                                                    slew[fix_pin] = multi_slew[each]
                                                else:
                                                    search = 'slew'
                                                    break
                                            if multi_drive[each] != multi_drive[name]:
                                                if multi_drive[each] in '-':
                                                    drive[fix_pin] = multi_drive[name]
                                                elif multi_slew[name] in '-':
                                                    drive[fix_pin] = multi_drive[each]
                                                else:
                                                    search = 'drive'
                                                    break
                                            if multi_pull[each] != multi_pull[name]:
                                                if multi_pull[each] in '-':
                                                    pull[fix_pin] = multi_pull[name]
                                                elif multi_pull[name] in '-':
                                                    pull[fix_pin] = multi_pull[each]
                                                else:
                                                    search = 'pull'
                                                    break
                                            if multi_ddr[each] != multi_ddr[name]:
                                                search = 'ddr'
                                                break
                                            if multi_srtype[each] != multi_srtype[name]:
                                                search = 'srtype'
                                                break
                                            if multi_init0[each] != multi_init0[name]:
                                                if multi_init0[each] in '-':
                                                    init0[fix_pin] = multi_init0[name]
                                                elif multi_init0[name] in '-':
                                                    init0[fix_pin] = multi_init0[each]
                                                else:
                                                    search = 'init0'
                                                    break
                                            if multi_init1[each] != multi_init1[name]:
                                                search = 'init1'
                                                break
                                            if multi_power_en[each] != multi_power_en[name]:
                                                power_en[fix_pin] = '-'
                                                #search = 'power_en'
                                                #break
                                            if multi_time_domain[each] != multi_time_domain[name]:
                                                time_domain[fix_pin] = '-'
                                                ##if (multi_time_domain[each] in '-'):
                                                ##    time_domain[fix_pin] = multi_time_domain[name]
                                                ##elif (multi_time_domain[name] in '-'):
                                                ##    time_domain[fix_pin] = multi_time_domain[each]
                                                ##else:
                                                ##    search = 'time_domain'
                                                ##    break
                                            if multi_debounce_clk[each] != multi_debounce_clk[name]:
                                                debounce_clk[fix_pin] = '-'
                                                ##if (multi_debounce_clk[each] in '-'):
                                                ##    debounce_clk[fix_pin] = multi_debounce_clk[name]
                                                ##elif (multi_debounce_clk[name] in '-'):
                                                ##    debounce_clk[fix_pin] = multi_debounce_clk[each]
                                                ##else:
                                                ##    search = 'debounce_clk'
                                                ##    break
                                            if multi_debounce_cnt[each] != multi_debounce_cnt[name]:
                                                debounce_cnt[fix_pin] = '-'
                                                ##if (multi_debounce_cnt[each] in '-'):
                                                ##    debounce_cnt[fix_pin] = debounce_cnt[name]
                                                ##elif (debounce_cnt[name] in '-'):
                                                ##    debounce_cnt[fix_pin] = multi_debounce_cnt[each]
                                                ##else:
                                                ##    search = 'debounce_cnt'
                                                ##    break
                                    if search != '':
                                        print ('Pin (%s:%s) use confict %s need to correct'
                                               % (multi_pins[name],name,search))
                                        exit()
                                else: # if name is in multi_pins: already how should we handle this
                                    print ('Pin move (duplicate name) -> %s:%s' % (pin[2],name))
                                    print ('Script not good in this use rename signal and handle top level')
                                    exit()

                    elif line[0:2].upper() in 'VEC':
                        signal=line.split()
                        signals[signal[1]] = signal[2]
                    elif line[0:2].upper() in 'UCF':
                        ucf+=1
                        ucf_line[ucf] = line[4:]
                    else:
                        print('Undefined Line in %s:\n%s' % (full_path,line))
                        exit()

    finally:
        filein.close()
except IOError:
    print('The file %s was unable to open or had error in the read' % name)
    exit()
except IndexError:
    print('Input file %s line does not have the full number of fields required:\n%s'% (name,line))
    exit()

# Create timestamp
start_time = datetime.now()
time_stamp = start_time.strftime("%Y_%m_%d_%H_%M")

signals['BUILD_YEAR'] = start_time.strftime("%y")
signals['BUILD_MONTH'] = start_time.strftime("%m")
signals['BUILD_DAY'] = start_time.strftime("%d")

'''
****************************************************************************
Create the header
****************************************************************************
'''
print('------------------------------------------------------------------')
print('-- File description:')
print('--       Top level IO ring for %s from Python script %s' % (module,script_version))
print('------------------------------------------------------------------')
print('-- SCCS revision information:')
print('--        SourceId %@FileCur, <%I%>')
print('------------------------------------------------------------------')
print('-- Copyright:')
print('--       ThinkServer System Control Unit ')
print('--       (C) Copyright Lenovo Corp 2017-%s' % start_time.strftime('%Y'))
print('--       Licensed Material - Program Property of Lenovo')
print('--')
print('--')
print('-- REVISION HISTORY:')
print('--')
print('------------------------------------------------------------------')
print('-- Code Tag      DCR/PTR    Date/Description')
print('-- -----------   -------    --------------------------------------')
print('-- AUTO_GEN               %s Auto Generation' % start_time.strftime('%Y/%m/%d'))
print('--')
print('------------------------------------------------------------------')
print('--       Lenovo Confidential')
print('------------------------------------------------------------------')

'''
****************************************************************************
Create the library header
****************************************************************************
'''
print('library IEEE;')
print('use IEEE.STD_LOGIC_1164.all;')
print('use IEEE.STD_LOGIC_ARITH.all;')
print('use IEEE.STD_LOGIC_UNSIGNED.all;')
if part == "spartan3" or part == "spartan6":
    print('library UNISIM;')
    print('use UNISIM.VComponents.all;')
elif part == "cyclone4":
    print('library altera;')
    print('use altera.altera_primitives_components.all;')
else:
    print('ERROR unknown part type %s' % (part))
    exit()

print('')
print('------------------------------------------------------------------')
print('-- FPGA top level generation \n-- Date: %s\n-- Timestamp: %s' % (start_time,time_stamp))
print('------------------------------------------------------------------')
print('')

'''
****************************************************************************
Create the entity
****************************************************************************
'''
print('------------------------ START OF ENTITY -------------------------')
print('entity %s is' % (module))
print('  port (')

# find the max character length for print formatting
max_len=0
for each in sorted(list(pins)):
    if max_len < len(each):
        max_len = len(each)

# remember we are append E_ and _P _N to the signal
signal_format = '    %s-%d.%ds : in    std_logic%sc --%ss' % ('%', max_len+4, max_len+4, '%', '%')
print('-- Input clocks')
current_pins = print_external_ports(pins, direction, 'IN_CLK', signal_format, 0)
print('-- Inputs')
current_pins = print_external_ports(pins, direction, 'IN', signal_format, current_pins)
print('-- Differential Inputs')
current_pins = print_external_ports(pins, direction, 'DIFF_IN', signal_format, current_pins)
print('-- Bi-Directional')
signal_format = signal_format.replace('in   ', 'inout')
current_pins = print_external_ports(pins, direction, 'BIDI', signal_format, current_pins)
print('-- Bi-Directional Differential')
current_pins = print_external_ports(pins, direction, 'DIFF_BIDI', signal_format, current_pins)
print('-- Outputs')
signal_format = signal_format.replace('inout', 'out  ')
current_pins = print_external_ports(pins, direction, 'OUT', signal_format, current_pins)
print('-- Outputs With Tri-state')
current_pins = print_external_ports(pins, direction, 'OUT_OE', signal_format, current_pins)
print('-- Outputs With Open-Drain')
current_pins = print_external_ports(pins, direction, 'OUT_OD', signal_format, current_pins)
print('-- Differential Outputs')
current_pins = print_external_ports(pins, direction, 'DIFF_OUT', signal_format, current_pins)
print('-- Differential Outputs with Tri-state')
current_pins = print_external_ports(pins, direction, 'DIFF_OUT_OE', signal_format, current_pins)
print('  );')
print('')
print('end %s;' % module)
print('')
print('------------------------- END OF ENTITY --------------------------')

if len(sorted(list(set(debounce_clk.values())))) > 1:
    print('')
    print('------------------------- DEBOUNCE ENTITY --------------------------')
    print('library ieee;')
    print('use ieee.std_logic_1164.all;')
    print('')
    print('entity %s_debounce is' % module)
    print('  generic (')
    print('    DEBOUNCE_COUNT : integer;')
    print('    INIT           : std_logic')
    print('    );')
    print('  port (')
    print('    clk                 : in  std_logic;')
    print('    sync_debounce_pulse : in  std_logic;')
    print('    sync_in             : in  std_logic;')
    print('    debounce_out        : out std_logic')
    print('    );')
    print('end %s_debounce;' %(module))
    print('')
    print('--------------------------------------------------------------------')
    print('')
    print('architecture rtl of %s_debounce is' % (module))
    print('')
    print('  signal counter_en     : std_logic                         := \'0\';')
    print('  signal i_debounce_out : std_logic                         := INIT;')
    print('  signal count          : integer range 0 to DEBOUNCE_COUNT := DEBOUNCE_COUNT;')
    print('  ')
    print('begin  -- debounce logic')
    print('')
    print('  counter_en <= sync_in xor i_debounce_out;')
    print('')
    print('  -- counter with sync reset')
    print('  process (clk)')
    print('  begin')
    print('    if rising_edge(clk) then')
    print('      if counter_en = \'1\' then')
    print('        if sync_debounce_pulse = \'1\' then')
    print('          if count /= 0 then')
    print('            count <= count - 1;')
    print('          else')
    print('            i_debounce_out <= sync_in;')
    print('          end if;')
    print('        end if;')
    print('      else')
    print('        count <= DEBOUNCE_COUNT;')
    print('      end if;')
    print('    end if;')
    print('  end process;')
    print('')
    print('  debounce_out   <= i_debounce_out;')
    print('')
    print('end rtl;')
    print('')
    print('----------------------- END DEBOUNCE ENTITY ------------------------')
print ('')
print('---------------- START OUTPUT BUF TRI FIX ENTITY -------------------')
print('library ieee;')
print('use ieee.std_logic_1164.all;')
print('')
print('entity alt_outbuf_tri_fix is')
print('  generic (')
print('    ENABLE_BUS_HOLD : STRING := "NONE"')
print('    );')
print('  port (')
print('    i               : in  std_logic;')
print('    oe              : in  std_logic;')
print('    o               : out std_logic')
print('    );')
print('end alt_outbuf_tri_fix;')
print('')
print('--------------------------------------------------------------------')
print('')
print('architecture rtl of alt_outbuf_tri_fix is')
print('')
print('begin  -- outbuf fix logic')
print('')
print('  o <= i when oe = \'1\' else \'Z\';')
print('')
print('end rtl;')
print('')
print('----------------- END OUTPUT BUF TRI FIX ENTITY --------------------')
print('')
print('--------------------- START OF ARCHITECTURE ----------------------')
print('')
print('architecture rtl of %s is' % (module))
print('')

max_len_sig = max_len
for each in sorted(list(signals)):
    if max_len_sig < len(each):
        max_len_sig = len(each)

# create all board versions for internal muxing signaling
board_set = []
for each in sorted(list(multi_pins)):
    this_board_set = [x.strip() for x in multi_boards[each].split(':')]
    board_set += this_board_set

# Create all internal signals from power enable
component_out_signal = {}
component_out_list = []
component_out_signal.update(power_en)
component_out_signal.update(multi_power_en)
for key, value in component_out_signal.items():
    if value != '-':
        component_out_list.append(value)
component_out_list = component_out_list + (prefix(board_set,'BOARD_'))

component_out_signal.update(time_domain)
component_out_signal.update(multi_time_domain)

for key, value in component_out_signal.items():
    if value != '-':
        component_out_list.append(value)
component_out_list = component_out_list + (prefix(board_set,'BOARD_'))

component_out_signal.update(debounce_clk)
component_out_signal.update(multi_debounce_clk)

for key, value in component_out_signal.items():
    if value != '-':
        component_out_list.append(value)
component_out_list = component_out_list + (prefix(board_set,'BOARD_'))
component_out_list = sorted(list(set(component_out_list)))  # this should uniquely provide the enables

domains = {}
domains.update(time_domain)
domains.update(multi_time_domain)
domains_list = []
for key, value in domains.items():
    if value != '-' and value not in domains_list:
        domains_list.append(value)
domains_list = sorted(list(domains_list))

'''
****************************************************************************
Create the top component
****************************************************************************
'''
print('  component %s_top' % module)
print('    port(')
signal_format = '      %s-%d.%ds : %ss std_logic%ss --%ss'%('%',max_len_sig+5,max_len_sig+5,'%','%','%')
print('-- Input clocks')
print_internal_ports(join(slice(pins,'FPGA_MULTI_PIN_'),multi_pins),
                     join(direction,multi_direction),
                     join(ddr,multi_ddr),
                     'IN_CLK',
                     signal_format)
print('-- Inputs')
print_internal_ports(join(slice(pins,'FPGA_MULTI_PIN_'),multi_pins),
                     join(direction,multi_direction),
                     join(ddr,multi_ddr),
                     'IN',
                     signal_format)
print('-- Differential Inputs')
print_internal_ports(join(slice(pins,'FPGA_MULTI_PIN_'),multi_pins),
                     join(direction,multi_direction),
                     join(ddr,multi_ddr),
                     'DIFF_IN',
                     signal_format)
print('-- Bi-Directional')
print_internal_ports(join(slice(pins,'FPGA_MULTI_PIN_'),multi_pins),
                     join(direction,multi_direction),
                     join(ddr,multi_ddr),
                     'BIDI',
                     signal_format)
print('-- Bi-Directional Differential')
print_internal_ports(join(slice(pins,'FPGA_MULTI_PIN_'),multi_pins),
                     join(direction,multi_direction),
                     join(ddr,multi_ddr),
                     'DIFF_BIDI',
                     signal_format)
print('-- Outputs')
print_internal_ports(join(slice(pins,'FPGA_MULTI_PIN_'),multi_pins),
                     join(direction,multi_direction),
                     join(ddr,multi_ddr),
                     'OUT',
                     signal_format)
print('-- Outputs With Tri-state')
print_internal_ports(join(slice(pins,'FPGA_MULTI_PIN_'),multi_pins),
                     join(direction,multi_direction),
                     join(ddr,multi_ddr),
                     'OUT_OE',
                     signal_format)
print('-- Outputs With Open-Drain')
print_internal_ports(join(slice(pins,'FPGA_MULTI_PIN_'),multi_pins),
                     join(direction,multi_direction),
                     join(ddr,multi_ddr),
                     'OUT_OD',
                     signal_format)
print('-- Differential Outputs')
print_internal_ports(join(slice(pins,'FPGA_MULTI_PIN_'),multi_pins),
                     join(direction,multi_direction),
                     join(ddr,multi_ddr),
                     'DIFF_OUT',
                     signal_format)
print('-- Differential Outputs with Tri-state')
print_internal_ports(join(slice(pins,'FPGA_MULTI_PIN_'),multi_pins),
                     join(direction,multi_direction),
                     join(ddr,multi_ddr),
                     'DIFF_OUT_OE',
                     signal_format)
print('-- Internal out signals')
signal_format = '      %s-%d.%ds : out   std_logic%sc --%ss'%('%',max_len_sig+5,max_len_sig+5,'%','%')
for each in component_out_list:
    print (signal_format % (each,';','-- Internal signal'))
print('-- Internal in constants')
signal_format = '      %s-%d.%ds : in    std_logic_vector(7 downto 0)%sc --%ss'%('%',max_len_sig+5,max_len_sig+5,'%','%')
line_count = 0
for each in sorted(list(signals)):
    line_count += 1
    if line_count != len(signals):
        print (signal_format % (each,';','-- Internal signal'))
    else:
        print (signal_format % (each,' ','-- Internal signal'))
print('  );')
print('end component;\n')
print('')

if len(sorted(list(set(debounce_clk.values())))) > 1:
    print('')
    print('component %s_debounce' % module)
    print('  generic (')
    print('    DEBOUNCE_COUNT : integer;')
    print('    INIT           : std_logic')
    print('    );')
    print('  port (')
    print('    clk                 : in  std_logic;')
    print('    sync_debounce_pulse : in  std_logic;')
    print('    sync_in             : in  std_logic;')
    print('    debounce_out        : out std_logic')
    print('    );')
    print('end component;')
    print('')
print('component alt_outbuf_tri_fix is')
print('  generic (')
print('    ENABLE_BUS_HOLD : STRING := "NONE"')
print('    );')
print('  port (')
print('    i               : in  std_logic;')
print('    oe              : in  std_logic;')
print('    o               : out std_logic')
print('    );')
print('end component;')
print('')

'''
****************************************************************************
Create the internal signals
****************************************************************************
'''
print_internal_signals_section(part,
                               join(pins,multi_pins),
                               join(direction,multi_direction),
                               join(power_en,multi_power_en),
                               join(ddr,multi_ddr),
                               join(init0, multi_init0),
                               join(time_domain,multi_time_domain),
                               join(debounce_clk,multi_debounce_clk),
                               join(debounce_cnt,multi_debounce_cnt),
                               signals,
                               max_len_sig)

'''
****************************************************************************
Start of logic
Generate the Instance of the top level
****************************************************************************
'''
print('begin\n')

print('  inst_%s_top: %s_top' % (module, module))
print('    port map(')
signal_format = '      %s-%d.%ds => %s-%d.%.ds --%ss' % ('%', max_len_sig + 5, max_len_sig + 5, '%', max_len_sig + 6, max_len_sig+6,'%')
print('-- Input clock')
print_instance_ports(join(slice(pins,'FPGA_MULTI_PIN_'),multi_pins),
                     join(direction,multi_direction),
                     join(ddr,multi_ddr),
                     'IN_CLK',
                     signal_format)
print('-- Inputs')
print_instance_ports(join(slice(pins,'FPGA_MULTI_PIN_'),multi_pins),
                     join(direction,multi_direction),
                     join(ddr,multi_ddr),
                     'IN',
                     signal_format)
print('-- Differential Inputs')
print_instance_ports(join(slice(pins,'FPGA_MULTI_PIN_'),multi_pins),
                     join(direction,multi_direction),
                     join(ddr,multi_ddr),
                     'DIFF_IN',
                     signal_format)
print('-- Bi-Directional')
print_instance_ports(join(slice(pins,'FPGA_MULTI_PIN_'),multi_pins),
                     join(direction,multi_direction),
                     join(ddr,multi_ddr),
                     'BIDI',
                     signal_format)
print('-- Bi-Directional Differential')
print_instance_ports(join(slice(pins,'FPGA_MULTI_PIN_'),multi_pins),
                     join(direction,multi_direction),
                     join(ddr,multi_ddr),
                     'DIFF_BIDI',
                     signal_format)
print('-- Outputs')
print_instance_ports(join(slice(pins,'FPGA_MULTI_PIN_'),multi_pins),
                     join(direction,multi_direction),
                     join(ddr,multi_ddr),
                     'OUT',
                     signal_format)
print('-- Outputs With Tri-state')
print_instance_ports(join(slice(pins,'FPGA_MULTI_PIN_'),multi_pins),
                     join(direction,multi_direction),
                     join(ddr,multi_ddr),
                     'OUT_OE',
                     signal_format)
print('-- Outputs With Open-Drain')
print_instance_ports(join(slice(pins,'FPGA_MULTI_PIN_'),multi_pins),
                     join(direction,multi_direction),
                     join(ddr,multi_ddr),
                     'OUT_OD',
                     signal_format)
print('-- Differential Outputs')
print_instance_ports(join(slice(pins,'FPGA_MULTI_PIN_'),multi_pins),
                     join(direction,multi_direction),
                     join(ddr,multi_ddr),
                     'DIFF_OUT',
                     signal_format)
print('-- Differential Outputs with Tri-state')
print_instance_ports(join(slice(pins,'FPGA_MULTI_PIN_'),multi_pins),
                     join(direction,multi_direction),
                     join(ddr,multi_ddr),
                     'DIFF_OUT_OE',
                     signal_format)
print('-- Internal out signals')
for each in component_out_list:
    print(signal_format % (each+'     ',each+',     ','-- Internal signal'))
print('-- Internal in constants')
line_count = 0
for each in sorted(list(signals)):
    line_count += 1
    if line_count != len(signals):
        print(signal_format % (each+'     ',each+',     ','-- Internal signal'))
    else:
        print(signal_format % (each+'     ',each+'      ','-- Internal signal'))
print('    );')
print('\n')

'''
****************************************************************************
Generate any output enable logic
****************************************************************************
'''
print('-------------------------------------------------------------------')
print('-- Output enable logic')
print('-------------------------------------------------------------------')
if (part == 'spartan3') or (part == 'spartan6'): # the output enable is active low tristate is active high
    signal_format = '%s-%d.%ds <= %ss;' % ('%', max_len_sig + 5, max_len_sig + 5, '%')
    post_signal_id = '_OE_N'
elif part == 'cyclone4':                         # the output enable is active high tristate is active low
    signal_format = '%s-%d.%ds <= not %ss;' % ('%', max_len_sig + 5, max_len_sig + 5, '%')
    post_signal_id = '_OE'
else:
    print('ERROR part not correct %s' % part)
    exit()
for each in sorted(list(pins)):
    if direction[each] == 'BIDI' or direction[each] == 'DIFF_BIDI' or direction[each] == 'OUT_OE' or direction[each] == 'DIFF_OUT_OE':
        if part == 'cyclone4':
            print(signal_format % (each+'_OE',each+'_OE_N'))
    elif direction[each] == 'OUT_OD':
        print(signal_format % (each + post_signal_id, each))
for each in sorted(list(multi_pins)):
    if multi_direction[each] == 'BIDI' or multi_direction[each] == 'DIFF_BIDI' or multi_direction[each] == 'OUT_OE' \
            or multi_direction[each] == 'DIFF_OUT_OE':
        if part == 'cyclone4':
            print(signal_format % (each+"_OE", each+"_OE_N"))
    elif multi_direction[each] == 'OUT_OD':
        print (signal_format % (each + post_signal_id, each))
print('\n')

'''
****************************************************************************
Conditional output logic
****************************************************************************
'''
print('-------------------------------------------------------------------')
print('-- Conditional output logic (will tristate the output when no power')
print('-------------------------------------------------------------------')
if ((part == 'spartan3') or (part == 'spartan6')): # the output enable is active low tristate is active high
    signal_format = '%s-%d.%ds <= (not %ss)%ss;' % ('%',max_len_sig + 5, max_len_sig + 5, '%', '%')
    post_signal_id = '_T_N'
    post_enable_id = '_OE_N'
#    open_drain_polarity = ''
elif (part == 'cyclone4'):                         # the output enable is active high tristate is active low
    signal_format = '%s-%d.%ds <= %ss%ss;' % ('%', max_len_sig + 5, max_len_sig + 5,'%','%')
    post_signal_id = '_T'
    post_enable_id = '_OE'
#    open_drain_polarity = 'not '
else:
    print ('ERROR part not correct %s' % (part))
    exit()

for each in sorted(list(pins)):
    if power_en[each] != '-':
        if ((direction[each] == 'OUT') or (direction[each] == 'DIFF_OUT')):
            print (signal_format % (each+post_signal_id,power_en[each],''))
        elif ((direction[each] == 'BIDI') or (direction[each] == 'DIFF_BIDI') or (direction[each] == 'OUT_OE') or
              (direction[each] == 'DIFF_OUT_OE') or (direction[each] == 'OUT_OD')):
            print (signal_format % (each+post_signal_id,power_en[each],' or '+each+post_enable_id))
# (JP-ok to use output en signal)        elif direction[each] == 'OUT_OD':
# (JP-ok to use output en signal)            print (signal_format % (each+post_signal_id,power_en[each],' or '+open_drain_polarity+each))
for each in sorted(list(multi_pins)):
    if multi_power_en[each] != '-':
        if ((multi_direction[each] == 'OUT') or (multi_direction[each] == 'DIFF_OUT')):
            print (signal_format % (each+post_signal_id,multi_power_en[each],''))
        elif ((multi_direction[each] == 'BIDI') or (multi_direction[each] == 'DIFF_BIDI') or (multi_direction[each] == 'OUT_OE') or
              (multi_direction[each] == 'DIFF_OUT_OE') or (multi_direction[each] == 'OUT_OD')):
            print (signal_format % (each+post_signal_id,multi_power_en[each],' or '+each+post_enable_id))
# (JP-ok to use output en signal)        elif multi_direction[each] == 'OUT_OD':
# (JP-ok to use output en signal)            print (signal_format % (each+post_signal_id,multi_power_en[each],' or '+open_drain_polarity+each))
print ('\n')

'''
#****************************************************************************
# vector assigned logic
#****************************************************************************
'''
print ('------------------------------------------------------------------')
print ('-- Assign vector logic')
print ('------------------------------------------------------------------')
signal_format = '%s-%d.%ds <= x"%ss";'%('%',max_len_sig,max_len_sig,'%')
for each in sorted(list(signals)):
    print (signal_format % (each,signals[each]))
print ('\n')

'''
****************************************************************************
Pin logic
****************************************************************************
'''
print('------------------------------------------------------------------')
print('-- Input clock pin logic')
print('------------------------------------------------------------------')
for each in sorted(list(pins)):
    if direction[each] == 'IN_CLK':
        if part == 'spartan6':
            print('    IBUFG_%s : IBUFG' % (each))
            print('      generic map (')
            print('        IBUF_LOW_PWR => TRUE, -- Low power (TRUE) vs. performance (FALSE) setting for referenced I/O standards')
            print('        IOSTANDARD   => "%s")' % (types[each]))
            print('      port map (')
            print('        O => %s,  -- Buffer output' % (each))
            print('        I => E_%s -- Buffer input ' % (each))
            print('        );\n')
        elif part == 'spartan3':
            print('    IBUFG_%s : IBUFG' % (each))
            print('      port map (')
            print('        O => %s,  -- Buffer output' % (each))
            print('        I => E_%s -- Buffer input ' % (each))
            print('        );\n')
        elif part == 'cyclone4':
            print('   IBUFG_%s : alt_inbuf' % (each))
            print('     generic map (')
            # (JP-tmp)       print ('        io_standard           => "%s",' % (altera_types[types[each]]))
            # (JP-tmp)       print ('        location              => "PIN_%s",' % (pins[each]))
            print('        enable_bus_hold       => "OFF"')
            # (JP-tmp)       print ('        weak_pull_up_resistor => "%s"' % ("ON" if pull[each]=="UP" else "OFF"))
            # print ('        termination           => "NO"')
            print('        )')
            print('     port map (')
            print('        i  => E_%s, -- Buffer input (connect directly to top-level port)' % (each))
            print('        o  => %s    -- Buffer output' %(each))
            print('        );\n')
        else:
            print('ERROR part not correct %s' % (part))
            exit()
print('------------------------------------------------------------------')
print('-- Input pin logic')
print('------------------------------------------------------------------')
for each in sorted(list(pins)):
    if direction[each] == 'IN':
        if time_domain[each] == '-':
            if power_en[each] == '-':
                out_signal = each;
            else:
                out_signal = ('%s_IN_PRE' % (each))
        else:
            out_signal = ('%s_ML1' % (each))
        if part == 'spartan6':
            print('    IBUF_%s : IBUF' % (each))
            print('      generic map (')
            print('        IBUF_LOW_PWR => TRUE, -- Low power (TRUE) vs. performance (FALSE) setting for referenced I/O standards')
            print('        IOSTANDARD   => "%s")' % (types[each]))
            print('      port map (')
            print('        O => %s,  -- Buffer output' % (out_signal))
            print('        I => E_%s -- Buffer input (connect directly to top-level port)' % (each))
            print('        );\n')
        elif part == 'spartan3':
            print('    IBUF_%s : IBUF' % (each))
            print('      generic map (')
            print('        IBUF_DELAY_VALUE => "0",    -- Amount of added input delay for buffer, "0"-"16" (Spartan-3E/3A only)')
            print('        IFD_DELAY_VALUE  => "AUTO", -- Amount of added delay for input register, "AUTO", "0"-"8" (Spartan-3E/3A only)')
            print('        IOSTANDARD   => "%s")' % (types[each]))
            print('      port map (')
            print('        O => %s,  -- Buffer output' % (out_signal))
            print('        I => E_%s -- Buffer input (connect directly to top-level port)' % (each))
            print('        );\n')
        elif part == 'cyclone4':
            print('   IBUF_%s : alt_inbuf' % (each))
            print('     generic map (')
            # (JP-tmp)       print ('        io_standard           => "%s",' % (altera_types[types[each]]))
            # (JP-tmp)       print ('        location              => "PIN_%s",' % (pins[each]))
            print('        enable_bus_hold       => "OFF"')
            # (JP-tmp)       print ('        weak_pull_up_resistor => "%s"' % ("ON" if pull[each]=="UP" else "OFF"))
            # print ('        termination           => "NO"')
            print('        )')
            print('     port map (')
            print('        i  => E_%s, -- Buffer input (connect directly to top-level port)' % (each))
            print('        o  => %s    -- Buffer output' % out_signal)
            print('        );\n')
        else:
            print('ERROR part not correct %s' % (part))
            exit()
print('------------------------------------------------------------------')
print('-- Input pin Metastablity logic')
print('------------------------------------------------------------------')
for each in sorted(list(domains_list)):
    print('meta_%s : process (%s)' % (each,each))
    print('begin')
    print('  if %s\'event and %s = \'1\' then' % (each, each))
    for each_sig in sorted(list(pins)):
        if ((direction[each_sig] == 'IN') or (direction[each_sig] == 'BIDI') or (direction[each_sig] == 'DIFF_BIDI')) and (time_domain[each_sig] == each):
            signal_format = '    %s-%d.%ds <= %ss;' % ('%',max_len_sig + 5, max_len_sig + 5, '%')
            print(signal_format % (each_sig+'_ML2', each_sig+'_ML1'))
            if debounce_clk[each_sig] == '-':
                bidi_post_sig = ''
            else:
                bidi_post_sig = '_DBNC'
            if (direction[each_sig] == 'BIDI') or (direction[each_sig] == 'DIFF_BIDI'):
                bidi_post_sig = '_IN' + bidi_post_sig
            if power_en[each_sig] == '-':
                print(signal_format % (each_sig+bidi_post_sig, each_sig+'_ML2'))
            else:
                if init0[each_sig] == '0':
                    print(signal_format % (each_sig+bidi_post_sig, each_sig+'_ML2 and '+power_en[each_sig]))
                elif init0[each_sig] == '1':
                    print(signal_format % (each_sig+bidi_post_sig, each_sig+'_ML2 or not '+power_en[each_sig]))
                else:
                    print('ERROR: conditioned input "%s" does not have an initial condition (init0=%s)' % (each_sig,init0[each_sig]))
                    exit()
    for each_sig in sorted(list(multi_pins)):
        if (((multi_direction[each_sig] == 'IN') or (multi_direction[each_sig] == 'BIDI') or (multi_direction[each_sig] == 'DIFF_BIDI')) and (multi_time_domain[each_sig] == each)):
            signal_format = '    %s-%d.%ds <= %ss;' % ('%',max_len_sig+5,max_len_sig+5,'%')
            print(signal_format % (each_sig+'_ML2', each_sig+'_ML1'))
            if(multi_debounce_clk[each_sig] == '-'): #(jp) this was debounce_clk[each_sig] == '-'
                bidi_post_sig = ''
            else:
                bidi_post_sig = '_DBNC'
            if ((multi_direction[each_sig] == 'BIDI') or (multi_direction[each_sig] == 'DIFF_BIDI')):
                bidi_post_sig = '_IN' + bidi_post_sig
            if multi_power_en[each_sig] == '-':
                print(signal_format % (each_sig+bidi_post_sig, each_sig+'_ML2'))
            else:
                if multi_init0[each_sig]=='0':
                    print(signal_format % (each_sig+bidi_post_sig, each_sig+'_ML2 and '+multi_power_en[each_sig]))
                elif multi_init0[each_sig]=='1':
                    print(signal_format % (each_sig+bidi_post_sig, each_sig+'_ML2 or not '+multi_power_en[each_sig]))
                else:
                    print('ERROR: conditioned input "%s" does not have an initial condition (init0=%s)' % (each_sig,multi_init0[each_sig]))
                    exit(2)
    print('  end if;')
    print('end process;')
print('------------------------------------------------------------------')
print('-- Debounce input logic')
print('------------------------------------------------------------------')
for each_sig in sorted(list(pins)):
    if(debounce_clk[each_sig] != '-'):
        print('    INST_%s_DEBOUNCE: %s_debounce' % (each_sig, module))
        print('        generic map(')
        print('            DEBOUNCE_COUNT => %s,' % debounce_cnt[each_sig])
        print('            INIT           => \'%s\''  % init0[each_sig])
        print('        )')
        print('        port map(')
        print('            clk                 => %s,' % (time_domain[each_sig]))
        print('            sync_debounce_pulse => %s,' % (debounce_clk[each_sig]))
        if direction[each_sig] == 'BIDI'or direction[each_sig] == 'DIFF_BIDI':
            print('            sync_in             => %s,' % (each_sig+'_IN_DBNC'))
            print('            debounce_out        => %s'  % (each_sig+'_IN'))
        else:
            print('            sync_in             => %s,' % (each_sig+'_DBNC'))
            print('            debounce_out        => %s'  % (each_sig))
        print('        );')

print('------------------------------------------------------------------')
print('-- Conditional input logic')
print('------------------------------------------------------------------')
for each_sig in sorted(list(pins)):
    if direction[each_sig] == 'IN' and time_domain[each_sig] == '-' and power_en[each_sig] != '-':
        signal_format = '%s-%d.%ds <= %ss;' % ('%',max_len_sig+5,max_len_sig+5,'%')
        if init0[each_sig]=='0':
            print(signal_format % (each_sig, each_sig+'_IN_PRE and '+power_en[each_sig]))
        elif init0[each_sig]=='1':
            print(signal_format % (each_sig, each_sig+'_IN_PRE or not '+power_en[each_sig]))
        else:
            print('ERROR: conditioned input "%s" does not have an initial condition (init0=%s)' % (each_sig,init0[each_sig]))
            exit()
for each_sig in sorted(list(multi_pins)):
    if (multi_direction[each_sig] == 'IN' and multi_time_domain[each_sig] == '-' and multi_power_en[each_sig] != '-'): #(jp) was power_en[each_sig] != '-'
        signal_format = '%s-%d.%ds <= %ss;' % ('%',max_len_sig+5,max_len_sig+5,'%')
        if (multi_init0[each_sig]=='0'):
            print(signal_format % (each_sig, each_sig+'_IN_PRE and '+multi_power_en[each_sig]))
        elif (multi_init0[each_sig]=='1'):
            print(signal_format % (each_sig, each_sig+'_IN_PRE or not '+multi_power_en[each_sig]))
        else:
            print ('ERROR: conditioned input "%s" does not have an initial condition (init0=%s)' % (each_sig,multi_init0[each_sig]))
            exit()

print('------------------------------------------------------------------')
print('-- Differential input pin logic')
print('------------------------------------------------------------------')
for each in sorted(list(pins)):
    if direction[each] == 'DIFF_IN':
        if part == 'spartan3' or part == 'spartan6':
            print('    IBUFDS_%s : IBUFDS' % (each))
            print('      generic map (')
            print('        DIFF_TERM    => FALSE, -- Differential Termination')
            print('        IBUF_LOW_PWR => TRUE, -- Low power (TRUE) vs. performance (FALSE) setting for referenced I/O standards')
            print('        IOSTANDARD   => "%s")' % (types[each]))
            print('      port map (')
            print('        O  => %s,     -- Buffer output' % (each))
            print('        I  => E_%s_P, -- Diff_p buffer input (connect directly to top-level port)' % (each))
            print('        IB => E_%s_N  -- Diff_n buffer input (connect directly to top-level port)' % (each))
            print('        );\n')
        elif (part == 'cyclone4'):
            print('   IBUFDS_%s : alt_inbuf_diff' % (each))
            print('     generic map (')
            #(JP-tmp)       print ('        io_standard           => "%s",' % (altera_types[types[each]]))
            #(JP-tmp)       print ('        location              => "PIN_%s",' % (pins[each]))
            print ('        enable_bus_hold       => "OFF"')
            #(JP-tmp)       print ('        weak_pull_up_resistor => "%s",' % ("ON" if pull[each]=="UP" else "OFF"))
            #(JP-tmp)       print ('        termination           => "NO"')
            print('        )')
            print('     port map (')
            print('        i    => E_%s_P, -- Buffer input positive (connect directly to top-level port)'  % (each))
            print('        ibar => E_%s_P, -- Buffer input negative (connect directly to top-level port)'  % (each))
            print('        o    => %s      -- Buffer output'          %(each))
            print('        );\n')
        else:
            print("ERROR part not correct %s" % part)
            exit()
print('------------------------------------------------------------------')
print('-- Bi-directional pin logic')
print('------------------------------------------------------------------')
for each in sorted(list(pins)):
    if direction[each] == 'BIDI':
        if part == 'spartan3' or part == 'spartan6':
            print('    IOBUF_%s : IOBUF' % (each))
            print('      generic map (')
            if drive[each] == '-':
                print('        DRIVE        => 12,')
            else:
                print('        DRIVE        => %s,' % drive[each])
            if slew[each] == '-':
                print('        SLEW         => "SLOW",')
            else:
                print('        SLEW         => "%s",' % slew[each])
                print('        IOSTANDARD   => "%s")' % types[each])
                print('      port map (')
            if time_domain[each] == '-':
                print('        O  => %s_IN,  -- Buffer output' % each)
            else:
                print('        O  => %s_ML1,  -- Buffer output' % each)
            print('        IO => E_%s,   -- Buffer inout port (connect directly to top-level port)' % each)
            print('        I  => %s_OUT, -- Buffer input' % each)
            if ddr[each] != '-':
                print('        T  => %s_DDRT -- 3-state enable input, high=input, low=output' % each)
            elif power_en[each] == '-':
                print('        T  => %s_OE_N -- 3-state enable input, high=input, low=output' % each)
            else:
                print('        T  => %s_T_N  -- 3-state enable input, high=input, low=output' % each)
            print('        );\n')
        elif part == 'cyclone4':
            print('    IOBUF_%s : alt_iobuf' % each)
            print('      generic map (')
            print('          enable_bus_hold       => "OFF"')
            print('          )')
            print('       port map (')
            print('          i  => %s_OUT,     -- Buffer output' % each)
            if ddr[each] != '-':
                print('          oe => %s_DDR_OE,  -- 3-state enable input, high=output, low=input' % each)
                # print ('          oe  => %s_DDRT    -- 3-state enable input, high=input, low=output' % (each))
            elif power_en[each] == '-':
                print('          oe => %s_OE,      -- 3-state enable input, high=output, low=input' % each)
                # print ('          oe  => %s_OE_N   -- 3-state enable input, high=input, low=output' % (each))
            else:
                print('          oe => %s_T,       -- 3-state enable input, high=output, low=input' % each)
                # print ('          T  => %s_T_N     -- 3-state enable input, high=input, low=output' % (each))
            print('          io => E_%s,       -- Buffer inout port (connect directly to top-level port)' % each)
            if time_domain[each] == '-':
                if power_en[each] == '-':
                    print('          o  => %s_IN   -- Buffer input' % each)
                else:
                    print('          o  => %s_IN_PRE   -- Buffer input' % each)
            else:
                print('          o  => %s_ML1      -- Buffer input' % each)
            print('          );\n')
        else:
            print('ERROR part not correct %s' % part)
            exit()
print('------------------------------------------------------------------')
print('-- Differential Bi-directional pin logic')
print('------------------------------------------------------------------')
for each in sorted(list(pins)):
    if direction[each] == 'DIFF_BIDI':
        if part == 'spartan3' or part == 'spartan6':
            print('    IOBUFDS_%s : IOBUFDS' % each)
            print('      generic map (')
            print('        IOSTANDARD   => "%s")' % types[each])
            print('      port map (')
            if time_domain[each] == '-':
                print('        O  => %s_IN,  -- Buffer output' % (each))
            else:
                print('        O  => %s_ML1,  -- Buffer output' % (each))
            print('        IO  => E_%s_P, -- Diff_p inout port (connect directly to top-level port)' % (each))
            print('        IOB => E_%s_N, -- Diff_n inout port (connect directly to top-level port)' % (each))
            print('        I  => %s_OUT,  -- Buffer input' % (each))
            if ddr[each] != '-':
                print('        T  => %s_DDRT -- 3-state enable input, high=input, low=output' % (each))
            elif power_en[each] == '-':
                print('        T  => %s_OE_N  -- 3-state enable input, high=input, low=output' % (each))
            else:
                print('        T  => %s_T_N   -- 3-state enable input, high=input, low=output' % (each))
            print('        );\n')
        elif part == 'cyclone4':
            print('    IOBUFDS_%s : alt_iobuf_diff' % (each))
            print('      generic map (')
            # (JP-tmp)       print ('          io_standard           => "%s",' % (altera_types[types[each]]))
            # (JP-tmp)       print ('          current_strength      => "%s",' % ("12" if drive[each]=='-' else drive[each]))
            # (JP-tmp)       print ('          location              => "PIN_%s",' % (pins[each]))
            print('          enable_bus_hold       => "OFF"')
            # (JP-tmp)       print ('          weak_pull_up_resistor => "%s"' % ("ON" if pull[each]=="UP" else "OFF"))
            # print ('          termination           => "NO"')
            # print ('          input_termination     => "NONE",') #exclusive with "termination"
            # print ('          output_termination    => "NONE" ') #also exclusive with "termination"
            print('          )')
            print('       port map (')
            print('          i     => %s_OUT,    -- Buffer output' %(each))
            if ddr[each] != '-':
                print('          oe    => %s_DDR_OE,  -- 3-state enable input, high=output, low=input'% (each))
                # print ('          oe     => %s_DDRT    -- 3-state enable input, high=input, low=output' % (each))
            elif power_en[each] == '-':
                print('          oe    => %s_OE,     -- 3-state enable input, high=output, low=input'% (each))
                # print ('          oe     => %s_OE_N   -- 3-state enable input, high=input, low=output' % (each))
            else:
                print('          oe    => %s_T,      -- 3-state enable input, high=output, low=input'% (each))
                # print ('          T     => %s_T_N     -- 3-state enable input, high=input, low=output' % (each))
            print('          io    => E_%s_P,      -- Diff_p inout port (connect directly to top-level port)' % (each))
            print('          iobar => E_%s_N,      -- Diff_n inout port (connect directly to top-level port)' % (each))
            if time_domain[each] == '-':
                print('          o  => %s_IN      -- Buffer input' % (each))
            else:
                print('          o  => %s_ML1      -- Buffer input' % (each))
            print('          );\n')
        else:
            print('ERROR part not correct %s' % part)
            exit()

print('------------------------------------------------------------------')
print('-- Conditional Bidi input logic')
print('------------------------------------------------------------------')
for each_sig in sorted(list(pins)):
    if direction[each_sig] == 'BIDI' and time_domain[each_sig] == '-' and power_en[each_sig] != '-':
        signal_format = '%s-%d.%ds <= %ss;' % ('%',max_len_sig+5,max_len_sig+5,'%')
        if init0[each_sig] == '0':
            print(signal_format % (each_sig + "_IN", each_sig+'_IN_PRE and '+power_en[each_sig]))
        elif init0[each_sig] == '1':
            print(signal_format % (each_sig + "_IN", each_sig +'_IN_PRE or not '+power_en[each_sig]))
        else:
            print('ERROR: conditioned BIDI input "%s" does not have an initial condition (init0 =% s)' % (each_sig,init0[each_sig]))
            exit()
for each_sig in sorted(list(multi_pins)):
    if multi_direction[each_sig] == 'BIDI' and multi_time_domain[each_sig] == '-' and multi_power_en[each_sig] != '-':
        signal_format = '%s-%d.%ds <= %ss;' % ('%',max_len_sig+5,max_len_sig+5,'%')
        if multi_init0[each_sig]=='0':
            print(signal_format % (each_sig + "_IN", each_sig+'_IN_PRE and '+multi_power_en[each_sig]))
        elif multi_init0[each_sig]=='1':
            print(signal_format % (each_sig + "_IN", each_sig+'_IN_PRE or not '+multi_power_en[each_sig]))
        else:
            print('ERROR: conditioned input "%s" does not have an initial condition (init0 = %s)' % (each_sig,multi_init0[each_sig]))
            exit()


print('------------------------------------------------------------------')
print('-- Output pin logic')
print('------------------------------------------------------------------')
for each in sorted(list(pins)):
    if direction[each] == 'OUT':
        if part == 'spartan3' or part == 'spartan6':
            if power_en[each] == '-':
                print('    OBUF_%s : OBUF' % each)
            else:
                print('    OBUFT_%s : OBUFT' % each)
            print('      generic map (')
            if drive[each] == '-':
                print('        DRIVE        => 12,')
            else:
                print('        DRIVE        => %s,' % drive[each])
            if slew[each] == '-':
                print('        SLEW         => "SLOW",')
            else:
                print('        SLEW         => "%s",' % slew[each])
            print('        IOSTANDARD   => "%s")' % (types[each]))
            print('      port map (')
            if ddr[each] != '-' and power_en[each] != '-':
                print('        T  => %s_DDRT, -- 3-state enable input, high=input, low=output' % (each))
            elif power_en[each] != '-':
                print('        T => %s_T_N,  -- 3-state enable input, high=input, low=output' % (each))
            print('        O => E_%s,    -- Buffer output (connect directly to top-level port)' % (each))
            print('        I => %s       -- Buffer input ' % (each))
            print('        );\n')
        elif (part=='cyclone4'):
            if power_en[each] == '-':
                print('    OBUF_%s : alt_outbuf' % (each))
            else:
                print('    OBUFT_%s : alt_outbuf_tri_fix' % (each))
            print('      generic map (')
            #(JP-tmp)       print ('          io_standard           => "%s",' % (altera_types[types[each]]))
            #(JP-tmp)       print ('          current_strength      => "%s",' % ("12" if drive[each]=='-' else drive[each]))
            #(JP-tmp)       print ('          slow_slew_rate        => "%s",' % ("ON" if slew[each]=="SLOW" else "OFF"))
            #(JP-tmp)       print ('          location              => "PIN_%s",' % (pins[each]))
            print('          enable_bus_hold       => "OFF"')
            #(JP-tmp)       print ('          weak_pull_up_resistor => "%s"' % ("ON" if pull[each]=="UP" else "OFF"))
            #print ('          termination           => "NO"')
            print('        )')
            print('    port map(')
            if ddr[each] != '-' and  power_en[each] != '-':
                print('        oe  => %s_DDRT, -- 3-state enable input, high=output, low=tristate' % (each))
            elif power_en[each] != '-':
                print('        oe => %s_T,     -- 3-state enable input, high=output, low=tristate' % (each))
            print('        i  => %s,       -- Buffer input ' % (each))
            print('        o  => E_%s      -- Buffer output (connect directly to top-level port)' % (each))
            print('        );')
        else:
            print('ERROR part not correct %s' % (part))
            exit()

print('------------------------------------------------------------------')
print('-- Output with tri-state pin logic')
print('------------------------------------------------------------------')
for each in sorted(list(pins)):
    if direction[each] == 'OUT_OE':
        if (part=='spartan3' or part=='spartan6'):
            print('    OBUFT_%s : OBUFT' % (each))
            print('      generic map (')
            if drive[each]=='-':
                print('        DRIVE        => 12,')
            else:
                print('        DRIVE        => %s,' % drive[each])
            if slew[each]=='-':
                print('        SLEW         => "SLOW",')
            else:
                print('        SLEW         => "%s",' % slew[each])
            print('        IOSTANDARD   => "%s")' % (types[each]))
            print('      port map (')
            print('        O => E_%s,    -- Buffer output (connect directly to top-level port)' % (each))
            print('        I => %s ,     -- Buffer input ' % (each))
            if ddr[each] != '-':
                print('        T  => %s_DDRT -- 3-state enable input, high=input, low=output' % (each))
            elif power_en[each] != '-':
                print('        T => %s_T_N   -- 3-state enable input, high=input, low=output' % (each))
            else:
                print('        T => %s_OE_N  -- 3-state enable input, high=input, low=output' % (each))
            print('        );\n')
        elif (part=='cyclone4'):
            print('    OBUFT_%s : alt_outbuf_tri_fix' % (each))
            print('      generic map (')
            #(JP-tmp)       print ('          io_standard           => "%s",' % (altera_types[types[each]]))
            #(JP-tmp)       print ('          current_strength      => "%s",' % ("12" if drive[each]=='-' else drive[each]))
            #(JP-tmp)       print ('          slow_slew_rate        => "%s",' % ("ON" if slew[each]=="SLOW" else "OFF"))
            #(JP-tmp)       print ('          location              => "PIN_%s",' % (pins[each]))
            print('          enable_bus_hold       => "OFF"')
            #(JP-tmp)       print ('          weak_pull_up_resistor => "%s"' % ("ON" if pull[each]=="UP" else "OFF"))
            #print ('          termination           => "NO"')
            print('        )')
            print('    port map(')
            if ddr[each] != '-' and  power_en[each] != '-':
                print('        oe  => %s_DDRT, -- 3-state enable input, high=output, low=tristate' % (each))
            elif power_en[each] != '-':
                print('        oe => %s_T,     -- 3-state enable input, high=output, low=tristate' % (each))
            else:
                print('        oe => %s_OE,    -- 3-state enable input, high=output, low=tristate' % (each))
            print('        i  => %s,       -- Buffer input ' % (each))
            print('        o  => E_%s      -- Buffer output (connect directly to top-level port)' % (each))
            print('        );')
        else:
            print('ERROR part not correct %s' % (part))
            exit()

print('------------------------------------------------------------------')
print('-- Output with Open Drian pin logic')
print('------------------------------------------------------------------')
for each in sorted(list(pins)):
    if direction[each] == 'OUT_OD':
        if (part=='spartan3' or part=='spartan6'):
            print('    OBUFT_%s : OBUFT' % (each))
            print('      generic map (')
            if drive[each]=='-':
                print('        DRIVE        => 12,')
            else:
                print('        DRIVE        => %s,' % drive[each])
            if slew[each]=='-':
                print('        SLEW         => "SLOW",')
            else:
                print('        SLEW         => "%s",' % slew[each])
            print('        IOSTANDARD   => "%s")' % (types[each]))
            print('      port map (')
            print('        O => E_%s,  -- Buffer output (connect directly to top-level port)' % (each))
            print('        I => \'0\',%s -- Buffer input ' % (' '*len(each)))
            if ddr[each] != '-':
                print('        T  => %s_DDRT -- 3-state enable input, high=input, low=output' % (each))
            elif power_en[each] != '-':
                print('        T => %s_T_N -- 3-state enable input, high=input, low=output' % (each))
            else:
                print('        T => %s     -- 3-state enable input, high=input, low=output' % (each))
            print('        );\n')
        elif (part=='cyclone4'):
            print('    OBUFT_%s : alt_outbuf_tri_fix' % (each))
            print('      generic map (')
            #(JP-tmp)       print ('          io_standard           => "%s",' % (altera_types[types[each]]))
            #(JP-tmp)       print ('          current_strength      => "%s",' % ("12" if drive[each]=='-' else drive[each]))
            #(JP-tmp)       print ('          slow_slew_rate        => "%s",' % ("ON" if slew[each]=="SLOW" else "OFF"))
            #(JP-tmp)       print ('          location              => "PIN_%s",' % (pins[each]))
            print('          enable_bus_hold       => "OFF"')
            #(JP-tmp)       print ('          weak_pull_up_resistor => "%s"' % ("ON" if pull[each]=="UP" else "OFF"))
            #print ('          termination           => "NO"')
            print('        )')
            print('    port map(')
            if ddr[each] != '-' and  power_en[each] != '-':
                print('        oe  => %s_DDRT, -- 3-state enable input, high=output, low=tristate' % (each))
            elif power_en[each] != '-':
                print('        oe => %s_T,     -- 3-state enable input, high=output, low=tristate' % (each))
            else:
                print('        oe => %s_OE,    -- 3-state enable input, high=output, low=tristate' % (each))
            print('        i  => %s,       -- Buffer input ' % (each))
            print('        o  => E_%s      -- Buffer output (connect directly to top-level port)' % (each))
            print('        );')
        else:
            print('ERROR part not correct %s' % (part))
            exit()

print('------------------------------------------------------------------')
print('-- Differential Output pin logic')
print('------------------------------------------------------------------')
for each in sorted(list(pins)):
    if direction[each] == 'DIFF_OUT':
        if (part=='spartan3' or part=='spartan6'):
            if power_en[each] == '-':
                print('    OBUFDS_%s : OBUFDS' % (each))
            else:
                print('    OBUFTDS_%s : OBUFTDS' % (each))
            print('      generic map (')
            print('        IOSTANDARD   => "%s")' % (types[each]))
            print('      port map (')
            if ddr[each] != '-' and  power_en[each] != '-':
                print('        T  => %s_DDRT, -- 3-state enable input, high=input, low=output' % (each))
            elif power_en[each] != '-':
                print('        T => %s_T_N,   -- 3-state enable input, high=input, low=output' % (each))
            print('        O  => E_%s_P,  -- Diff_p out port (connect directly to top-level port)' % (each))
            print('        OB => E_%s_N,  -- Diff_n out port (connect directly to top-level port)' % (each))
            print('        I  => %s       -- Buffer input ' % (each))
            print('        );\n')
        elif (part=='cyclone4'):
            if power_en[each] == '-':
                print('    OBUF_%s : alt_outbuf_diff' % (each))
            else:
                print('    OBUFT_%s : alt_outbuf_tri_diff' % (each))
            print('      generic map (')
            #(JP-tmp)       print ('          io_standard           => "%s",' % (altera_types[types[each]]))
            #(JP-tmp)       print ('          current_strength      => "%s",' % ("12" if drive[each]=='-' else drive[each]))
            #(JP-tmp)       print ('          location              => "PIN_%s",' % (pins[each]))
            print('          enable_bus_hold       => "OFF"')
            #(JP-tmp)       print ('          weak_pull_up_resistor => "%s"' % ("ON" if pull[each]=="UP" else "OFF"))
            #print ('          termination           => "NO"')
            print('        )')
            print('    port map(')
            if ddr[each] != '-' and  power_en[each] != '-':
                print('        oe    => %s_DDRT, -- 3-state enable input, high=output, low=tristate' % (each))
            elif power_en[each] != '-':
                print('        oe   => %s_T,     -- 3-state enable input, high=output, low=tristate' % (each))
            print('        i    => %s,       -- Buffer input ' % (each))
            print('        o    => E_%s_P    -- Diff_p output (connect directly to top-level port)' % (each))
            print('        obar => E_%s_N    -- Diff_n output (connect directly to top-level port)' % (each))
            print('        );')
        else:
            print('ERROR part not correct %s' % (part))
            exit()

print('------------------------------------------------------------------')
print('-- Differential Output pin logic with output enable')
print('------------------------------------------------------------------')
for each in sorted(list(pins)):
    if direction[each] == 'DIFF_OUT_OE':
        if (part=='spartan3' or part=='spartan6'):
            print('    OBUFTDS_%s : OBUFTDS' % (each))
            print('      generic map (')
            print('        IOSTANDARD   => "%s")' % (types[each]))
            print('      port map (')
            print('        O  => E_%s_P, -- Diff_p out port (connect directly to top-level port)' % (each))
            print('        OB => E_%s_N, -- Diff_n out port (connect directly to top-level port)' % (each))
            print('        I  => %s,     -- Buffer input ' % (each))
            if ddr[each] != '-':
                print('        T  => %s_DDRT -- 3-state enable input, high=input, low=output' % (each))
            elif power_en[each] != '-':
                print('        T => %s_T_N   -- 3-state enable input, high=input, low=output' % (each))
            else:
                print('        T  => %s_OE_N -- 3-state enable input, high=input, low=output' % (each))
            print('        );\n')
        elif part == 'cyclone4':
            print('    OBUFT_%s : alt_outbuf_tri_diff' % (each))
            print('      generic map (')
            #(JP-tmp)       print ('          io_standard           => "%s",' % (altera_types[types[each]]))
            #(JP-tmp)       print ('          current_strength      => "%s",' % ("12" if drive[each]=='-' else drive[each]))
            #(JP-tmp)       print ('          location              => "PIN_%s",' % (pins[each]))
            print('          enable_bus_hold       => "OFF"')
            #(JP-tmp)       print ('          weak_pull_up_resistor => "%s"' % ("ON" if pull[each]=="UP" else "OFF"))
            #print ('          termination           => "NO"')
            print('        )')
            print('    port map(')
            if ddr[each] != '-' and  power_en[each] != '-':
                print('        oe    => %s_DDRT, -- 3-state enable input, high=output, low=tristate' % (each))
            elif power_en[each] != '-':
                print('        oe   => %s_T,     -- 3-state enable input, high=output, low=tristate' % (each))
            else:
                print('        oe   => %s_OE,    -- 3-state enable input, high=output, low=tristate' % (each))
            print('        i    => %s,       -- Buffer input ' % (each))
            print('        o    => E_%s_P    -- Diff_p output (connect directly to top-level port)' % (each))
            print('        obar => E_%s_N    -- Diff_n output (connect directly to top-level port)' % (each))
            print('        );')
        else:
            print('ERROR part not correct %s' % (part))
            exit()



print('------------------------------------------------------------------')
print('-- DDR logic')
print('------------------------------------------------------------------')
for each in sorted(list(pins)):
    if ddr[each] != '-':
        if (part=='spartan3' or part=='spartan6'):
            if direction[each] == 'BIDI' or direction[each] == 'DIFF_BIDI':
                print('    IDDR2_%s : IDDR2' % (each))
                print('      generic map(')
                print('        DDR_ALIGNMENT => "%s",%s-- Sets output alignment to "NONE", "C0", "C1"' % (ddr[each],' '*(len(srtype[each])+2-len(ddr[each]))))
                print('        INIT_Q0       => \'%s\',%s-- Sets initial state of the Q0 output to 0 or 1' % (init0[each],' '*(len(srtype[each])+1)))
                print('        INIT_Q1       => \'%s\',%s-- Sets initial state of the Q1 output to 0 or 1' % (init1[each],' '*(len(srtype[each])+1)))
                print('        SRTYPE        => "%s")  -- Specifies "SYNC" or "ASYNC" set/reset' % (srtype[each]))
                print('      port map (')
                print('        Q0 => %s_DIN(0), -- 1-bit output captured with C0 clock' % (each))
                print('        Q1 => %s_DIN(1), -- 1-bit output captured with C1 clock' % (each))
                print('        C0 => %s_CLK(0), -- 1-bit clock input' % (each))
                print('        C1 => %s_CLK(1), -- 1-bit clock input' % (each))
                print('        CE => %s_CE,     -- 1-bit clock enable input' % (each))
                print('        D  => %s_IN,     -- 1-bit data input' % (each))
                print('        R  => %s_R,      -- 1-bit reset input to invert initial condition' % (each))
                print('        S  => \'0\' %s     -- 1-bit set input initial condition' % (' '*len(each)))
                print('        );\n')
                print('    ODDR2_%s : ODDR2' % (each))
                print('      generic map(')
                print('        DDR_ALIGNMENT => "%s",%s-- Sets output alignment to "NONE", "C0", "C1"' % (ddr[each],' '*(len(srtype[each])+2-len(ddr[each]))))
                print('        INIT          => \'%s\',%s-- Sets initial state of the Q output to 0 or 1' % (init0[each],' '*(len(srtype[each])+1)))
                print('        SRTYPE        => "%s")  -- Specifies "SYNC" or "ASYNC" set/reset' % (srtype[each]))
                print('      port map (')
                print('        Q  => %s_OUT,     -- 1-bit output data' % (each))
                print('        C0 => %s_CLK(0),  -- 1-bit clock input' % (each))
                print('        C1 => %s_CLK(1),  -- 1-bit clock input' % (each))
                print('        CE => %s_CE,      -- 1-bit clock enable input' % (each))
                print('        D0 => %s_DOUT(0), -- 1-bit data input (associated with C0)' % (each))
                print('        D1 => %s_DOUT(1), -- 1-bit data input (associated with C1)' % (each))
                print('        R  => %s_R,       -- 1-bit reset input to invert initial condition' % (each))
                print('        S  => \'0\' %s      -- 1-bit set input initial condition' % (' '*len(each)))
                print('        );\n')
                print('    ODDR2_%s_T : ODDR2    -- Output enable DDR as required by spartan6' % (each))
                print('      generic map(')
                print('        DDR_ALIGNMENT => "%s",%s-- Sets output alignment to "NONE", "C0", "C1"' % (ddr[each],' '*(len(srtype[each])+2-len(ddr[each]))))
                print('        INIT          => \'1\',%s-- Sets initial state of the Q output or 1 open/high-z' % (' '*(len(srtype[each])+1)))
                print('        SRTYPE        => "%s")  -- Specifies "SYNC" or "ASYNC" set/reset' % (srtype[each]))
                print('      port map (')
                print('        Q  => %s_DDRT,    -- 1-bit output enable' % (each))
                print('        C0 => %s_CLK(0),  -- 1-bit clock input clocking on rising only' % (each))
                print('        C1 => %s_CLK(1),  -- 1-bit clock input clocking on rising only' % (each))
                print('        CE => %s_CE,      -- 1-bit clock enable input' % (each))
                if power_en[each] == '-':
                    print('        D0 => %s_OE_N,    -- 1-bit the output enable' % (each))
                    print('        D1 => %s_OE_N,    -- 1-bit both bits are output enable' % (each))
                else:
                    print('        D0 => %s_T_N,     -- 1-bit the output enable' % (each))
                    print('        D1 => %s_T_N,     -- 1-bit both bits are output enable' % (each))
                print('        R  => %s_R,    -- 1-bit reset input to invert initial condition' % (each))
                print('        S  => \'0\' %s   -- 1-bit set input initial condition' % (' '*len(each)))
                print('        );\n')
            elif 'IN' in direction[each]:
                print('    IDDR2_%s : IDDR2' % (each))
                print('      generic map(')
                print('        DDR_ALIGNMENT => "%s",%s-- Sets output alignment to "NONE", "C0", "C1"' % (ddr[each],' '*(len(srtype[each])+2-len(ddr[each]))))
                print('        INIT_Q0       => \'%s\',%s-- Sets initial state of the Q0 output to 0 or 1' % (init0[each],' '*(len(srtype[each])+1)))
                print('        INIT_Q1       => \'%s\',%s-- Sets initial state of the Q1 output to 0 or 1' % (init1[each],' '*(len(srtype[each])+1)))
                print('        SRTYPE        => "%s")  -- Specifies "SYNC" or "ASYNC" set/reset' % (srtype[each]))
                print('      port map (')
                print('        Q0 => %s_D(0),   -- 1-bit output captured with C0 clock' % (each))
                print('        Q1 => %s_D(1),   -- 1-bit output captured with C1 clock' % (each))
                print('        C0 => %s_CLK(0), -- 1-bit clock input' % (each))
                print('        C1 => %s_CLK(1), -- 1-bit clock input' % (each))
                print('        CE => %s_CE,     -- 1-bit clock enable input' % (each))
                print('        D  => %s,        -- 1-bit data input' % (each))
                print('        R  => %s_R,      -- 1-bit reset input to invert initial condition' % (each))
                print('        S  => \'0\' %s     -- 1-bit set input initial condition' % (' '*len(each)))
                print('        );\n')
            else:
                print('    ODDR2_%s : ODDR2' % (each))
                print('      generic map(')
                print('        DDR_ALIGNMENT => "%s",%s-- Sets output alignment to "NONE", "C0", "C1"' % (ddr[each],' '*(len(srtype[each])+2-len(ddr[each]))))
                print('        INIT          => \'%s\',%s-- Sets initial state of the Q output to 0 or 1' % (init0[each],' '*(len(srtype[each])+1)))
                print('        SRTYPE        => "%s")  -- Specifies "SYNC" or "ASYNC" set/reset' % (srtype[each]))
                print('      port map (')
                print('        Q  => %s,         -- 1-bit output data' % (each))
                print('        C0 => %s_CLK(0),  -- 1-bit clock input' % (each))
                print('        C1 => %s_CLK(1),  -- 1-bit clock input' % (each))
                print('        CE => %s_CE,      -- 1-bit clock enable input' % (each))
                print('        D0 => %s_D(0),    -- 1-bit data input (associated with C0)' % (each))
                print('        D1 => %s_D(1),    -- 1-bit data input (associated with C1)' % (each))
                print('        R  => %s_R,       -- 1-bit reset input to invert initial condition' % (each))
                print('        S  => \'0\' %s      -- 1-bit set input initial condition' % (' '*len(each)))
                print('        );\n')
                if direction[each] == 'OUT_OE' or direction[each] == 'OUT_OD' or power_en[each] != '-':
                    print('    ODDR2_%s_T : ODDR2    -- Output enable DDR as required by spartan6' % (each))
                    print('      generic map(')
                    print('        DDR_ALIGNMENT => "%s",%s-- Sets output alignment to "NONE", "C0", "C1"' % (ddr[each],' '*(len(srtype[each])+2-len(ddr[each]))))
                    print('        INIT          => \'0\',%s-- Sets initial state of Q or 1(init inverted) high-z when reset' % (' '*(len(srtype[each])+1)))
                    print('        SRTYPE        => "%s")  -- Specifies "SYNC" or "ASYNC" set/reset' % (srtype[each]))
                    print('      port map (')
                    print('        Q  => %s_DDRT,    -- 1-bit output enable' % (each))
                    print('        C0 => %s_CLK(0),  -- 1-bit clock input clocking on rising only' % (each))
                    print('        C1 => %s_CLK(1),  -- 1-bit clock input clocking on rising only' % (each))
                    print('        CE => %s_CE,      -- 1-bit clock enable input' % (each))
                    if power_en[each] == '-':
                        print ('        D0 => %s_OE_N,    -- 1-bit the output enable' % (each))
                        print ('        D1 => %s_OE_N,    -- 1-bit both bits are output enable' % (each))
                    else:
                        print ('        D0 => %s_T_N,     -- 1-bit the output enable' % (each))
                        print ('        D1 => %s_T_N,     -- 1-bit both bits are output enable' % (each))
                    print ('        R  => %s_R,       -- 1-bit reset input to invert initial condition' % (each))
                    print ('        S  => \'0\' %s      -- 1-bit set input initial condition' % (' '*len(each)))
                    print ('        );\n')
                elif direction[each] == 'OUT_OD' or power_en[each] != '-':
                    print ('    ODDR2_%s_T : ODDR2    -- Output enable DDR as required by spartan6' % (each))
                    print ('      generic map(')
                    print ('        DDR_ALIGNMENT => "%s",%s-- Sets output alignment to "NONE", "C0", "C1"' % (ddr[each],' '*(len(srtype[each])+2-len(ddr[each]))))
                    print ('        INIT          => \'0\',%s-- Sets initial state of Q or 1(init inverted) high-z when reset' % (' '*(len(srtype[each])+1)))
                    print ('        SRTYPE        => "%s")  -- Specifies "SYNC" or "ASYNC" set/reset' % (srtype[each]))
                    print ('      port map (')
                    print ('        Q  => %s_DDRT,    -- 1-bit output enable' % (each))
                    print ('        C0 => %s_CLK(0),  -- 1-bit clock input clocking on rising only' % (each))
                    print ('        C1 => %s_CLK(1),  -- 1-bit clock input clocking on rising only' % (each))
                    print ('        CE => %s_CE,      -- 1-bit clock enable input' % (each))
                    if power_en[each] == '-':
                        print ('        D0 => %s,         -- 1-bit the output enable' % (each))
                        print ('        D1 => %s,         -- 1-bit both bits are output enable' % (each))
                    else:
                        print ('        D0 => %s_T_N,     -- 1-bit the output enable' % (each))
                        print ('        D1 => %s_T_N,     -- 1-bit both bits are output enable' % (each))
                    print ('        R  => %s_R,       -- 1-bit reset input to invert initial condition' % (each))
                    print ('        S  => \'0\' %s      -- 1-bit set input initial condition' % (' '*len(each)))
                    print ('        );\n')
        else:
            print ("DDR logic not done for %s go fix the scripts/n   (also need to fix signal {name}_DDRT for it's/n   output enable it is inverted output from xilinx)")
            exit()
'''
****************************************************************************
Multi signal logic resolution
****************************************************************************
'''
print('')
print('-----------------------------------------------------------------')
print('------------------- Internal Multipin Signals -------------------')
print('-----------------------------------------------------------------')
for each in sorted(list(pins)):
    if each.startswith('FPGA_MULTI_PIN_'):
        out_eq = []
        out_en = []
        if direction[each] == "IN_CLK":
            print("\n-- Handling %s as IN_CLK" % each)
            exit()
        elif direction[each] == "IN":
            print("\n-- Handling %s as IN" % each)
            equation = []
            for the_new_sig in find_sigs(multi_pins,pins[each]):
                print ("  -- signal %s as %s" % (the_new_sig,multi_direction[the_new_sig]))
                the_boards = []
                the_boards = prefix([x.strip() for x in multi_boards[the_new_sig].split(':')], 'BOARD_')
                equation = [('%s AND (%s)' % (each,
                                              ' OR '.join(map(str,the_boards))))]
                if the_new_sig in duplicate_pins.keys():
                    print(duplicate_pins.keys())
                    the_boards = []
                    the_boards = prefix([x.strip() for x in duplicate_boards[the_new_sig].split(':')], 'BOARD_')
                    equation += [('%s AND (%s)' % (each,
                                                   ' OR '.join(map(str, the_boards))))]
                if multi_time_domain[the_new_sig] != '-':
                    print('    %s_ML1 <= (%s);' % (the_new_sig, ' OR '.join(map(str, equation))))
                else:
                    print('    %s <= (%s);' % (the_new_sig, ' OR '.join(map(str, equation))))
        elif direction[each] == "DIFF_IN":
            print("\n-- Handling %s as DIFF_IN" % each)
            exit()
        elif direction[each] == "BIDI":
            print("\n-- Handling %s as BIDI" % each)
            out_eq = []
            out_en = []
            for the_new_sig in find_sigs(multi_pins, pins[each]):
                print("  -- signal %s as %s" % (the_new_sig, multi_direction[the_new_sig]))
                if (multi_direction[the_new_sig] == "IN") or (multi_direction[the_new_sig] == "BIDI"):
                    the_boards = []
                    the_boards = prefix([x.strip() for x in multi_boards[the_new_sig].split(':')], 'BOARD_')
                    equation = [('(%s_IN AND (%s))' % (each,
                                                       ' OR '.join(map(str, the_boards))))]
                    if the_new_sig in duplicate_pins.keys():
                        # print duplicate_pins.keys()
                        the_boards = []
                        the_boards = prefix([x.strip() for x in duplicate_boards[the_new_sig].split(':')], 'BOARD_')
                        the_dup_src_pin = 'FPGA_MULTI_PIN_' + duplicate_pins[the_new_sig]
                        if direction[the_dup_src_pin] == 'IN':
                            equation += [('(%s AND (%s))' % ((the_dup_src_pin), ' OR '.join(map(str, the_boards))))]
                        else:
                            equation += [('(%s_IN AND (%s))' % ((the_dup_src_pin), ' OR '.join(map(str, the_boards))))]
                    if multi_direction[the_new_sig] == 'IN':
                        if multi_time_domain[the_new_sig] != '-':
                            print('    %s_ML1 <= (%s);' % (the_new_sig, ' OR '.join(map(str, equation))))
                        else:
                            print('    %s <= (%s);' % (the_new_sig, ' OR '.join(map(str, equation))))
                    else:
                        print('    %s_IN <= (%s);' % (the_new_sig, ' OR '.join(map(str, equation))))
                if ((multi_direction[the_new_sig] == "OUT") or
                        (multi_direction[the_new_sig] == "OUT_EN") or
                        (multi_direction[the_new_sig] == "BIDI")):
                    the_boards = []
                    the_boards = prefix([x.strip() for x in multi_boards[the_new_sig].split(':')], 'BOARD_')
                    if multi_direction[the_new_sig] == "OUT":
                        out_eq += [('(%s AND (%s))' %(the_new_sig, ' OR '.join(map(str, the_boards))))]
                        if multi_power_en[the_new_sig] != '-':
                            out_en += [('(%s_T_N OR (NOT (%s)))' % (the_new_sig, ' OR '.join(map(str, the_boards))))]
                        else:
                            out_en += [('(NOT (%s))' % (' OR '.join(map(str,the_boards))))]
                    elif(multi_direction[the_new_sig] == "OUT_EN") or (multi_direction[the_new_sig] == "BIDI"):
                        out_eq += [('(%s_OUT AND (%s))' %(the_new_sig,' OR '.join(map(str,the_boards))))]
                        if multi_power_en[the_new_sig] != '-':
                            out_en += [('(%s_T_N OR %s_OE_N OR (NOT(%s)))' %(the_new_sig,the_new_sig, ' OR '.join(map(str, the_boards))))]
                        else:
                            out_en += [('(%s_OE_N OR  (NOT(%s)))' %(the_new_sig, ' OR '.join(map(str, the_boards))))]
                    for the_dup_sig in find_sigs(duplicate_pins,pins[each]):
                        the_boards = []
                        the_boards = prefix([x.strip() for x in duplicate_boards[the_dup_sig].split(':')], 'BOARD_')
                        if multi_direction[the_dup_sig] == "OUT":
                            out_eq += [('(%s AND (%s))' % (the_dup_sig, ' OR '.join(map(str,the_boards))))]
                            if multi_power_en[the_new_sig] != '-':
                                out_en += [('(%s_T_N or (NOT (%s)))' % (the_new_sig, ' OR '.join(map(str, the_boards))))]
                            else:
                                out_en += [('(NOT (%s))' % (' OR '.join(map(str,the_boards))))]
                        elif ((multi_direction[the_dup_sig] == "OUT_EN") or (multi_direction[the_dup_sig] == "BIDI")):
                            out_eq += [('(%s_OUT AND (%s))' % (the_dup_sig, ' OR '.join(map(str, the_boards))))]
                            if(multi_power_en[the_new_sig] != '-'):
                                out_en += [('(%s_T_N OR %s_OE_N OR  (NOT(%s)))' % (the_dup_sig, the_dup_sig, ' OR '.join(map(str, the_boards))))]
                            else:
                                out_en += [('(%s_OE_N OR  (NOT(%s)))' %(the_dup_sig, ' OR '.join(map(str,the_boards))))]
                        else:
                            print('Unsupported Direction type %s for duplicate signal %s' % (multi_direction[the_dup_sig], the_dup_sig))
                            exit()
                elif multi_direction[the_new_sig] == "OUT_OD":
                    the_boards = []
                    the_boards = prefix([x.strip() for x in multi_boards[the_new_sig].split(':')], 'BOARD_')
                    out_eq += [('(\'0\' AND (%s))' % (' OR '.join(map(str,the_boards))))]
                    out_en += [('(%s OR  (NOT(%s)))' % (the_new_sig,' OR '.join(map(str,the_boards))))]
                    for the_dup_sig in find_sigs(duplicate_pins,pins[each]):
                        the_boards = []
                        the_boards = prefix([x.strip() for x in duplicate_boards[the_dup_sig].split(':')], 'BOARD_')
                        out_eq += [('(\'0\' AND (%s))' % (' OR '.join(map(str, the_boards))))]
                        out_en += [('(%s OR  (NOT(%s)))' % (the_dup_sig, ' OR '.join(map(str, the_boards))))]
                elif multi_direction[the_new_sig] == "OUT_OE":
                    the_boards = []
                    the_boards = prefix([x.strip() for x in multi_boards[the_new_sig].split(':')], 'BOARD_')
                    out_en += [('(%s OR  (NOT(%s)))' % (the_new_sig, ' OR '.join(map(str, the_boards))))]
                    for the_dup_sig in find_sigs(duplicate_pins,pins[each]):
                        the_boards = []
                        the_boards = prefix([x.strip() for x in duplicate_boards[the_dup_sig].split(':')], 'BOARD_')
                        out_en += [('(%s OR  (NOT(%s)))' %(the_dup_sig, ' OR '.join(map(str, the_boards))))]
                elif multi_direction[the_new_sig] != "IN":
                    print("    -- %s of %s" % (the_new_sig, multi_direction[the_new_sig]))
                    print("Don't know what to do fix script")
                    exit()
            for the_new_sig in find_sigs(duplicate_pins,pins[each]):
                print("    -- duplicate %s of %s" % (the_new_sig, multi_direction[the_new_sig]))
                the_boards = []
                the_boards = prefix([x.strip() for x in duplicate_boards[the_dup_sig].split(':')], 'BOARD_')
                #if (multi_direction[the_new_sig] == 'IN'):
                #    print ('    %s <= (%s);' % (the_new_sig,('(%s AND (%s))' % ((the_dup_src_pin),
                #                                                                ' OR '.join(map(str,the_boards))))))
                #elif (multi_direction[the_new_sig] == 'BIDI'):
                #    print ('    %s_IN <= (%s);' % (the_new_sig,('(%s_IN AND (%s))' % ((the_dup_src_pin),
                #                                                                      ' OR '.join(map(str,the_boards))))))

                if ((multi_direction[the_new_sig] == "OUT") or
                        (multi_direction[the_new_sig] == "OUT_OE") or
                        (multi_direction[the_new_sig] == "OUT_OD") or
                        (multi_direction[the_new_sig] == "BIDI")):
                    if ((the_new_sig not in ' OR  '.join(map(str, out_eq))) or
                            (the_new_sig not in ' AND '.join(map(str, out_en)))):
                        if multi_direction[the_new_sig] == "BIDI":
                            out_eq += [('(%s_OUT AND (%s))' % (the_new_sig, ' OR '.join(map(str,the_boards))))]
                            out_en += [('(%s_OE_N OR  (NOT(%s)))' % (the_new_sig, ' OR '.join(map(str,the_boards))))]
                        else:
                            print("%s\n%s\nUn handled output duplicate for %s" % (out_eq,out_en,the_new_sig))
                            exit()
            if len(out_eq) > 0:
                print('    %s_OUT <= (%s);' % (each,' OR '.join(map(str,out_eq))))
            if len(out_en) >0:
                print('    %s_OE_N <= (%s);' % (each,' AND '.join(map(str,out_en))))

        elif direction[each] == "DIFF_BIDI":
            print("\n-- Handling %s as DIFF_BIDI" % each)
            exit()
        elif direction[each] == "OUT":
            print("\n-- Handling %s as OUT" % each)
            equation = []
            for the_new_sig in find_sigs(multi_pins,pins[each]):
                print("  -- signal %s as %s" % (the_new_sig,multi_direction[the_new_sig]))
                the_boards = []
                the_boards = prefix([x.strip() for x in multi_boards[the_new_sig].split(':')],'BOARD_')
                equation += [('(%s AND (%s))' % (the_new_sig, ' OR '.join(map(str,the_boards))))]
            for the_new_sig in find_sigs(duplicate_pins,pins[each]):
                print("  -- signal %s as %s" % (the_new_sig, multi_direction[the_new_sig]))
                the_boards = []
                the_boards = prefix([x.strip() for x in duplicate_boards[the_new_sig].split(':')],'BOARD_')
                equation += [('(%s AND (%s))' % (the_new_sig, ' OR '.join(map(str,the_boards))))]
            print('    %s <= (%s);' % (each, ' OR '.join(map(str, equation))))
        elif direction[each] == "OUT_OE":
            print("\n-- Handling %s as OUT_OE" % each)
            equation = []
            equation_oe = []
            for the_new_sig in find_sigs(multi_pins,pins[each]):
                print("  -- signal %s as %s" % (the_new_sig, multi_direction[the_new_sig]))
                the_boards = []
                the_boards = prefix([x.strip() for x in multi_boards[the_new_sig].split(':')], 'BOARD_')
                equation += [('(%s      AND     (%s))' % (the_new_sig,' OR '.join(map(str, the_boards))))]
                equation_oe += [('(%s_OE_N OR  (NOT(%s)))' % (the_new_sig, ' OR '.join(map(str, the_boards))))]
            print('    %s      <= (%s);' % (each, ' OR  '.join(map(str,equation))))
            print('    %s_OE_N <= (%s);' % (each, ' AND '.join(map(str,equation_oe))))
            for the_new_sig in find_sigs(duplicate_pins, pins[each]):
                print("    -- duplicate %s of %s" % (the_new_sig, multi_direction[the_new_sig]))
                exit()
        elif direction[each] == "OUT_OD":
            print("\n-- Handling %s as OUT_OD" % each)
            equation = []
            for the_new_sig in find_sigs(multi_pins,pins[each]):
                print("  -- signal %s as %s" % (the_new_sig,multi_direction[the_new_sig]))
                the_boards = []
                the_boards=prefix([x.strip() for x in multi_boards[the_new_sig].split(':')],'BOARD_')
                equation += [('(%s AND (%s))' %(the_new_sig,' OR '.join(map(str,the_boards))))]
            print('    %s      <= (%s);' % (each,' OR  '.join(map(str,equation))))
            for the_new_sig in find_sigs(duplicate_pins,pins[each]):
                print("    -- duplicate %s of %s" % (the_new_sig,multi_direction[the_new_sig]))
                exit()
        elif direction[each] == "DIFF_OUT":
            print("\n-- Handling %s as DIFF_OUT" % each)
            exit()
        elif direction[each] == "DIFF_OUT_OE":
            print("\n-- Handling %s as DIFF_OUT_OE" % each)
            exit()

'''
****************************************************************************
Footer
****************************************************************************
'''
print ('\n\nend rtl;')
