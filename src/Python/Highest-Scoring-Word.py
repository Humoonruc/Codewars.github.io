# Highest-Scoring-Word.py


#%%
def get_score(word):
    """
    Returns the score for a given word.
    Each letter of a word scores points according to its position in the alphabet: `a = 1, b = 2, c = 3` etc.
    """
    return sum([ord(char) - 96 for char in word])


#%%
def high(x):
    """
    find the highest scoring word in a sentence
    """
    words = x.split()
    return max(words, key=get_score)


# %%
high("what time are we climbing up the volcano") == "volcano"

# %%
