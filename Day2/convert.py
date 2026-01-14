import re
file1 = open("C:/Users/rohit/OneDrive/Desktop/Projects/jane_street/Day2/input.txt", 'r')
line=file1.readline()
file1.close()

list=re.split(',|-',line)
s=""
for i in range(0,len(list)-1,2):
    s=s+"new_ip=1;\nip1={"
    for l in range(0,11-len(list[i])):
        s=s+"4'd0,"
    for j in list[i]:
        s=s+"4'd"+j+","
    s=s[:-1]+"};\nip2={"
    for l in range(0,11-len(list[i+1])):
        s=s+"4'd0,"
    for j in list[i+1]:
        s=s+"4'd"+j+","
    s=s[:-1]+"};\n#20;new_ip=0;\nwhile(new==0)#10;\n\n"

file2=open("C:/Users/rohit/OneDrive/Desktop/Projects/jane_street/Day2/p2_output.txt", 'w')
file2.write(s)
file2.close()