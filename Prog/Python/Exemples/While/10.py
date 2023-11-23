import random
random.seed()

'''
# Generate two random numbers between 1 and 100
num1 = random.randint(1, 100)
num2 = random.randint(1, 100)

print("Numeros generats:", num1, num2)

# Print all numbers between num1 and num2, if num2 is greater than num1
if num2 > num1:
    for i in range(num1, num2 + 1):
        print(i)
'''

# Generate two random numbers between 1 and 100
import random

n1 = random.randint(1, 100)
n2 = random.randint(1, 100)

print("Numeros generats:", n1, n2)

# Print all numbers between random_uno and random_dos, if random_dos is greater than random_uno
if n2 > n1:
    i = n1
    while i <= n2:
        print(i, end=" ")
        i += 1

        

