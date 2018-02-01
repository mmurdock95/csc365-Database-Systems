#Michael Murdock
#rmurdock@calpoly.edu
#CSC365 EBuckalew
#Lab 2
import csv

#read in the csv file and seperate the columns
fileName = "Rooms"
file = open(fileName + ".csv", 'r')
fileOut = open(fileName + ".txt", 'w')

f1 = "id"
f2 = "roomName"
f3 = "beds"
f4 = "bedType"
f5 = "maxOccupancy"
f6 = "basePrice"
f7 = "decor"

reader = csv.DictReader(file, skipinitialspace=True, fieldnames = (f1, f2, f3, f4, f5, f6, f7))

i = 0
for row in reader:
   if i != 0:
      fileOut.write("INSERT INTO " + fileName + "(" + f1 + "," + f2 + "," + f3 + "," + f4 + "," + f5 + "," + f6 +
         "," + f7 + ") VALUES (" 
         + row[f1] + "," + row[f2] + "," + row[f3]  + "," + row[f4] + "," + row[f5] + "," + row[f6] + "," + row[f7]  + ");" + '\n')
   i += 1

fileOut.close()
file.close()