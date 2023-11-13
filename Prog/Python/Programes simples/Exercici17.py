n1  = int(input("1r numero: "))
n2  = int(input("2n numero: "))
menor = (n1 > n2) * n2 + (n2 > n1) * n1
major = (n1 >= n2) * n1 + (n2 > n1) * n2
print(f" El major entre {n1} i {n2} és {major}")
print(f" El menor entre {n1} i {n2} és {menor}")