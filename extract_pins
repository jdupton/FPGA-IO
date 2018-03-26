import os
import sys
import xlsxwriter
from pathlib import Path

""""
*****************************************************
 Initial variable setup
*****************************************************
"""
path = os.getcwd()
file = sys.argv[1] + ".dat"
full_path = Path(os.path.join(path,file))

temp = sys.argv[1].split('_')
board = temp[0]

"""
*****************************************************
 Create an Excel workbook and add a worksheet
*****************************************************
"""
workbook = xlsxwriter.Workbook("Pin_Information.xlsx")
worksheet = workbook.add_worksheet(sys.argv[1])
bold = workbook.add_format({'bold': True})

worksheet.write('A1', 'Signal', bold)
worksheet.set_column('A:A', 35)
worksheet.write('B1', 'Location', bold)
worksheet.set_column('B:B', 6)
worksheet.write('C1', 'Board', bold)
worksheet.set_column('C:C', 20)
row = 1
col = 0

"""
#*****************************************************
# Read in the file contents
#*****************************************************
"""
if full_path.is_file():
    filein = open(full_path, "r")

    try:
        lines = filein.readlines()
        for line in lines:
            line = line.strip("\n").strip("\r")
            field = line.split()

            """
            *****************************************************
             Remove title header and "---" field
            *****************************************************
            """
            if field[0] != 'Pin' and field[0] != '---':

                if len(field) == 3:
                    field.remove(field[1])
                    worksheet.write(row, col, field[1])
                    worksheet.write(row, col + 1, field[0])
                    worksheet.write(row, col + 2, sys.argv[1])
                    row += 1

                elif len(field) == 4:
                    field.remove(field[1])
                    field.remove(field[1])
                    worksheet.write(row, col, field[1])
                    worksheet.write(row, col + 1, field[0])
                    worksheet.write(row, col + 2, sys.argv[1])
                    row += 1

    finally:
        filein.close()

elif full_path.is_file() != True:
    exit(1)
