# find the factor pairs of a number

target = int(input("input number to find all its factor pairs: "))

def find_factors(target):
    result = []
    for i in range(1, target + 1):
        if(target % i == 0):
            result.append(i)

    print(result)


find_factors(target)
