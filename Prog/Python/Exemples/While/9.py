import random
random.seed() # inicialitzem el generador de nombres aleatoris
#For
'''
count = 0
rand = random.randint(1, 100)
print("Random:", rand)

for i in range(1, rand + 1):
    print(i)
'''
#While

rand = random.randint(1, 100)
print("Random:", rand)
i = 1
while i <= rand:
    print(i)
    i += 1


