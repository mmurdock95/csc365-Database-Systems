#Michael Murdock
#rmurdock@calpoly.edu
#CSC365 EBuckalew
#Lab 2
import csv

#read in the csv file and seperate the columns
fileName = "Reservations"
file = open(fileName + ".csv", 'r')
fileOut = open(fileName + ".txt", 'w')

f1 = "id"
f2 = "code"
f3 = "room"
f4 = "checkIn"
f5 = "checkOut"
f6 = "rate"
f7 = "lastName"
f8 = "firstName"
f9 = "adults"
f10 = "kids"

reader = csv.DictReader(file, skipinitialspace=True, fieldnames = (f2, f3, f4, f5, f6, f7, f8, f9, f10))

i = 0
for row in reader:
   if i != 0:
      fileOut.write("INSERT INTO " + fileName + "(" + f2 + "," + f3 + "," + f4 + "," + f5 + "," + f6 +
         "," + f7 + "," + f8 + "," + f9 + "," + f10 + ") VALUES (" 
         + row[f2] + "," + row[f3]  + "," + "STR_TO_DATE(" + row[f4] + ", \"%d-%M-%y\")" + "," + "STR_TO_DATE(" + row[f5] + ", \"%d-%M-%y\")" + "," + row[f6] + "," + row[f7] +
         "," + row[f8] + "," + row[f9] + "," + row[f10] +");" + '\n')
   i += 1

fileOut.close()
file.close()