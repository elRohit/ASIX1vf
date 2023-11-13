# Task: User Inputs
n1 = float(input("Primer número: "))
n2 = float(input("Segon número: "))

# Task: output amb dec i /o agrupant milers
print(f"Format amb 2 decimals: {n1:.2f} i {n2:.2f}")
print(f"Format amb 0 decimals i agrupant milers: {n1:,.0f} i {n2:,.0f}")

# Task: Números ordenats
print("Números ordenats:")
print("----------------------------------")
if n1 < n2:
    print(f"Més petit: {n1:.3f}")
    print(f"Més gran: {n2:.3f}")
else:
    print(f"Més petit: {n2:.3f}")
    print(f"Més gran: {n1:.3f}")
