from lab05 import *

def complete_tree(t, len_diff):
    """
    >>> t = tree( 1, [ tree(2, [tree(3)] ) ] )
    >>> t = complete_tree(t, 3)
    >>> print_tree(t)
    1
      2
        3
      0
      0
      0
    >>> t = tree( 1, [ tree(2, [tree(3)] ), tree(1) ] )
    >>> t = complete_tree(t, 1)
    >>> print_tree(t)
    1
      2
        3
      1
      0
    """
    zero_branches = [tree(0) for _ in range(len_diff)]
    return tree(label(t), [branch for branch in branches(t)] + zero_branches)
