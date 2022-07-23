Write a function that takes a string of parentheses, and determines if the order of the parentheses is valid. The function should return true if the string is valid, and false if it's invalid.


#### Examples

```
"()"              =>  true
")(()))"          =>  false
"("               =>  false
"(())((()())())"  =>  true
```

#### Constraints

`0 <= input.length <= 100`

Along with opening (`(`) and closing (`)`) parenthesis, input may contain any valid ASCII characters. Furthermore, the input string may be empty and/or not contain any parentheses at all. Do not treat other forms of brackets as parentheses (e.g. [], {}, <>).

### 算法与数据结构

本题的考点是 Stack 这种数据结构，先进后出，后进先出，思路如下：

```js
function validParentheses(parens) {
  let stack = [];

  for (c of parens.split("")) {
    if (c === '(') {
      stack.push(c);
    } else if (c === ')') {
      if (stack.length === 0) return false;
      stack.pop();
    }
  }

  return stack.length === 0;
}
```

具体实现时，可以用整数代替栈，尽可能化简