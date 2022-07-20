# Valid-Parentheses.py


#%%
def valid_parentheses(string):
    """
    This is a practice problem.
    It checks to see if parenthesis's are balanced
    :param string: String
    :return Bool:
    """

    num = 0
    for c in string:
        if (c == "("): num += 1
        if (c == ")"): num -= 1
        if (num < 0): return False
    return num == 0


#%%
valid_parentheses("()")

# %%
