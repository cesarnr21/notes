"""
This program is a converter between Roman Numerals and Integers.
It can convert either way and 
"""

"""
Improvements that can be made.
Exception handling in case the user enters the wrong input
Ask the user if they want to 
"""

def convert_rom():
    roman_val = {'I':1, 'V':5, 'X':10, 'L':50, 'C':100, 'D':500, 'M':1000}
    num = input("Enter a Roman Numberal to convert to an Integer: ")
    num = num.upper()
    result = 0
    char = 0
    for char in range(len(num)):
        if char > 0 and roman_val[num[char]] > roman_val[num[char - 1]]:
            result = result + (roman_val[num[char]] - 2 * roman_val[num[char - 1]])
        else:
            result = result + roman_val[num[char]]
    print("The Roman Numeral " + num + " in Integer from is: " + result + "\n")

def convert_int():
    int_values = {1:'i', 5:'v', 10:'x', 50:'l', 100:'c', 500:'d', 1000:'m'}
    num = int(input("Enter an Interger to Convert to a Roman Numberal: "))
    result = 0

    if num > 0:
        here = num % 10
    print("The Roman Numeral for " + num + " is: " + result)
    pass

def main():
    print("Please Select one of the modes below")
    print("1. Roman to Integer Conversion")
    print("2. Integer to Roman Conversion")
    mode = input("Enter either 1 or 2: ")
    print("\nYou have selected mode", mode)

    if mode == '1':
        convert_rom()
    elif mode == '2':
        convert_int()
    else:
        print("\nThat is not a viable input. Please try again.")

if __name__ == '__main__':
    main()

