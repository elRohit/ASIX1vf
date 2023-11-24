import re

def comprova_nota():
    nota = input("Introdueix una nota numèrica: ")
    
    # Comprova si la nota és un número entre 0 i 10
    if re.match(r'^[0-9]$', nota) or re.match(r'^10$', nota):
        nota = int(nota)
        
        if nota >= 0 and nota <= 4:
            print("Insuficient")
        elif nota == 5:
            print("Suficient")
        elif nota == 6:
            print("Bé")
        elif nota >= 7 and nota <= 8:
            print("Notable")
        elif nota >= 9 and nota <= 10:
            print("Excel·lent")
    else:
        print("La nota introduïda no és vàlida")

comprova_nota()