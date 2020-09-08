
# Q1.1

def count_stair_ways(n):
    """
    Count the ways of go up a flight of steps with 1 or 2 steps each time.

    >>> count_stair_ways(1)
    1
    >>> count_stair_ways(2)
    2
    >>> count_stair_ways(3)
    3
    >>> count_stair_ways(10)
    89
    """
    if n == 0:
        return 1
    elif n > 0:
        return count_stair_ways(n-1) + count_stair_ways(n-2)
    else:
        return 0


# Q1.2

def count_k(n, k):
    """
    >>> count_k(3, 3) # 3, 2 + 1, 1 + 2, 1 + 1 + 1
    4
    >>> count_k(4, 4)
    8
    >>> count_k(10, 3)
    274
    >>> count_k(300, 1) # Only one step at a time
    1
    """
    if n == 0:
        return 1
    elif n < 0:
        return 0
    else:
        total, i = 0, 1
        while i<=k:
            total += count_k(n-i, k)
            i += 1
        return total


# Q2.1

def Q21():
    """
    >>> a = [1, 5, 4, [2, 3], 3]

    >>> print(a[0], a[-1])
    1 3
    >>> len(a)
    5
    >>> 2 in a
    False
    >>> 4 in a
    True
    >>> a[3][0]
    2
    """


# Q2.2

def even_weighted(lst):
    """
    >>> x = [1, 2, 3, 4, 5, 6]
    >>> even_weighted(x)
    [0, 6, 20]
    """
    return [ i*lst[i] for i in range(len(lst)) if i%2 == 0 ]


# Q2.3

def max_product(lst):
    """
    Return the maximum product that can be formed using lst
    without using any consecutive numbers
    >>> max_product([10,3,1,9,2]) # 10 * 9
    90
    >>> max_product([5,10,5,10,5]) # 5 * 5 * 5
    125
    >>> max_product([])
    1
    >>> max_product([0,50,1,2,8])
    400
    """
    max_value = []
    def helper_product(reduced_lst, prod_value=1):
        nonlocal max_value
        if reduced_lst == []:
            max_value = max_value + [prod_value]
        elif len(reduced_lst) == 1:
            max_value = max_value + [reduced_lst[0]*prod_value]
        else:
            for i in range(len(reduced_lst)):
                current_elem = reduced_lst[i]
                helper_product(reduced_lst[2+i:], current_elem*prod_value)
    helper_product(lst, 1)
    return max(max_value)
    # # Solution from solutions file:
    # if len(lst) == 0:
    #     return 1
    # elif len(lst) == 1:
    #     return lst[0]
    # else:
    #     return max(max_product(lst[1:]), lst[0]*max_product(lst[2:]))
