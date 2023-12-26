import random
random.seed()
Palos = ["Picas", "Corazones", "Diamantes", "Treboles"]
Numeros = [ "2", "3", "4", "5", "6", "7", "8", "9", "Jota", "Reina", "Rey", "As"]
baraja = []
for palo in Palos:
    for numero in Numeros:
        carta = f"{numero} : {palo}"
        baraja.append(carta)

random.shuffle(baraja)
print(baraja)
