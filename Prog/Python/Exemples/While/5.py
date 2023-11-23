import random
random.seed() # inicialitzem el generador de nombres aleatoris
secret = random.randint(1, 10)
count = 0
guess = int(input("Adivina el nombre (entre 1 i 10): "))
while guess != secret:
    count = count + 1
    guess = int(input("Adivina el nombre (entre 1 i 10): "))

print(f"Has encertat als {count +1} intent/s!")


