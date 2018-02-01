#Michael Murdock
#rmurdock@calpoly.edu
#CSC365 EBuckalew
#Lab 2
import csv

#read in the csv file and seperate the columns
fileName = "discipline-enrollments"
file = open(fileName + ".csv", 'r')
fileOut = open(fileName + ".txt", 'w')

f1 = "campus"
f2 = "discipline"
f3 = "year"
f4 = "undergraduate"
f5 = "graduate"

reader = csv.DictReader(file, skipinitialspace=True, fieldnames = (f1, f2, f3, f4, f5))

i = 0
for row in reader:
   if i != 0:
      fileOut.write("INSERT INTO " + "disciplineEnrollments" + "(" + f1 + "," + f2 + "," + f3 + "," + f4 + "," + f5 + ") VALUES (" 
         + row[f1] + "," + row[f2] + "," + row[f3]  + "," + row[f4] + "," + row[f5] + ");" + '\n')
   i += 1

fileOut.close()
file.close()