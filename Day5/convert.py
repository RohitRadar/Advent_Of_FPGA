import re
file1 = open("C:/Users/rohit/OneDrive/Desktop/Projects/jane_street/Day5/ram_input.txt", 'r')
line1=file1.readlines()
file1.close()

file2 = open("C:/Users/rohit/OneDrive/Desktop/Projects/jane_street/Day5/input.txt", 'r')
line2=file2.readlines()
file2.close()

arr=[]
for i in range(len(line1)):
    if(i==len(line1)-1):
        a=line1[i].split('-')
    else:
        a=line1[i][:-1].split('-')
    arr.append(int(a[0]))
    arr.append(int(a[1]))    

# s=""
# for i in range(0,len(arr)):
#     s=s+"ram["+str(i)+"]=64'd"+str(arr[i])+";"
#     if(i%30==0 and i!=0):
#         s=s+"\n"
# s=s+"\n\n\n\n\n"

# for i in range(0,len(line2)):
#     if(i==len(line2)-1):
#         a=line2[i]
#     else:
#         a=line2[i][:-1]
#     s=s+"ip=64'd"+str(a)+";#10;"
#     if(i%100==0 and i!=0):
#         s=s+"\n"
# s=s+"\n"
# file2=open("C:/Users/rohit/OneDrive/Desktop/Projects/jane_street/Day5/ram_output.txt", 'w')
# file2.write(s)
# file2.close()

done=1
while(done):
    done=0
    for i in range(0,len(arr)-2,2):
        if(arr[i]>arr[i+2]):
            done=1
            arr[i],arr[i+2]=arr[i+2],arr[i]
            arr[i+1],arr[i+3]=arr[i+3],arr[i+1]
        if arr[i]==arr[i+2] and arr[i+3]>arr[i+1]:
            done=1
            arr[i+1],arr[i+3]=arr[i+3],arr[i+1]

i=0
j=0
while i<len(arr)-2:
    if arr[j]!=arr[i+2]:
        if arr[i+2]>arr[j+1]:
            j=j+2
        else:
            if arr[j+1]<arr[i+3]:
                arr[j+1]=arr[i+3]   
    i=i+2
# for k in range(0,len(arr)-1,2):
#     s=str(arr[k])+"-"+str(arr[k+1])
#     print(s)


ans=0
max=arr[0]
for i in range(0,len(arr)):
    if i%2==0 and arr[i]>=max:
        max=arr[i]
    else:
        if arr[i]>=max:
            print(i,max,ans)
            ans=ans+arr[i]-max+1
            max=arr[i]+1
#print(ans)