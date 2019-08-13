f = open("data.txt","r") #opens file with name of "test.txt"
cat=0
dog=0
file = open('myfile.txt','r+')

for line in f:
    if line[0].isupper():
        cat+=1
        if cat <= 2000:
            file.write(line)
    else:
        dog+=1
        if dog <= 2000:
            file.write(line)
f.close()
file.close()