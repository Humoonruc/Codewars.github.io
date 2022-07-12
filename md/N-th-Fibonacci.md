I love Fibonacci numbers in general, but I must admit I love some more than others.

I would like for you to write me a function that when given a number (n) returns the n-th number in the Fibonacci Sequence.

For example:

```
nthfibo(4) == 2
```

Because 2 is the 4th number in the Fibonacci Sequence.

For reference, the first two numbers in the Fibonacci sequence are 0 and 1, and each subsequent number is the sum of the previous two.


#### 要点

斐波那契数列相邻两项的变化，可以通过一个线性变换得到，即

$$
\begin{bmatrix}
 a_n\\
a_{n+1}
\end{bmatrix} = \begin{bmatrix}
 0 & 1\\
1 & 1
\end{bmatrix} \begin{bmatrix}
 a_{n-1}\\
a_{n}
\end{bmatrix}
$$