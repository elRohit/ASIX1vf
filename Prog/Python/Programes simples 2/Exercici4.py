preu = int(input("Preu: "))
pagat = int(input("Em dones: "))
canvi = pagat - preu
canv_real = preu %5
canviRealcalc = canvi + canv_real
print(f"Canvi Original: {canvi}")
print(f"Canvi Real: {canviRealcalc}")