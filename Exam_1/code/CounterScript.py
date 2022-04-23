#Kyle Bush
#CSCI 2467 Exam 1 Question 2

import sys

with open(sys.argv[1], 'r') as my_file:
    data = my_file.read()

#read content of file to string
def count(data):
    #get number of occurrences of the substring in the string
    movq = data.count("movq")
    movl = data.count("movl")
    movslq = data.count("movslq")
    addq = data.count("addq")
    addl = data.count("addl")
    jmp = data.count("jmp")
    popq = data.count("popq")
    jge = data.count("jge")
    imulq = data.count("imulq")
    cmpl = data.count ("cmpl")

    #printing each count
    print('movq :', movq)
    print('movl :', movl)
    print('movslq :', movslq)
    print('addq :', addq)
    print('addl :', addl)
    print('jmp :', jmp)
    print('popq :', popq)
    print('jge :', jge)
    print ('imulq :', imulq)
    print ('cmpl :', cmpl)


#counting the passed in data
count(data)
