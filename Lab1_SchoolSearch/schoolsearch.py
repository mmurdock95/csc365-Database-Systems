# BY: MICHAEL MURDOCK JONATHAN CHERUVELIL
# CSC365
import csv, sys, re

search = "."
while search.startswith('Q') == False:
   file = open("students.txt", 'r')
   reader = csv.DictReader(file, fieldnames = ("StLastName", "StFirstName", "Grade", "Classroom", "Bus", "GPA", "TLastName", "TFirstName"))

   # if searchArray[0] != " ":
   #    print "S[tudent]: <lastname> [B[us]]"
   #    print "T[eacher]: <lastname>"
   #    print "B[us]: <number>"
   #    print "G[rade]: <number> [[H[igh]]|[L[ow]]]"
   #    print "A[verage]: <number>"
   #    print "I[nfo]"
   #    print "Q[uit]"

   search = " "
   search = raw_input()#("Enter your command: ")

   try:
      searchArray = re.split(":\s+", search)
   except ValueError:
      print "Input Error"
      searchArray[0] = " "

   #print "\n"

   if searchArray[0] in ["S", "Student"]:
      searchArray2 = re.split("\s+", searchArray[1])

      if len(searchArray2) > 1: 
         for row in reader:
            if row['StLastName'] == searchArray2[0]:
               print row['StLastName'] + " " + row['StFirstName'] + " " + row['Bus']
      else:
         for row in reader:
            if row['StLastName'] == searchArray[1]:
               print row['StLastName'] + " " + row['StFirstName'] + " " + row['Grade'] + " " + row['Classroom'] + " " + row['TLastName'] + " " + row['TFirstName']

   if searchArray[0] in ["T", "Teacher"]:
      searchArray2 = re.split("\s+", searchArray[1])

      for row in reader:
         if row['TLastName'] == searchArray[1]:
            print row['StLastName'] + " " + row['StFirstName']

   if searchArray[0] in ["B", "Bus"]:
      searchArray2 = re.split("\s+", searchArray[1])

      for row in reader:
         if row['Bus'] == searchArray[1]:
            print row['StLastName'] + " " + row['StFirstName'] + " " + row['Grade'] + " " + row['Classroom']

   if searchArray[0] in ["G", "Grade"]:
      searchArray2 = re.split("\s+", searchArray[1])

      if len(searchArray2) == 1:
         for row in reader:
            if row['Grade'] == searchArray[1]:
               print row['StLastName'] + " " + row['StFirstName']
      else:
         if searchArray2[1] in ["H", "High"]:
            highGPA = 0.0
            for row in reader:
               if row['Grade'] == searchArray2[0]:
                  if float(row['GPA']) > highGPA:
                     highGPA = float(row['GPA'])
                     highGPArow = row
            print highGPArow['StLastName'] + " " + highGPArow['StFirstName'] + " " + highGPArow['GPA'] + " " + highGPArow['TLastName'] + " " + highGPArow['TFirstName'] + " " + highGPArow['Bus']
        
         if searchArray2[1] in ["L", "Low"]:
            lowGPA = 5.0
            for row in reader:
               if row['Grade'] == searchArray2[0]:
                  if float(row['GPA']) < lowGPA:
                     lowGPA = float(row['GPA'])
                     lowGPArow = row
            print lowGPArow['StLastName'] + " " + lowGPArow['StFirstName'] + " " + lowGPArow['GPA'] + " " + lowGPArow['TLastName'] + " " + lowGPArow['TFirstName'] + " " + lowGPArow['Bus']

   if searchArray[0]  in ["A", "Average"]:
      searchArray2 = re.split("\s+", searchArray[1])

      totalStudents = 0.0
      totalGPA = 0.0
      average = 0.0
      for row in reader:
         if row['Grade'] == searchArray[1]:
            totalStudents += 1
            totalGPA += float(row['GPA'])
      if totalStudents != 0:
         average = totalGPA/totalStudents
      print searchArray[1] + " " + str(average)
   if searchArray[0] in ["I", "Info"]:
      zero = 0
      one = 0
      two = 0
      three = 0
      four = 0
      five = 0 
      six = 0
      for row in reader:
         if int(row['Grade']) == 0:
            zero += 1
         if int(row['Grade']) == 1:
            one += 1
         if int(row['Grade']) == 2:
            two += 1
         if int(row['Grade']) == 3:
            three += 1
         if int(row['Grade']) == 4:
            four += 1
         if int(row['Grade']) == 5:
            five += 1
         if int(row['Grade']) == 6:
            six += 1
      print "0: " + str(zero) + "\n1: " + str(one) + "\n2: " + str(two) + "\n3: " + str(three) + "\n4: " + str(four) + "\n5: " + str(five) + "\n6: " + str(six)
   #print "\n\n\n"



