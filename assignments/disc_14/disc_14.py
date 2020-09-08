
################################################################################
#     1. Recursion
################################################################################


# Q1.1

def paths(x, y):
    """Return a list of ways to reach y from x by repeated
    incrementing or doubling.
    >>> paths(3, 5)
    [[3, 4, 5]]
    >>> sorted(paths(3, 6))
    [[3, 4, 5, 6], [3, 6]]
    >>> sorted(paths(3, 9))
    [[3, 4, 5, 6, 7, 8, 9], [3, 4, 8, 9], [3, 6, 7, 8, 9]]
    >>> paths(3, 3) # No calls is a valid path
    [[3]]
    """
    if x > y:
        return []
    elif x == y:
        return [[x]]
    else:
        a = [[x] + path for path in paths(x + 1, y)]
        b = [[x] + path for path in paths(2*x, y)]
        return a + b


# Q1.2

def merge(s1, s2):
    """ Return the sorted elements in increasing order from two sorted lists
    which are already sorted in increasing order.
    >>> merge([], [])
    []
    >>> merge([], [1, 2])
    [1, 2]
    >>> merge([1, 3, 6], [2, 4, 5])
    [1, 2, 3, 4, 5, 6]
    """
    if len(s1) != 0 and len(s2) != 0:
        if s1[0] > s2[0]:
            return [s2[0]] + merge(s1, s2[1:])
        else:
            return [s1[0]] + merge(s1[1:], s2)
    else:
        return s1 + s2

def mergesort(seq):
    """ Mergesort algorithm: return a sorted list in incresing order form an
    unsorted list
    >>> mergesort([1, 3, 6, 2, 4, 5])
    [1, 2, 3, 4, 5, 6]
    >>> mergesort([10, 2, 0, 2])
    [0, 2, 2, 10]
    >>> mergesort([])
    []
    """
    len_seq = len(seq)
    if len_seq <= 1:
        return seq
    half_len = len_seq//2
    subseq1 = mergesort(seq[:half_len])
    subseq2 = mergesort(seq[half_len:])
    return merge(subseq1, subseq2)


################################################################################
#     2. Trees
################################################################################


# Q2.1

def long_paths(tree, n):
    """Return a list of all paths in tree with length at least n.
    >>> t = Tree(1, [Tree(2, [Tree(3)]), Tree(2)])
    >>> for path in long_paths(t, 1):
    ...     print(path)
    ...
    <1 2 3>
    <1 2>
    >>> t = Tree(3, [Tree(4), Tree(4), Tree(5)])
    >>> left = Tree(1, [Tree(2), t])
    >>> mid = Tree(6, [Tree(7, [Tree(8)]), Tree(9)])
    >>> right = Tree(11, [Tree(12, [Tree(13, [Tree(14)])])])
    >>> whole = Tree(0, [left, Tree(13), mid, right])
    >>> for path in long_paths(whole, 2):
    ...     print(path)
    ...
    <0 1 2>
    <0 1 3 4>
    <0 1 3 4>
    <0 1 3 5>
    <0 6 7 8>
    <0 6 9>
    <0 11 12 13 14>
    >>> for path in long_paths(whole, 3):
    ...     print(path)
    ...
    <0 1 3 4>
    <0 1 3 4>
    <0 1 3 5>
    <0 6 7 8>
    <0 11 12 13 14>
    >>> long_paths(whole, 4)
    [Link(0, Link(11, Link(12, Link(13, Link(14)))))]
    """
    if tree.is_leaf() and n > 0:
        return []
    elif tree.is_leaf() and n <= 0:
        return [Link(tree.label)]
    else:
        paths = []
        for branch in tree.branches:
            subpaths = long_paths(branch, n-1)
            paths += [Link(tree.label, subpath) for subpath in subpaths]
        return paths

class Tree:
    """
    >>> t = Tree(3, [Tree(2, [Tree(5)]), Tree(4)])
    >>> t.label
    3
    >>> t.branches[0].label
    2
    >>> t.branches[1].is_leaf()
    True
    """

    def __init__(self, label, branches=[]):
        for b in branches:
            assert isinstance(b, Tree)
        self.label = label
        self.branches = list(branches)

    def is_leaf(self):
        return not self.branches

    def map(self, fn):
        """
        Apply a function `fn` to each node in the tree and mutate the tree.

        >>> t1 = Tree(1)
        >>> t1.map(lambda x: x + 2)
        >>> t1.map(lambda x : x * 4)
        >>> t1.label
        12
        >>> t2 = Tree(3, [Tree(2, [Tree(5)]), Tree(4)])
        >>> t2.map(lambda x: x * x)
        >>> t2
        Tree(9, [Tree(4, [Tree(25)]), Tree(16)])
        """
        self.label = fn(self.label)
        for b in self.branches:
            b.map(fn)

    def __contains__(self, e):
        """
        Determine whether an element exists in the tree.

        >>> t1 = Tree(1)
        >>> 1 in t1
        True
        >>> 8 in t1
        False
        >>> t2 = Tree(3, [Tree(2, [Tree(5)]), Tree(4)])
        >>> 6 in t2
        False
        >>> 5 in t2
        True
        """
        if self.label == e:
            return True
        for b in self.branches:
            if e in b:
                return True
        return False

    def __repr__(self):
        if self.branches:
            branch_str = ', ' + repr(self.branches)
        else:
            branch_str = ''
        return 'Tree({0}{1})'.format(self.label, branch_str)

    def __str__(self):
        def print_tree(t, indent=0):
            tree_str = '  ' * indent + str(t.label) + "\n"
            for b in t.branches:
                tree_str += print_tree(b, indent + 1)
            return tree_str
        return print_tree(self).rstrip()


