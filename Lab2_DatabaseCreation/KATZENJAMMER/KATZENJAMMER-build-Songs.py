#Michael Murdock
#rmurdock@calpoly.edu
#CSC365 EBuckalew
#Lab 2

#not finished, line 10 of songs has a comma
import csv

#read in the csv file and seperate the columns
fileName = "Songs"
file = open(fileName + ".csv", 'r')
fileOut = open(fileName + ".txt", 'w')

f1 = "id"
f2 = "title"

reader = csv.DictReader(file, skipinitialspace=True, fieldnames = (f1, f2))

i = 0
for row in reader:
   if i != 0:
      fileOut.write("INSERT INTO " + fileName + "(" + f2 + ") VALUES (" 
         + row[f2] + ");" + '\n')
   i += 1

fileOut.close()
file.close()