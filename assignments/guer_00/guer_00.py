

################
#     Q1.1     #
################

def q_1_1():
    """
    >>> from operator import add, mul
    >>> mul(add(5, 6), 8)
    88
    >>> print('x')
    x
    >>> y = print('x')
    x
    >>> print(y)
    None
    >>> print(add(4, 2),print('a'))
    a
    6 None
    """
    return None


################
#     Q1.2     #
################

def q_1_2():
    """
    >>> def foo(x):
    ...     print(x)
    ...     return x + 1
    >>> def bar(y, x):
    ...     print(x - y)
    >>> foo(3)
    3
    4
    >>> bar(6, 1)
    -5
    >>> bar(foo(10), 11)
    10
    0
    """


################
#     Q2.1     #
################

n = 0
if n:
    print(1)
elif n < 2:
    print(2)
else:
    print(3)
print(4)


################
#     Q2.3     #
################

def count_digits(n):
    '''
    >>> count_digits(4)
    1
    >>> count_digits(12345678)
    8
    >>> count_digits(0)
    0
    '''
    n_digits = 0
    while n >= 1:
        n_digits += 1
        n /= 10
    return n_digits


################
#     Q2.4     #
################

def count_matches(n, m):
    '''
    >>> count_matches(10, 30)
    1
    >>> count_matches(12345, 23456)
    0
    >>> count_matches(121212, 123123)
    2
    >>> count_matches(123, 23)
    2
    >>> count_matches(111, 11) # only one's place matches
    2
    >>> count_matches(101, 10) # no place matches
    0
    '''
    # # Uglier code:
    # matches = 0
    # def get_digit(n):
    #     n /= 10
    #     floor_n = int(n)
    #     digit = 10*(n - floor_n)
    #     return floor_n, digit
    # while n>=1 and m>=1:
    #     n, digit_n = get_digit(n)
    #     m, digit_m = get_digit(m)
    #     dif = round(digit_n) - round(digit_m)
    #     if not dif:
    #         matches += 1
    # return matches
    # # More elegant solution:
    mathches = 0
    while n>0 and m>0:
        if n%10 == m%10:
            mathches += 1
        n, m = n//10, m//10
    return matches


################
#     Q4.5     #
################

def make_skipper(n):
    """
    >>> a = make_skipper(2)
    >>> a(5)
    1
    3
    5
    """
    def n_th_checker(x):
        i = 1
        while i <= x:
            if i%n != 0:
                print(i)
            i += 1
    return n_th_checker
