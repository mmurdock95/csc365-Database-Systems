#Michael Murdock
#rmurdock@calpoly.edu
#CSC365 EBuckalew
#Lab 2
import csv

#read in the csv file and seperate the columns
fileName = "Performance"
file = open(fileName + ".csv", 'r')
fileOut = open(fileName + ".txt", 'w')

f1 = "songId"
f2 = "bandmateId"
f3 = "stagePosition"

reader = csv.DictReader(file, skipinitialspace=True, fieldnames = (f1, f2, f3))

i = 0
for row in reader:
   if i != 0:
      fileOut.write("INSERT INTO " + fileName + "(" + f1 + "," + f2 + "," + f3 + ") VALUES (" 
         + row[f1] + "," + row[f2] + "," + row[f3] + ");" + '\n')
   i += 1

fileOut.close()
file.close()