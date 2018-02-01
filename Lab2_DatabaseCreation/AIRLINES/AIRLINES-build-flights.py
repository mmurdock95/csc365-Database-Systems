#Michael Murdock
#rmurdock@calpoly.edu
#CSC365 EBuckalew
#Lab 2
import csv

#read in the csv file and seperate the columns
fileName = "flights"
file = open(fileName + ".csv", 'r')
fileOut = open(fileName + ".txt", 'w')

f1 = "id"
f2 = "airline"
f3 = "flightNumber"
f4 = "sourceAirport"
f5 = "destAirport"

reader = csv.DictReader(file, skipinitialspace=True, fieldnames = (f2, f3, f4, f5))

i = 0
for row in reader:
   if i != 0:
      fileOut.write("INSERT INTO " + fileName + "(" + f2 + "," + f3 + "," + f4 + "," + f5 + ") VALUES (" 
         + row[f2] + "," + row[f3]  + "," + row[f4] + "," + row[f5] + ");" + '\n')
   i += 1

fileOut.close()
file.close()