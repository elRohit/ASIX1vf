numbers = ["123", "458", "761", "23", "44"]

parells = 0
senars = 0

for num in numbers:
    num = int(num)
    if num % 2 == 0:
        parells += 1
    else:
        senars += 1

print("Total even numbers:", parells)
print("Total odd numbers:", senars)