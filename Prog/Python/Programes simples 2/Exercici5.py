#preu = int(input(" Preu: "))
#donat = int(input("Em dones: "))
#canvi = donat - preu

#canv_100 = (canvi) // 100
#sobra_100 = canvi % 100  
#canv_50 = (donat - preu)  // 50 
#sobra_50 = canvi % 50
#canv_20 = (donat - preu) // 20 
#canv_10 = (donat - preu) // 10 
#canv_5 = (donat - preu) // 5 

#print(f"Preu: {preu}")
#print(f"Em dones: {donat}")
#print(f"Canvi de 100: {canv_100}")
#print(f"Canvi de 50: {canv_50}")
#print(f"Canvi de 20: {canv_20}")
#print(f"Canvi de 10: {canv_10}")
#print(f"Canvi de 5: {canv_5}")



#JM

preu = int(input(" Preu: "))
pagat = int(input("Em dones: "))
canvi = pagat - preu
print(f"Canvi: {canvi}")
m100 = canvi // 100
canvi = canvi%100
m50 = canvi//50
canvi = canvi%50
m20 = canvi //20
canvi = canvi%20
m10 = canvi//10
canvi = canvi%10
m5 = canvi//5

print(f"Monedes de 100 {m100}")
print(f"Monedes de 50 {m50}")
print(f"Monedes de 20 {m20}")
print(f"Monedes de 10 {m10}")
print(f"Monedes de 5 {m5}")

