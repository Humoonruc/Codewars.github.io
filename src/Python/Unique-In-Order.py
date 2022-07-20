# Unique-In-Order.py

#%%
from itertools import groupby


def unique_in_order(iterable):
    return [k for (k, _) in groupby(iterable)]


unique_in_order([1, 2, 2, 3, 3])

# %%
