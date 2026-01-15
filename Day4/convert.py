import re
file1 = open("C:/Users/rohit/OneDrive/Desktop/Projects/jane_street/Day4/input.txt", 'r')
line=file1.readlines()
file1.close()

arr=[]
for j in range(0,len(line)):
    if(j==len(line)-1):
        i=line[j]
    else:
        i=line[j][:-1]
    arr2=[]
    for k in range(0,len(i)):
        if i[k]=='@':
            arr2.append(1)
        else:
            arr2.append(0)
    arr.append(arr2)

s=""
for i in range(0,len(arr)):
    for j in range(0,len(arr[i])):
        s=s+"ram["+str(i)+"]["+str(j)+"]="+str(arr[i][j])+";"
    s=s+"\n"
s=s+"\n\n"

file2=open("C:/Users/rohit/OneDrive/Desktop/Projects/jane_street/Day4/ram_output.txt", 'w')
file2.write(s)
file2.close()