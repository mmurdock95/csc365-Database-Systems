#Michael Murdock
#rmurdock@calpoly.edu
#CSC365 EBuckalew
#Lab 2
import csv

#read in the csv file and seperate the columns
fileName = "marathon"
file = open(fileName + ".csv", 'r')
fileOut = open(fileName + ".txt", 'w')

f1 = "id"
f2 = "place"
f3 = "time_"
f4 = "pace"
f5 = "groupPlace"
f6 = "group_"
f7 = "age"
f8 = "sex"
f9 = "bibNumber"
f10 = "firstName" 
f11 = "lastName" 
f12 = "town" 
f13 = "state" 

reader = csv.DictReader(file, skipinitialspace=True, fieldnames = (f2, f3, f4, f5, f6, f7, f8, f9, f10, f11, f12, f13))

i = 0
for row in reader:
   if i != 0:
      fileOut.write("INSERT INTO " + fileName + "(" + f2 + "," + f3 + "," + f4 + "," + f5 + "," + f6 +
         "," + f7 + "," + f8 + "," + f9 + "," + f10 + "," + f11 + "," + f12 + "," + f13 + ") VALUES (" 
         + row[f2] + "," + row[f3]  + "," + "STR_TO_DATE(" + row[f4] + ",\"%i:%s\")" + "," + row[f5] + "," + row[f6] + "," + row[f7] +
         "," + row[f8] + "," + row[f9] + "," + row[f10] + "," + row[f11] + "," + row[f12] + "," + row[f13] +");" + '\n')
   i += 1

fileOut.close()
file.close()