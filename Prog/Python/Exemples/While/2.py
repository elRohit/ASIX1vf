# 2.  Ídem anterior, però que ens digui quantes paraules hem introduït sense comptar la paraula «fi»

paraula = input("Paraula:")
count = 0
while not(paraula == "fi"):
    count += 1
    paraula = input("Paraula:")
print("You have entered", count, "words.")