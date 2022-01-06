'''Calculator that adds and substract numbers'''

from sys import argv


def add(n_1: int, n_2: int) -> int:
    '''Return the sum of two numbers'''
    return n_1 + n_2


def subtract(n_1: int, n_2: int) -> int:
    '''Return the substract of two numbers'''
    return n_1 - n_2


if __name__ == '__main__':
    if len(argv) != 4:
        print('Usage: number1 +/- number2')
    else:
        num_1 = int(argv[1])
        num_2 = int(argv[3])
        operator = argv[2]

        if operator == '+':
            print(add(num_1, num_2))
        elif operator == '-':
            print(subtract(num_1, num_2))
        else:
            print(f"Operator {operator} is not supported, use + or -.")
