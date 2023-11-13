paraula = input("Ingresa una palabra: ")
vocals = "aeiou"
if paraula[0] == "a" or paraula[0] == "e" or paraula[0] == "i" or paraula[0] == "o" or paraula[0] == "u":
    print(f"La palabra empieza por VOCALES")
else:
    print(f"La palabra no empieza por VOCALES")