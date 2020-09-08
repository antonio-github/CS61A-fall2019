
# Q1.1

def multiply(m, n):
    """
    >>> multiply(5, 3)
    15
    >>> multiply(10, 4)
    40
    """
    if n == 1:
        return m
    else:
        return m + multiply(m, n-1)


# Q1.3

def hailstone(n):
    """
    Print out the hailstone sequence starting at n, and return thenumber of elements in the sequence.
    >>> a = hailstone(10)
    10
    5
    16
    8
    4
    2
    1
    >>> a
    7
    """
    print(n)
    if n == 1:
        return 1
    else:
        if n%2 == 0:
            return 1 + hailstone(n//2)
        else:
            return 1 + hailstone(3*n+1)


# Q1.4

def is_prime(n):
    """
    >>> is_prime(7)
    True
    >>> is_prime(10)
    False
    >>> is_prime(1)
    False
    """
    def prime_helper(n, k):
        if k == n:
            return not k==1
        elif n%k == 0 and k>1:
            return False
        else:
            return prime_helper(n, k+1)
    return prime_helper(n, 1)


# Q1.5

def merge(n1, n2):
    """
    Merges two numbers
    >>> merge(31, 42)
    4321
    >>> merge(21, 0)
    21
    >>> merge (21, 31)
    3211
    >>> merge(6543, 21)
    654321
    """
    if n1 == 0 or n2 == 0:
        return max(n1, n2)
    else:
        min_digit_n1, min_digit_n2 = n1%10, n2%10
        if min_digit_n1 > min_digit_n2:
            return min_digit_n2 + 10*merge(n1, n2//10)
        else:
            return min_digit_n1 + 10*merge(n1//10, n2)

# Q1.6

def make_func_repeater(f, x):
    """
    >>> incr_1 = make_func_repeater(lambda x: x + 1, 1)
    >>> incr_1(2) #same as f(f(x))
    3
    >>> incr_1(5)
    6
    """
    def repeat(n):
        if n == 0:
            return x
        else:
            return f(repeat(n-1))
    return repeat
