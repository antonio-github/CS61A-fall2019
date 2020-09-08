"""Lab 1: Expressions and Control Structures"""

def both_positive(x, y):
    """Returns True if both x and y are positive.

    >>> both_positive(-1, 1)
    False
    >>> both_positive(1, 1)
    True
    """
    return x > 0 and y > 0 # You can replace this line!

def sum_digits(n):
    """Sum all the digits of n.

    >>> sum_digits(10) # 1 + 0 = 1
    1
    >>> sum_digits(4224) # 4 + 2 + 2 + 4 = 12
    12
    >>> sum_digits(1234567890)
    45
    >>> x = sum_digits(123) # make sure that you are using return rather than print
    >>> x
    6
    """
    # # Complex solution:
    # sum = 0
    # decimal_place = 1
    # while n > 0:
    #     digit = (n%pow(10,decimal_place))//pow(10,(decimal_place-1))
    #     sum += digit
    #     n -= digit*pow(10,(decimal_place-1))
    #     decimal_place += 1
    # return sum
    # # Shortest solution:
    # return sum( [int(i) for i in str(n)] )
    # # A simple solution:
    total = 0
    while n > 0:
        total += n%10
        n = n//10
    return total
