#Michael Murdock
#rmurdock@calpoly.edu
#CSC365 EBuckalew
#Lab 2
import csv

#read in the csv file and seperate the columns
fileName = "goods"
file = open(fileName + ".csv", 'r')
fileOut = open(fileName + ".txt", 'w')

f1 = "id"
f2 = "flavor"
f3 = "food"
f4 = "price"

reader = csv.DictReader(file, skipinitialspace=True, fieldnames = (f1, f2, f3, f4))

i = 0
for row in reader:
   if i != 0:
      fileOut.write("INSERT INTO " + fileName + " (" + f1 + "," + f2 + "," + f3 + "," + f4 + ") VALUES (" 
         + row[f1] + "," + row[f2] + "," + row[f3]  + "," + row[f4] + ");" + '\n')
   i += 1

fileOut.close()
file.close()