#Michael Murdock
#rmurdock@calpoly.edu
#rmurdock@calpoly.edu
#CSC365 EBuckalew
#Lab 2
import csv

#read in the csv file and seperate the columns
fileName = "wine"
file = open(fileName + ".csv", 'r')
fileOut = open(fileName + ".txt", 'w')

f1 = "id"
f2 = "grape"
f3 = "winery"
f4 = "appelation"
f5 = "state"
f6 = "name"
f7 = "year"
f8 = "price"
f9 = "score"
f10 = "cases" 
f11 = "drink" 

reader = csv.DictReader(file, skipinitialspace=True, fieldnames = (f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11))

i = 0
for row in reader:
   if i != 0:
      fileOut.write("INSERT INTO " + fileName + "(" + f2 + "," + f3 + "," + f4 + "," + f5 + "," + f6 +
         "," + f7 + "," + f8 + "," + f9 + "," + f10 + "," + f11 + ") VALUES (" 
         + row[f2] + "," + row[f3]  + "," + row[f4] + "," + row[f5] + "," + row[f6] + "," + row[f7] +
         "," + row[f8] + "," + row[f9] + "," + row[f10] + "," + row[f11] + ");" + '\n')
   i += 1

fileOut.close()
file.close()