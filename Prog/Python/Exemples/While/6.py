# Recerca binària(dicotòmica)
import random
random.seed() # inicialitzem el generador de nombres aleatoris
secret = random.randint(1, 10)

guess = int(input("Adivina el nombre (entre 1 i 10): "))
count =1
while guess != secret:
    if guess > secret:
        print("El nombre secret és menor.")
    else:
        print("El nombre secret és major.")
    guess = int(input("Adivina el nombre (entre 1 i 10): "))
    count = count + 1

print(f"Has encertat als {count} intent/s!")

    