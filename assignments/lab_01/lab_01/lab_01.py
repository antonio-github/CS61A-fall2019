
# Q1

def xk(c, d):
    if c == 4:
        return 6
    elif d >= 4:
        return 6 + 7 + c
    else:
        return 25

r1 = xk(10, 10)
r2 = xk(10,6)
r3 = xk(4, 6)
r4 = xk(0, 0)
print(r1, r2, r3, r4)

# def both_positive(x, y):
#     """Returns True if both x and y are positive.
#
#     >>> both_positive(-1, 1)
#     False
#     >>> both_positive(1, 1)
#     True
#     """
#     return x and y > 0 # You can replace this line!

def both_positive_fixed(x, y):
    """Returns True if both x and y are positive.

    >>> both_positive_fixed(-1, 1)
    False
    >>> both_positive_fixed(1, 1)
    True
    """
    return (x > 0) and (y > 0)

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
    sum_n = 0
    decimal_place = 1
    while n > 0:
        digit = (n%pow(10,decimal_place)) // pow(10,(decimal_place-1))
        sum_n += digit
        n -= digit*pow(10,(decimal_place-1))
        decimal_place += 1
    return sum_n

def sum_digits_2(n):
    """Sum all the digits of n.

    >>> sum_digits_2(10) # 1 + 0 = 1
    1
    >>> sum_digits_2(4224) # 4 + 2 + 2 + 4 = 12
    12
    >>> sum_digits_2(1234567890)
    45
    >>> x = sum_digits_2(123) # make sure that you are using return rather than print
    >>> x
    6
    """
    return sum( [int(i) for i in str(n)] )

def falling(n, k):
    """Compute the falling factorial of n to depth k.

    >>> falling(6, 3)  # 6 * 5 * 4
    120
    >>> falling(4, 3)  # 4 * 3 * 2
    24
    >>> falling(4, 1)  # 4
    4
    >>> falling(4, 0)
    1
    """
    prod = n
    iter = 1
    if k == 0:
        return 1
    else:
        while iter < k:
            n -= 1
            prod *= n
            iter += 1
        return prod

def double_eights(n):
    """Return true if n has two eights in a row.
    >>> double_eights(8)
    False
    >>> double_eights(88)
    True
    >>> double_eights(2882)
    True
    >>> double_eights(880088)
    True
    >>> double_eights(12345)
    False
    >>> double_eights(80808080)
    False
    """
    previous_digit, current_digit = 0, 0
    decimal_place = 1
    while n > 0:
        digit = (n%pow(10,decimal_place)) // pow(10,(decimal_place-1))
        previous_digit, current_digit = current_digit, digit
        if (previous_digit-8 == 0) and (current_digit-8 == 0):
            return True
        n -= digit*pow(10,(decimal_place-1))
        decimal_place += 1
    return False


def double_eights_2(n):
    """Return true if n has two eights in a row.
    >>> double_eights_2(8)
    False
    >>> double_eights_2(88)
    True
    >>> double_eights_2(2882)
    True
    >>> double_eights_2(880088)
    True
    >>> double_eights_2(12345)
    False
    >>> double_eights_2(80808080)
    False
    """
    list_digits = [int(i) for i in str(n)]
    for i in range(len(list_digits)-1):
        if ( list_digits[i]-8 == 0) and (list_digits[i+1]-8 == 0):
            return True
    return False
