frase = input("Frase:")
espais = 0
espaitrobats = False

while espais < len(frase) and not(espaitrobats):
    lletra = frase[espais]
    if lletra == " ":
        espaitrobats = True
    espais = espais + 1

if espaitrobats:
    print("Hi ha el 1r espai a la posició", espais , "de la frase.")
else:
    print("No hi ha espais en la frase.")

    

