let arr = [1, 2, 3, 4]
let [q, w, e, r] = arr
console.log(q, w, e, r)//1 2 3 4
//倒置
let a = 1;
let b = 2;
[a,b] = [b,a]
console.log(a,b)

//拿索引为2的值
let [,,num] = arr
console.log(num)