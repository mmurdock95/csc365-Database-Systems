#Michael Murdock
#rmurdock@calpoly.edu
#CSC365 EBuckalew
#Lab 2
import csv

#read in the csv file and seperate the columns
fileName = "cars-data"
file = open(fileName + ".csv", 'r')
fileOut = open(fileName + ".txt", 'w')

f1 = "id"
f2 = "mpg"
f3 = "cylinders"
f4 = "eDispl"
f5 = "horsepower"
f6 = "weight"
f7 = "accelerate"
f8 = "year"

reader = csv.DictReader(file, skipinitialspace=True, fieldnames = (f1, f2, f3, f4, f5, f6, f7, f8))

i = 0
for row in reader:
   if i != 0:
      fileOut.write("INSERT INTO " + "carsData" + "(" + f2 + "," + f3 + "," + f4 + "," + f5 + "," + f6 +
         "," + f7 + "," + f8 + ") VALUES (" 
         + row[f2] + "," + row[f3]  + "," + row[f4] + "," + row[f5] + "," + row[f6] + "," + row[f7] +
         "," + row[f8] + ");" + '\n')
   i += 1

fileOut.close()
file.close()