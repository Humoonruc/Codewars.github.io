# Highest-Scoring-Word.py


#%%
def get_score(word):
    return sum([ord(c) - 96 for c in word])


#%%
def high(x):
    words = x.split()
    return max(words, key=get_score)


# %%
high("what time are we climbing up the volcano")

# %%
