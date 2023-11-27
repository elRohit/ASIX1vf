#Fes un programa que s'inventi un número entre el 1 i el 100. Haurem d'endevinar el número en un màxim de 5 intents(vides). El programa ens dirà cada vegada si el número inventat és superior o inferior al número introduït.

import random

numero = random.randint(1, 100)
intents = 5

while intents > 0:
    num = int(input("Introdueix un número: "))
    if num == numero:
        print("Has encertat!")
        break
    elif num < numero:
        print("El número és més gran.")
    else:
        print("El número és més petit.")
    intents -= 1
    print("Et queden " + str(intents) + " intents.")

    