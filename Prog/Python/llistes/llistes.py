'''
l = [1,2,3]
# Add to list "4"
l = l + 4

# add list concat list
[4,5,6] + [7,8,9]

# variable.pop(posicio) -> elimina i retorna l'element de la posicio
#l.pop(0) --> Retorna i elimina per posició
#l.pop() --> Retorna i elimina l'últim element
l = ["a","b","c","d","e","f"]
#l.remove("f") --> Elimina per valor
#l.remove(l[0]) --> Elimina per posició
#l.extend(["g","h","i"]) # --> Afegeix una llista a una altra
#l.reverse() # --> Inverteix la llista
#l.sort() # --> Ordena la llista
#l.sort(reverse=True) # --> Ordena la llista en ordre invers
#l.index("a") # --> Retorna la posició de l'element
#l.count("a") # --> Retorna el número de vegades que apareix l'element
#l.clear() # --> Esborra tots els elements de la llista
#l.copy() # --> Copia la llista
#l.partition("a") # --> Retorna una tupla amb la llista separada per l'element
#l.insert(0,"z") # --> Insereix un element en una posició
#l.insert(len(l),"z") # --> Insereix un element al final de la llista
'''
# Path: llistes/llistes.py

# Demanar dades fins que sigui buida, i les afegirá a una llista
fi = False
llista = list()
while not fi:
    noms = input("Introdueix una dada: ")
    if noms == "":
        fi = True
    else:
        llista.append(noms)
print(llista)

# Consumir llista en forma de cua
print("\nCua")
for nom in llista:
    print(nom)
# Consumir llista en forma de pila
print("\nPila")
for nom in reversed(llista):
    print(nom)


print("\nConsumir llista en forma de cua:FIFO")
while noms:
    nom = llista.pop(0)
    print(nom)

'''
llista = list
noms = input("Introdueix una dada: ")
while noms != "":
    llista.append(noms)
    noms = input("Introdueix una dada: ")

'''