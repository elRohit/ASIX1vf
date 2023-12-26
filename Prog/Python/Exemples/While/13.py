#Arbolito de navidad
import random
random.seed() # inicialitzem el generador de nombres aleatoris
'''
nivell = random.randint(1, 10)
print("Nivell:", nivell)
for i in range(1,nivell +1):
    if i % 2 == 0:
        print("*" * i)
    else:
        print("+" * i)
'''
#While

# Arbolito de navidad
import random
random.seed() # inicialitzem el generador de nombres aleatoris

nivell = random.randint(1, 10)
print("Nivell:", nivell)
i = 1
while i <= nivell:
    if i % 2 == 0:
        print("*" * i)
    else:
        print("+" * i)
    i += 1


