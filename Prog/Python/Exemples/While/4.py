import random
random.seed() # inicialitzem el generador de nombres aleatoris
secret = random.randint(1, 10)

guess = int(input("Adivina el nombre (entre 1 i 10): "))
while guess != secret:
    guess = int(input("Adivina el nombre (entre 1 i 10): "))

print("Has encertat!")


