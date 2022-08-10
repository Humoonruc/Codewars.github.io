# Valid-Parentheses.py


#%%
def valid_parentheses(string):
    """Checks to see if parenthesis are balanced"""
    num = 0
    for c in string:
        if (c == "("): num += 1
        if (c == ")"): num -= 1
        if (num < 0): return False
    return num == 0


#%%
valid_parentheses("()")

# %%
