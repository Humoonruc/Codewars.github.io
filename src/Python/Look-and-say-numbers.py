# Look-and-say-numbers.py

#%%
from itertools import groupby
import re


#%%
def count_string(s):
    # 解法一：正则替换
    # `\1*`表示第一个()中的内容再重复0次以上
    # m.group(0) 是每个成功匹配的全部字符，m.group(1) 是 () 中的字符
    # 就像 R 中 stringr::str_match() 每行的两个元素
    # return re.sub(r'(.)\1*', lambda m: str(len(m.group(0))) + m.group(1), s)

    # 解法二：正则匹配
    numstrs = re.findall('1+|2+|3+|4+|5+|6+|7+|8+|9+', s)
    return "".join(map(lambda x: str(len(x)) + x[0], numstrs))

    # 解法三：groupby()，返回元组，分别是相同字符及其 itrerator
    # return "".join((str(len(list(g))) + n) for n, g in groupby(s))


count_string("112223")


#%%
def look_and_say(data='1', maxlen=5):
    ''' 
    data:   starting number set
    maxlen: max sequence length
    '''

    # 解法一：使用 map 迭代
    s = [data]

    def gender_output(s):
        s[0] = count_string(s[0])
        return s[0]  # python 的赋值表达式没有返回值，所以不能 return s = 1

    return list(map(lambda t: gender_output(s), range(maxlen)))

    # 解法二：循环
    # output = []
    # for i in range(maxlen):
    #     data = count_string(data)
    #     output.append(data)
    # return output


look_and_say("1", 5)

# %%