## Tree Methods ##

def tree(label, branches=[]):
    """Construct a tree with the given label value and a list of branches."""
    for branch in branches:
        assert is_tree(branch), 'branches must be trees'
    return [label] + list(branches)

def label(tree):
    """Return the label value of a tree."""
    return tree[0]

def branches(tree):
    """Return the list of branches of the given tree."""
    return tree[1:]

def is_tree(tree):
    """Returns True if the given tree is a tree, and False otherwise."""
    if type(tree) != list or len(tree) < 1:
        return False
    for branch in branches(tree):
        if not is_tree(branch):
            return False
    return True

def is_leaf(tree):
    """Returns True if the given tree's list of branches is empty, and False
    otherwise.
    """
    return not branches(tree)

def print_tree(t, indent=0):
    """Print a representation of this tree in which each node is
    indented by two spaces times its depth from the root.

    >>> print_tree(tree(1))
    1
    >>> print_tree(tree(1, [tree(2)]))
    1
      2
    >>> numbers = tree(1, [tree(2), tree(3, [tree(4), tree(5)]), tree(6, [tree(7)])])
    >>> print_tree(numbers)
    1
      2
      3
        4
        5
      6
        7
    """
    print('  ' * indent + str(label(t)))
    for b in branches(t):
        print_tree(b, indent + 1)

def copy_tree(t):
    """Returns a copy of t. Only for testing purposes.

    >>> t = tree(5)
    >>> copy = copy_tree(t)
    >>> t = tree(6)
    >>> print_tree(copy)
    5
    """
    return tree(label(t), [copy_tree(b) for b in branches(t)])


# =====
# Trees
# ====

 # Q1.1

def height(t):
    """Return the height of a tree.
    >>> t = tree(3, [tree(5, [tree(1)]), tree(2)])
    >>> height(t)
    2
    """
    # # Using a helper function:
    # max_depth = 0
    # def helper(t, depth):
    #     nonlocal max_depth
    #     if is_leaf(t) and depth > max_depth:
    #         max_depth = depth
    #     else:
    #         for branch in branches(t):
    #             helper(branch, depth+1)
    # helper(t, 0)
    # return max_depth
    #
    # # Without a helper function:
    if is_leaf(t):
        return 0
    else:
        return max([1 + height(b) for b in branches(t)])


# Q1.2

def square_tree(t):
    """Return a tree with the square of every element in t
    >>> numbers = tree(1, [tree(2, [tree(3), tree(4)]), tree(5, [tree(6, [tree(7)]), tree(8)])])
    >>> print_tree(square_tree(numbers))
    1
      4
        9
        16
      25
        36
          49
        64
    """
    # # Note that if is_leaf(t) is not necessary, since if we had an empty list
    # # as tree then the list comprehension would not iterate on anything.
    sq_label = label(t)**2
    if is_leaf(t):
        return tree(sq_label)
    return tree(sq_label, [square_tree(branch) for branch in branches(t)])


# Q1.3

def find_path(tree, x):
    """
    >>> t = tree(2, [tree(7, [tree(3), tree(6, [tree(5), tree(11)])] ), tree(15)])
    >>> find_path(t, 5)
    [2, 7, 6, 5]
    >>> find_path(t, 10)  # returns None
    """
    # I have not been able to solve the problem using the given structure.
    # This code is the same as the Solutions file.
    if label(tree) == x:
        return [label(tree)]
    for b in branches(tree):
        path = find_path(b, x)
        if path:
            return [label(tree)] + path


# =====
# Mutation
# ====


# Q2.1

def q21():
    """
    >>> lst1 = [1, 2, 3]
    >>> lst2 = lst1
    >>> lst1 is lst2
    True
    >>> lst2.extend([5, 6])
    >>> lst1[4]
    6
    >>> lst1.append([-1, 0, 1])
    >>> -1 in lst2
    False
    >>> lst2[5]
    [-1, 0, 1]
    >>> lst3 = lst2[:]
    >>> lst3.insert(3, lst2.pop(3))
    >>> len(lst1)
    5
    >>> lst1[4] is lst3[6]
    True
    >>> lst3[lst2[4][1]]
    1
    >>> lst1[:3] is lst2[:3]
    False
    >>> lst1[:3] == lst3[:3]
    True
    """


# Q2.2

def add_this_many(x, el, lst):
    """ Adds el to the end of lst the number of times x occurs
    in lst.
    >>> lst = [1, 2, 4, 2, 1]
    >>> add_this_many(1, 5, lst)
    >>> lst
    [1, 2, 4, 2, 1, 5, 5]
    >>> add_this_many(2, 2, lst)
    >>> lst
    [1, 2, 4, 2, 1, 5, 5, 2, 2]
    """
    # My solution is more elegant :-)
    return lst.extend([el for _ in lst if _==x])


# Q2.3

def group_by(s, fn):
    """
    >>> group_by([12, 23, 14, 45], lambda p: p // 10)
    {1: [12, 14], 2: [23], 4: [45]}
    >>> group_by(range(-3, 4), lambda x: x * x)
    {9: [-3, 3], 4: [-2, 2], 1: [-1, 1], 0: [0]}
    """
    grouped = {}
    for el in s:
        key = fn(el)
        if key in grouped.keys():
            grouped[key].append(el)
        else:
            grouped[key] = [el]
    return grouped


# =====
# Nonlocal
# ====

# Q3.2

def memory(n):
    """
    >>> f = memory(10)
    >>> f(lambda x: x * 2)
    20
    >>> f(lambda x: x - 7)
    13
    >>> f(lambda x: x > 5)
    True
    """
    def helper(func):
        nonlocal n
        n = func(n)
        return n
    return helper
