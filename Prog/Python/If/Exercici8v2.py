paraula = input("Ingresa una palabra: ")
vocals = "aeiou"
if paraula[0].upper() in  "AEIOU":
    print(f"La palabra empieza por VOCALES")
else:
    print(f"La palabra no empieza por VOCALES")