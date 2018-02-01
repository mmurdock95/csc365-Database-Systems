# BY: MICHAEL MURDOCK JONATHAN CHERUVELIL
# CSC365
import csv, sys, re

search = "."
while search.startswith('Q') == False:
   file2 = open("list.txt", 'r')
   file3 = open("teachers.txt", 'r')
   
   sReader = csv.DictReader(file2, skipinitialspace=True, fieldnames = ("StLastName", "StFirstName", "Grade", "Classroom", "Bus", "GPA"))
   tReader = csv.DictReader(file3, skipinitialspace=True, fieldnames = ("TLastName", "TFirstName", "Classroom"))

   search = " "
   search = raw_input()

   try:
      searchArray = re.split(":\s+", search)
   except ValueError:
      print "Input Error"
      searchArray[0] = " "

   if searchArray[0] in ["S", "Student"]:
      searchArray2 = re.split("\s+", searchArray[1])
      if len(searchArray2) > 1: 
         for row in sReader:
            if row['StLastName'] == searchArray2[0]:
               print row['StLastName'] + " " + row['StFirstName'] + " " + row['Bus']
      else:
         for row in sReader:
            if row['StLastName'] == searchArray[1]:
               
               for tRow in tReader:
                  if tRow['Classroom'] == row['Classroom']:
                     print row['StLastName'] + " " + row['StFirstName'] + " " + row['Grade'] + " " + row['Classroom'] + " " + tRow['TLastName'] + " " + tRow['TFirstName']

   if searchArray[0] in ["T", "Teacher"]:
      searchArray2 = re.split("\s+", searchArray[1])
   
      for tRow in tReader:
         if tRow['TLastName'] == searchArray[1]:

            for row in sReader:
               if row['Classroom'] == tRow['Classroom']:
                  print row['StLastName'] + " " + row['StFirstName']

   if searchArray[0] in ["B", "Bus"]:
      searchArray2 = re.split("\s+", searchArray[1])

      for row in sReader:
         if row['Bus'] == searchArray[1]:
            print row['StLastName'] + " " + row['StFirstName'] + " " + row['Grade'] + " " + row['Classroom']

   if searchArray[0] in ["G", "Grade"]:
      searchArray2 = re.split("\s+", searchArray[1])

      if len(searchArray2) == 1:
         for row in sReader:
            if row['Grade'] == searchArray[1]:
               print row['StLastName'] + " " + row['StFirstName']
      else:
         if searchArray2[1] in ["H", "High"]:
            highGPA = 0.0
            for row in sReader:
               if row['Grade'] == searchArray2[0]:
                  if float(row['GPA']) > highGPA:
                     highGPA = float(row['GPA'])
                     highGPArow = row
            
            for tRow in tReader:
               if tRow['Classroom'] == highGPArow['Classroom']:
                  print highGPArow['StLastName'] + " " + highGPArow['StFirstName'] + " " + highGPArow['GPA'] + " " + tRow['TLastName'] + " " + tRow['TFirstName'] + " " + highGPArow['Bus']
        
         if searchArray2[1] in ["L", "Low"]:
            lowGPA = 5.0
            for row in sReader:
               if row['Grade'] == searchArray2[0]:
                  if float(row['GPA']) < lowGPA:
                     lowGPA = float(row['GPA'])
                     lowGPArow = row
            
            for tRow in tReader:
               if tRow['Classroom'] == highGPArow['Classroom']:
                  print lowGPArow['StLastName'] + " " + lowGPArow['StFirstName'] + " " + lowGPArow['GPA'] + " " + tRow['TLastName'] + " " + tRow['TFirstName'] + " " + lowGPArow['Bus']

         #NR3
         if searchArray2[1] in ["T", "Teachers"]:
            teacherList = []
            for row in sReader:
               if row['Grade'] == searchArray2[0]:
                  
                  for tRow in tReader:
                     if tRow['Classroom'] == row['Classroom']:
                        
                        name = tRow['TLastName'] + " " + tRow['TFirstName']
                        if name not in teacherList:
                           print name
                           teacherList.append(name)

   if searchArray[0]  in ["A", "Average"]:
      searchArray2 = re.split("\s+", searchArray[1])

      totalStudents = 0.0
      totalGPA = 0.0
      average = 0.0
      for row in sReader:
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
      for row in sReader:
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
  
   #NR 1 / 2
   if searchArray[0] in ["C", "Classroom"]:
      searchArray2 = re.split("\s+", searchArray[1])

      #NR1
      if searchArray2[1] in ["S", "Students"]:
         for row in sReader:
            if row['Classroom'] == searchArray2[0]:
               print row['StLastName'] + " " + row['StFirstName']
  
      #NR2
      elif searchArray2[1] in ["T", "Teachers"]:
         for tRow in tReader:
            if tRow['Classroom'] == searchArray2[0]:
               print tRow['TLastName'] + " " + tRow['TFirstName']

   #NR4
   if searchArray[0] in ["E", "Enrollment"]:
      classes = {}
      for row in sReader:
         if row['Classroom'] in classes:
            classes[row['Classroom']] += 1
         else:
            classes[row['Classroom']] = 1 
      
      for key in sorted(classes.iterkeys()):
         print key + ": " + str(classes[key])

   #NR5
   #Average GPA: <grade number> G[rade]
   #Average GPA: <route number> B[us]
   #Average GPA: <teacher last name> T[eacher]

   if searchArray[0] == "Average GPA":
      searchArray2 = re.split("\s+", searchArray[1])

      totalStudents = 0.0
      totalGPA = 0.0
      average = 0.0

      if searchArray2[1] in ["G", "Grade"]:
         for row in sReader:
            if row['Grade'] == searchArray2[0]:
               totalStudents += 1
               totalGPA += float(row['GPA'])
         if totalStudents != 0:
            average = totalGPA/totalStudents
         print searchArray2[0] + " " + str(average)

      if searchArray2[1] in ["B", "Bus"]:
         for row in sReader:
            if row['Bus'] == searchArray2[0]:
               totalStudents += 1
               totalGPA += float(row['GPA'])
         if totalStudents != 0:
            average = totalGPA/totalStudents
         print searchArray2[0] + " " + str(average)

      if searchArray2[1] in ["T", "Teacher"]:
         for tRow in tReader:
            if tRow['TLastName'] == searchArray2[0]:
               for row in sReader:
                  if row['Classroom'] == tRow['Classroom']:
                     totalStudents += 1
                     totalGPA += float(row['GPA'])

         if totalStudents != 0:
            average = totalGPA/totalStudents
         print searchArray2[0] + " " + str(average)


