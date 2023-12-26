numbers = ["123", "458", "761", "23", "44"]
even_count = 0
odd_count = 0

for num in numbers:
    digit_sum = sum(int(digit) for digit in num)
    if digit_sum % 2 == 0:
        even_count += 1
        even_sum = '+'.join(num)
        print(f"Parells: {even_sum}={digit_sum}")
    else:
        odd_count += 1
        odd_sum = '+'.join(num)
        print(f"Senars: {odd_sum}={digit_sum}")

print("hi ha", even_count, "que tenen suma parell")
print("hi ha", odd_count, "que tenen suma senar")