import re
file1 = open("C:/Users/rohit/OneDrive/Desktop/Projects/jane_street/Day4/input.txt", 'r')
line=file1.readlines()
file1.close()

arr=[]
for i in line:
    i=i[:-1]
    arr2=[]
    for j in range(0,len(i)):
        if i[j]=='@':
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

for i in range(0,len(arr)):
    s=s+"assign sumcache["+str(i)+"]="
    for j in range(0,len(arr[i])):
        s=s+"sumram["+str(i)+"]["+str(j)+"]+"
    s=s[:-1]+";\n"
s=s+"\n\nassign sum="
for i in range(0,len(arr)):
    s=s+"sumcache["+str(i)+"]+"
s=s[:-1]+";\n"


file2=open("C:/Users/rohit/OneDrive/Desktop/Projects/jane_street/Day4/ram_output.txt", 'w')
file2.write(s)
file2.close()

# ans=0
# sum=1
# while sum!=0:
#     sum=0
#     mem=[]
#     for i in range(0,len(arr)):
#         for j in range(0,len(arr2)):
#             if arr[i][j]==1:
#                 if i==0 and (j==0 or j==len(arr2)-1):
#                     #print(i,j)
#                     mem.append([i,j])
#                     sum=sum+1
#                 elif i==len(arr)-1 and (j==0 or j==len(arr2)-1):
#                     #print(i,j)
#                     mem.append([i,j])
#                     sum=sum+1
#                 elif i==0:
#                     if arr[i][j-1]+arr[i][j+1]+arr[i+1][j-1]+arr[i+1][j]+arr[i+1][j+1]<4:
#                         #print(i,j)
#                         mem.append([i,j])
#                         sum=sum+1
#                 elif i==len(arr)-1:        
#                     if arr[i][j-1]+arr[i][j+1]+arr[i-1][j-1]+arr[i-1][j]+arr[i-1][j+1]<4:
#                         print(i,j)
#                         mem.append([i,j])
#                         sum=sum+1
#                 elif j==0:
#                     if arr[i-1][j]+arr[i-1][j+1]+arr[i][j+1]+arr[i+1][j]+arr[i+1][j+1]<4:
#                         #print(i,j)
#                         mem.append([i,j])
#                         sum=sum+1
#                 elif j==len(arr2)-1:
#                     if arr[i-1][j-1]+arr[i-1][j]+arr[i][j-1]+arr[i+1][j-1]+arr[i+1][j]<4:
#                         #print(i,j)
#                         mem.append([i,j])
#                         sum=sum+1
#                 else:
#                     if arr[i-1][j-1]+arr[i-1][j]+arr[i-1][j+1]+arr[i][j-1]+arr[i][j+1]+arr[i+1][j-1]+arr[i+1][j]+arr[i+1][j+1]<4:
#                         #print(i,j)
#                         mem.append([i,j])
#                         sum=sum+1
#     for i in mem:
#         arr[i[0]][i[1]]=0
#     print(sum)
#     ans=ans+sum
# print("Final Answer:",ans)