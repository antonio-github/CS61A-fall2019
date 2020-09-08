"""Typing test implementation"""

from utils import *
from ucb import main, interact, trace
from datetime import datetime


###########
# Phase 1 #
###########


def choose(paragraphs, select, k):
    """Return the Kth paragraph from PARAGRAPHS for which SELECT called on the
    paragraph returns true. If there are fewer than K such paragraphs, return
    the empty string.
    """
    # BEGIN PROBLEM 1
    i = 0
    for p in paragraphs:
        if select(p):
            if i == k:
                return p
            else:
                i += 1
    return ''
    # END PROBLEM 1


def about(topic):
    """Return a select function that returns whether a paragraph contains one
    of the words in TOPIC.

    >>> about_dogs = about(['dog', 'dogs', 'pup', 'puppy'])
    >>> choose(['Cute Dog!', 'That is a cat.', 'Nice pup!'], about_dogs, 0)
    'Cute Dog!'
    >>> choose(['Cute Dog!', 'That is a cat.', 'Nice pup.'], about_dogs, 1)
    'Nice pup.'
    """
    assert all([lower(x) == x for x in topic]), 'topics should be lowercase.'
    # BEGIN PROBLEM 2
    def check_topic(paragraph):
        paragraph = split(lower(remove_punctuation(paragraph)))
        for t in topic:
            if t in paragraph:
                return True
        return False
    return check_topic
    # END PROBLEM 2


def accuracy(typed, reference):
    """Return the accuracy (percentage of words typed correctly) of TYPED
    when compared to the prefix of REFERENCE that was typed.

    >>> accuracy('Cute Dog!', 'Cute Dog.')
    50.0
    >>> accuracy('A Cute Dog!', 'Cute Dog.')
    0.0
    >>> accuracy('cute Dog.', 'Cute Dog.')
    50.0
    >>> accuracy('Cute Dog. I say!', 'Cute Dog.')
    50.0
    >>> accuracy('Cute', 'Cute Dog.')
    100.0
    >>> accuracy('', 'Cute Dog.')
    0.0
    """
    typed_words = split(typed)
    reference_words = split(reference)
    # BEGIN PROBLEM 3
    len_typed_words = len(typed_words)
    if not len_typed_words:
        return 0.0
    pair_words = [(t, r) for t, r in zip(typed_words, reference_words)]
    n_matches = sum([1 for _ in pair_words if _[0] == _[1]])
    return 100*n_matches/len_typed_words
    # END PROBLEM 3


def wpm(typed, elapsed):
    """Return the words-per-minute (WPM) of the TYPED string."""
    assert elapsed > 0, 'Elapsed time must be positive'
    # BEGIN PROBLEM 4
    return ( len(typed)/5 )/( elapsed/60 )
    # END PROBLEM 4


def autocorrect(user_word, valid_words, diff_function, limit):
    """Returns the element of VALID_WORDS that has the smallest difference
    from USER_WORD. Instead returns USER_WORD if that difference is greater
    than LIMIT.
    """
    # BEGIN PROBLEM 5
    if user_word in valid_words:
        return user_word
    lambda_diff_fn = lambda x: diff_function(user_word, x, limit)
    correct_word = min(valid_words, key = lambda_diff_fn)
    if lambda_diff_fn(correct_word) > limit:
        return user_word
    else:
        return correct_word
    # END PROBLEM 5


def swap_diff(start, goal, limit):
    """A diff function for autocorrect that determines how many letters
    in START need to be substituted to create GOAL, then adds the difference in
    their lengths.
    """
    # BEGIN PROBLEM 6
    # assert False, 'Remove this line'
    len_st, len_goal = len(start), len(goal)
    len_dif = len_st - len_goal
    abs_len_dif = abs(len_dif)
    if len_dif != 0:
        if abs_len_dif > limit:
            return abs_len_dif
        if len_dif > 0:
            start = start[:len_st - len_dif]
        else:
            goal = goal[:len_goal - abs(len_dif)]
        return abs_len_dif + swap_diff(start, goal, limit-abs_len_dif)
    if limit < 0:
        return 0
    elif len(start) == 0 or len(goal) == 0:
        return 0
    elif start[0] == goal[0]:
        return swap_diff(start[1:], goal[1:], limit)
    else:
        return 1 + swap_diff(start[1:], goal[1:], limit-1)
    # END PROBLEM 6

