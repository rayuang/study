// 通过构造函数创建
let arr_1 = new Array(1, 2, 3)
// 通过字面量创建
let arr_2 = [4, 5, 6]
console.log(arr_1, "\n", arr_2, "\n数组的访问:", arr_1[2], "\t", arr_2[1])
// 遍
for (let index = 0; index < arr_2.length; index++) {
    const element = arr_2[index];
    console.log(element)
}
// 常用方法
// 在数组后面插入元素
arr_1.push(5)
// 将数组后面的元素弹出
arr_2.pop()

console.log(arr_1, arr_2)

// 从数组前面删除
arr_1.shift()
// 从数组前面插入
arr_2.unshift(10)
console.log(arr_1, arr_2)