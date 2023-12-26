# 1. * Fes un programa que llegeixi una string i ens ens retorni una nova string només amb els dígits de la string original.
#For
original_string = input("Enter a string:")
new_string = ""
digits = "0123456789"
for char in original_string:
    if char in digits:
        new_string += char
print("The new string is:", new_string)
#while


original_string = input("Enter a string:")
new_string = ""
digits = "0123456789"
i = 0
while i < len(original_string):
    if original_string[i] in digits:
        new_string += original_string[i]
    i += 1
print("The new string is:", new_string)