def edit_diff(start, goal, limit):
    """A diff function that computes the edit distance from START to GOAL."""
    # assert False, 'Remove this line'

    # if ______________: # Fill in the condition
    #     # BEGIN
    #     "*** YOUR CODE HERE ***"
    #     # END
    #
    # elif ___________: # Feel free to remove or add additional cases
    #     # BEGIN
    #     "*** YOUR CODE HERE ***"
    #     # END
    #
    # else:
    #     add_diff = ...  # Fill in these lines
    #     remove_diff = ...
    #     substitute_diff = ...
    #     # BEGIN
    #     "*** YOUR CODE HERE ***"
    #     # END
    if limit < 0: # Fill in the condition
        # BEGIN
        return 0
        # END
    elif len(start) == 0:
        return len(goal)
    elif len(goal) == 0:
        return len(start)
    elif start[0] == goal[0]: # Feel free to remove or add additional cases
        # BEGIN
        return edit_diff(start[1:], goal[1:], limit)
        # END
    else:
        add_diff = 1 + edit_diff(start, goal[1:], limit-1)
        remove_diff = 1 + edit_diff(start[1:], goal, limit-1)
        substitute_diff = 1 + edit_diff(start[1:], goal[1:], limit-1)
        # BEGIN
        return min(add_diff, remove_diff, substitute_diff)
        # END


def final_diff(start, goal, limit):
    """A diff function. If you implement this function, it will be used."""
    assert False, 'Remove this line to use your final_diff function'




###########
# Phase 3 #
###########


def report_progress(typed, prompt, id, send):
    """Send a report of your id and progress so far to the multiplayer server."""
    # BEGIN PROBLEM 8
    progress_dict = {'id': id, 'progress': 0}
    for i in zip(typed, prompt):
        if i[0] == i[1]:
            progress_dict['progress'] += 1
        else:
            break
    progress_dict['progress'] /= len(prompt)
    send(progress_dict)
    return progress_dict['progress']
    # END PROBLEM 8


def fastest_words_report(word_times):
    """Return a text description of the fastest words typed by each player."""
    fastest = fastest_words(word_times)
    report = ''
    for i in range(len(fastest)):
        words = ','.join(fastest[i])
        report += 'Player {} typed these fastest: {}\n'.format(i + 1, words)
    return report


def fastest_words(word_times, margin=1e-5):
    """A list of which words each player typed fastest."""
    n_players = len(word_times)
    n_words = len(word_times[0]) - 1
    assert all(len(times) == n_words + 1 for times in word_times)
    assert margin > 0
    # BEGIN PROBLEM 9
    def add_one_word(word, times, lists_fastest):
        min_time = min(times)
        for i in range(n_players):
            if times[i] - min_time < margin:
                lists_fastest[i].append(word)
    lists_fastest = [[] for _ in range(n_players)]
    i_word = 1
    while i_word < n_words+1:
        current_word = word(word_times[0][i_word])
        current_word_times = [elapsed_time(word_times[i][i_word]) - elapsed_time(word_times[i][i_word-1]) for i in range(n_players)]
        add_one_word(current_word, current_word_times, lists_fastest)
        i_word += 1
    return lists_fastest
    # END PROBLEM 9


def word_time(word, elapsed_time):
    """A data abstrction for the elapsed time that a player finished a word."""
    return [word, elapsed_time]


def word(word_time):
    """An accessor function for the word of a word_time."""
    return word_time[0]


def elapsed_time(word_time):
    """An accessor function for the elapsed time of a word_time."""
    return word_time[1]


enable_multiplayer = False  # Change to True when you


##########################
# Command Line Interface #
##########################


def run_typing_test(topics):
    """Measure typing speed and accuracy on the command line."""
    paragraphs = lines_from_file('data/sample_paragraphs.txt')
    select = lambda p: True
    if topics:
        select = about(topics)
    i = 0
    while True:
        reference = choose(paragraphs, select, i)
        if not reference:
            print('No more paragraphs about', topics, 'are available.')
            return
        print('Type the following paragraph and then press enter/return.')
        print('If you only type part of it, you will be scored only on that part.\n')
        print(reference)
        print()

        start = datetime.now()
        typed = input()
        if not typed:
            print('Goodbye.')
            return
        print()

        elapsed = (datetime.now() - start).total_seconds()
        print("Nice work!")
        print('Words per minute:', wpm(typed, elapsed))
        print('Accuracy:        ', accuracy(typed, reference))

        print('\nPress enter/return for the next paragraph or type q to quit.')
        if input().strip() == 'q':
            return
        i += 1


@main
def run(*args):
    """Read in the command-line argument and calls corresponding functions."""
    import argparse
    parser = argparse.ArgumentParser(description="Typing Test")
    parser.add_argument('topic', help="Topic word", nargs='*')
    parser.add_argument('-t', help="Run typing test", action='store_true')

    args = parser.parse_args()
    if args.t:
        run_typing_test(args.topic)
