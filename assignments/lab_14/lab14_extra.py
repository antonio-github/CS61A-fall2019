
def num_splits(s, d):
    """Return the number of ways in which s can be partitioned into two
    sublists that have sums within d of each other.

    >>> num_splits([1, 5, 4], 0)  # splits to [1, 4] and [5]
    1
    >>> num_splits([6, 1, 3], 1)  # no split possible
    0
    >>> num_splits([-2, 1, 3], 2) # [-2, 3], [1] and [-2, 1, 3], []
    2
    >>> num_splits([1, 4, 6, 8, 2, 9, 5], 3)
    12
    """
    # Idea: either an element goes to a sublist or to the other. If the first
    # element of the list goes to the first sublist, we assign a positive value
    # to the total sum of both sublists. If it goes to the second sublist we
    # assign a negative sign (we substract the second sublist from the first).
    # Acting this way we are double-counting the splits because given one
    # sublist and other sublist satisfying the condition, we have the same
    # sublists exchanged (i.e. if we have a SUM for the first case, for the
    # exchanged case we would have -SUM).
    def helper(s, sum):
        if len(s) == 0:
            return 1 if abs(sum) <= d else 0
        first, rest = s[0], s[1:]
        return helper(rest, sum + first) + helper(rest, sum - first)
    return helper(s, 0)//2


def insert(link, value, index):
    """Insert a value into a Link at the given index.

    >>> link = Link(1, Link(2, Link(3)))
    >>> print(link)
    <1 2 3>
    >>> insert(link, 9001, 0)
    >>> print(link)
    <9001 1 2 3>
    >>> insert(link, 100, 2)
    >>> print(link)
    <9001 1 100 2 3>
    >>> insert(link, 4, 5)
    IndexError
    """
    if link == Link.empty and index >= 0:
        raise IndexError
    elif index == 0:
        link.rest = Link(link.first, link.rest)
        link.first = value
    elif index > 0:
        insert(link.rest, value, index - 1)


# Link Class
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
