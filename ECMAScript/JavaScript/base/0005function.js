/* 
函数
function func_name(形参) {
}
func_name(实参)
*/
// 函数中参数不能在外面直接调用
// 声明式 -> 可以预解析，调用代码可在函数声明前
function func_1(a,b) {
    console.log("func_1",a,b)
}
func_1()//不传参输出undefined
func_1(1,2)
// 赋值式
var func_2 = function () {
    console.log("func_2")
}
func_2()