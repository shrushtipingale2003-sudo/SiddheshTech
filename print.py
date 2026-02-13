n = 5

for i in range(n, 0, -1):
    # Left side numbers
    for j in range(1, i + 1):
        print(j, end="")

    # Spaces
    spaces = 2 * (n - i)
    print(" " * spaces, end="")

    # Right side numbers
    for j in range(i, 0, -1):
        print(j, end="")

    print()
