# Read a sentence
sentence = input("Enter a sentence:")

# Split the sentence into words
words = sentence.split()

# Initialize index
i = 0

# Print each word on a different line
while i < len(words):
    print(words[i])
    i += 1