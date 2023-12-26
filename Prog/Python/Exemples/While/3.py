# 1. * Fes un programa que vagi llegint paraules i pari quant repetim la mateixa paraula 2 vegades seguides.
'''
last_word = None
while True:
    current_word = input("Paraula:")
    if current_word == last_word:
        break
    last_word = current_word
print("You have entered the same word twice in a row.")

'''
anterior = input("Paraula:")
paraula = input("Paraula:")
while anterior != paraula:
    anterior = paraula
    paraula = input("Paraula: ")

    