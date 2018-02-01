import sys

file1 = open(sys.argv[1], 'r')
file2 = open(sys.argv[2], 'r')

for row in  file1:
   print row
f.close()