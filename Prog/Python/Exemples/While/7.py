# Contar espais en una frase amb for
'''
frase = input("Frase:")
espais = 0
for i in frase:
    if i == " ":
        espais = espais + 1

print("Hi ha", espais, "espais en la frase.")
'''
# Contar espais en una frase amb while

frase = input("Frase:")
espais = 0
i = 0
while i < len(frase):
    if frase[i] == " ":
        espais = espais + 1
    i = i + 1

print("Hi ha", espais, "espais en la frase.")

