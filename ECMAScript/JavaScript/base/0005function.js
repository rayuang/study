/* 
函数
function func_name(形参) {
}
func_name(实参)
*/
/* 
预解析：执行代码 -> 1. 解释代码 2. 执行代码
需要解释的内容：
1. 声明式函数，预解析会将声明式函数整体放到最前面
2. var关键词的变量，预解析会将声明非赋值的部分提到最前面
*/
// 函数中参数不能在外面直接调用
// 声明式 -> 可以预解析，调用代码可在函数声明前
// return 返回值，后语句不在执行
function func_1(a, b) {
    console.log("func_1", a, b)
}
func_1()//不传参输出undefined
func_1(1, 2)
// 赋值式
var func_2 = function () {
    console.log("func_2")
}
func_2()
// 重名声明式函数前面的会被后面的覆盖
// 变量名和方法名冲突时
var age = 10
// 1. var age 提升最前面 2. function age整体提升到最前面 3. age = 10
function age() {
    console.log("age = 10")
}
console.log(age)//10 ， 不会打印方法体
// 函数中的只能提升到函数的最上面
// 声明提升不能跨script标签，只能提升到所在script标签最上面
/* 
作用域
页面打开后，浏览器会自动给一个全局作用域window，直到页面销毁
js中只有函数能生成局部作用域，即函数内部的变量只能在函数内部使用
函数中也可以访问全局变量
获取变量规则：就近
局部若使用全局变量，可以修改成功
*/