class Link:
    """A linked list.

    >>> s = Link(1)
    >>> s.first
    1
    >>> s.rest is Link.empty
    True
    >>> s = Link(2, Link(3, Link(4)))
    >>> s.first = 5
    >>> s.rest.first = 6
    >>> s.rest.rest = Link.empty
    >>> s                                    # Displays the contents of repr(s)
    Link(5, Link(6))
    >>> s.rest = Link(7, Link(Link(8, Link(9))))
    >>> s
    Link(5, Link(7, Link(Link(8, Link(9)))))
    >>> print(s)                             # Prints str(s)
    <5 7 <8 9>>
    """
    empty = ()

    def __init__(self, first, rest=empty):
        assert rest is Link.empty or isinstance(rest, Link)
        self.first = first
        self.rest = rest

    def __repr__(self):
        if self.rest is not Link.empty:
            rest_repr = ', ' + repr(self.rest)
        else:
            rest_repr = ''
        return 'Link(' + repr(self.first) + rest_repr + ')'

    def __str__(self):
        string = '<'
        while self.rest is not Link.empty:
            string += str(self.first) + ' '
            self = self.rest
        return string + str(self.first) + '>'

    def __getitem__(self, i):
            if i == 0:
                return self.first
            else:
                return self.rest[i-1]

    def __len__(self):
        return 1 + len(self.rest)


################################################################################
#     3. Mutation
################################################################################


# Q3.1

def Q3_1():
    """
    >>> cats = [1, 2]
    >>> dogs = [cats, cats.append(23), list(cats)] # [[1, 2, 23], [1, 2, 23], [1, 2, 23]]
    >>> cats
    [1, 2, 23]
    >>> dogs[1] = list(dogs)
    >>> dogs[1]
    [[1, 2, 23], None, [1, 2, 23]]
    >>> dogs[0].append(2)
    >>> cats
    [1, 2, 23, 2]
    >>> cats[1::2]
    [2, 2]
    >>> cats[:3]
    [1, 2, 23]
    >>> dogs[2].extend([list(cats).pop(0), 3])
    >>> dogs
    [[1, 2, 23, 2], [[1, 2, 23, 2], None, [1, 2, 23, 1, 3]], [1, 2, 23, 1, 3]]
    """


################################################################################
#     4. Mutable Linked Lists and Trees
################################################################################


# Q4.1

def flip_two(lnk):
    # See Solutions file for an iterative solution.
    """
    >>> one_lnk = Link(1)
    >>> flip_two(one_lnk)
    >>> one_lnk
    Link(1)
    >>> lnk = Link(1, Link(2, Link(3, Link(4, Link(5)))))
    >>> flip_two(lnk)
    >>> lnk
    Link(2, Link(1, Link(4, Link(3, Link(5)))))
    """
    if lnk != Link.empty and lnk.rest != Link.empty:
        lnk.first, lnk.rest.first = lnk.rest.first, lnk.first
        flip_two(lnk.rest.rest)


################################################################################
#     5. Generators
################################################################################


# Q5.1

def repeated(f):
    """
    >>> double = lambda x: 2 * x
    >>> funcs = repeated(double)
    >>> identity = next(funcs)
    >>> double = next(funcs)
    >>> quad = next(funcs)
    >>> oct = next(funcs)
    >>> quad(1)
    4
    >>> oct(1)
    8
    >>> [g(1) for _, g in
    ...  zip(range(5), repeated(lambda x: 2 * x))]
    [1, 2, 4, 8, 16]
    """
    g = lambda x: x
    while True:
        yield g
        g = (lambda g: lambda x: f(g(x)))(g)


# Q5.2

# That function from Ben was my attempt. It does not work because there is an
# infinite recursive loop. To understand why there is such a loop, notice that
# in "g = lambda x: f(g(x))" the G in the body of the function is only called
# when we evaluate the lambda expression. When we finally evaluate, the G in
# the body of the function is bound to "lambda x: f(g(x))" in the last
# frame, so it calls itself again and again.
# The correct way to do this exercise is to evaluate g before calling to the
# yielded function. This is achieved when passing g as a parameter to a
# lambda function.


# Q5.3

from operator import add, mul
def accumulate(iterable, f):
    """
    >>> list(accumulate([1, 2, 3, 4, 5], add))
    [1, 3, 6, 10, 15]
    >>> list(accumulate([1, 2, 3, 4, 5], mul))
    [1, 2, 6, 24, 120]
    """
    it = iter(iterable)
    total = next(it)
    yield total
    for element in it:
        total = f(total, element)
        yield total
