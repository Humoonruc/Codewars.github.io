对数组进行频数统计的计数器在不同语言中对应不同的数据结构，虽然在逻辑上都是键值对

- R. `table(arr)` 返回一个命名的向量
- julia. `DataStructures.counter()` 返回一个 struct，其中包裹的是一个 Dict
- JavaScript. 可以手写一个对象或 Map，储存 `元素:频率` 的键值对