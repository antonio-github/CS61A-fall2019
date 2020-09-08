
####################################
#            Interfaces            #
####################################

##############
#    Q1.1    #
##############

class A():
    def __init__(self, x):
        self.x = x
    def __repr__(self):
        return self.x
    def __str__(self):
        return self.x * 2

class B():
    def __init__(self):
        print("boo!")
        self.a = []
    def add_a(self, a):
        self.a.append(a)
    def __repr__(self):
        print(len(self.a))
        ret = ""
        for a in self.a:
            ret += str(a)
        return ret

def q11():
    """
    >>> A("one")
    one
    >>> print(A("one"))
    oneone
    >>> repr(A("two"))
    'two'
    >>> b = B()
    boo!
    >>> b.add_a(A("a"))
    >>> b.add_a(A("b"))
    >>> b
    2
    aabb
    >>> c = A("c")
    >>> b.add_a(c)
    >>> str(b)
    3
    'aabbcc'
    """

##############
#    Q1.2    #
##############

# Link List Class
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

def is_palindrome(seq):
    """ Returns True if the sequence is a palindrome. A palindrome is a sequence
    that reads the same forwards as backwards
    >>> is_palindrome(Link("l", Link("i", Link("n", Link("k")))))
    False
    >>> is_palindrome(["l", "i", "n", "k"])
    False
    >>> is_palindrome("link")
    False
    >>> is_palindrome(Link.empty)
    True
    >>> is_palindrome([])
    True
    >>> is_palindrome("")
    True
    >>> is_palindrome(Link("a", Link("v", Link("a"))))
    True
    >>> is_palindrome(["a", "v", "a"])
    True
    >>> is_palindrome("ava")
    True
    """
    len_seq = len(seq)
    for i in range(len_seq):    # More efficient: use range(len_seq//2)
        if seq[i] != seq[len_seq - i - 1]:
            return False
    return True


######################################
#            Linked Lists            #
######################################

##############
#    Q2.1    #
##############

def sum_nums(lnk):
    """
    >>> a = Link(1, Link(6, Link(7)))
    >>> sum_nums(a)
    14
    """
    if lnk == Link.empty:
        return 0
    else:
        return lnk.first + sum_nums(lnk.rest)


##############
#    Q2.2    #
##############

def multiply_lnks(lst_of_lnks):
    """
    >>> a = Link(2, Link(3, Link(5)))
    >>> b = Link(6, Link(4, Link(2)))
    >>> c = Link(4, Link(1, Link(0, Link(2))))
    >>> p = multiply_lnks([a, b, c])
    >>> p.first
    48
    >>> p.rest.first
    12
    >>> p.rest.rest.rest is Link.empty
    True
    """
    product = 1
    lst_of_rests = []
    for lnk in lst_of_lnks:
        if lnk == Link.empty:
            return Link.empty
        product *= lnk.first
        lst_of_rests.append(lnk.rest)
    return Link(product, multiply_lnks(lst_of_rests))



##################################################
#            Iterators and Generators            #
##################################################

##############
#    Q3.1    #
##############

def q31():
    """
    >>> lst = [6, 1, "a"]
    >>> lst_iter =iter(lst)
    >>> next(lst_iter)
    6
    >>> next(lst_iter)
    1
    >>> next(iter(lst))
    6
    >>> [x for x in lst_iter]
    ['a']
    """
    # >>> lst = [6, 1, "a"]
    # >>> next(lst)
    # Error


##############
#    Q3.2    #
##############

def filter_link(link, f):
    """
    >>> link = Link(1, Link(2, Link(3)))
    >>> g = filter_link(link, lambda x: x % 2 == 0)
    >>> next(g)
    2
    >>> list(filter_link(link, lambda x: x % 2 != 0))
    [1, 3]
    """
    # >>> next(g)
    # StopIteration
    while link != Link.empty:
        if f(link.first):
            yield link.first
        link = link.rest

def filter_no_iter(link, f):
    """
    >>> link = Link(1, Link(2, Link(3)))
    >>> list(filter_no_iter(link, lambda x: x % 2 != 0))
    [1, 3]
    """
    if link == Link.empty:
        return          # return in a generator means StopIteration
    elif f(link.first):
        yield link.first
    yield from filter_no_iter(link.rest, f)


##############
#    Q3.3    #
##############

def sum_paths_gen(t):
    """
    >>> t1 = Tree(5)
    >>> next(sum_paths_gen(t1))
    5
    >>> t2 = Tree(1, [Tree(2, [Tree(3), Tree(4)]), Tree(9)])
    >>> sorted(sum_paths_gen(t2))
    [6, 7, 10]
    """
    if t.is_leaf():
        yield t.label
    for b in t.branches:
        for s in sum_paths_gen(b):  # Use sum_paths_gen(b) as iterable in for
                                    # loop. Does not yield final value.
            yield s + t.label
