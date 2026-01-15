file = open("C:/Users/rohit/OneDrive/Desktop/Projects/jane_street/Day7/input.txt", 'r')
line=file.readlines()
file.close()

arr=[]
for j in range(2,len(line)-1,2):
    if(j==len(line)-1):
        i=line[j]
    else:
        i=line[j][:-1]
    arr2=[]
    for k in range(0,len(i)):
        if i[k]=='^':
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

for i in range(0,141):
    if i==70:
        s=s+"\nans2_ram["+str(i)+"]<=1;\n"
    else:
        s=s+"ans2_ram["+str(i)+"]<=0;"
s=s+"\n\n"

file2=open("C:/Users/rohit/OneDrive/Desktop/Projects/jane_street/Day7/ram_output.txt", 'w')
file2.write(s)
file2.close()