


# https://www.hackerrank.com/challenges/30-data-types/problem?h_r=next-challenge&h_v=zen*

i = 4
d = 4.0
s = 'HackerRank '
# Declare second integer, double, and String variables.
# Read and save an integer, double, and String to your variables.
input_int = int(input())
input_double = float(input())
input_string = input()

# Print the sum of both integer variables on a new line.
print(i+input_int)
# Print the sum of the double variables on a new line.
print(d+input_double)

# Concatenate and print the String variables on a new line
# The 's' variable above should be printed first.
print(s+input_string)

#https://www.hackerrank.com/challenges/30-operators/problem?h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen

#!/bin/python3

import math
import os
import random
import re
import sys

# Complete the solve function below.
def solve(meal_cost, tip_percent, tax_percent):
    total_cost = (meal_cost * tip_percent*1.0/100) + (meal_cost * (1+tax_percent*1.0/100)) 
    print(round(total_cost))



if __name__ == '__main__':
    meal_cost = float(input())

    tip_percent = int(input())

    tax_percent = int(input())

    solve(meal_cost, tip_percent, tax_percent)


#https://www.hackerrank.com/challenges/30-conditional-statements/problem?h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen

#!/bin/python3

import math
import os
import random
import re
import sys

if __name__ == '__main__':
    N = int(input())
    if ((N%2 == 1) or (N>=6 and N<=20)): 
        print("Weird")
    elif ((N>=2 and N<=5) or (N>20)): 
        print("Not Weird")
    else: 
        print("Not Weird")


# https://www.hackerrank.com/challenges/30-class-vs-instance/problem?h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen

class Person:
    def __init__(self,initialAge):
        # Add some more code to run some checks on initialAge
        self.age=0;
        if initialAge>=0:
            self.age = initialAge
        else: 
            print("Age is not valid, setting age to 0.")
            self.age = 0
    def amIOld(self):
        # Do some computations in here and print out the correct statement to the console
        if self.age<13: 
            print("You are young.")
        elif self.age<18: 
            print("You are a teenager.")
        else: 
            print("You are old.")
    def yearPasses(self):
        # Increment the age of the person in here
        self.age=self.age+1

t = int(input())
for i in range(0, t):
    age = int(input())         
    p = Person(age)  
    p.amIOld()
    for j in range(0, 3):
        p.yearPasses()       
    p.amIOld()
    print("")
	

# https://www.hackerrank.com/challenges/30-loops/problem?h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen
int i=1;
while i <10 
print(n)
