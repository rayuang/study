/* 
运算符
*/
// 数学运算符 + - * / % 
var a = 1 + 1
var b = "a" + 1//拼串
var c = 10 + true//c = 11 布尔会转换成数字运算，true为1
var d = 10 - 1
var e = 10 * 2
var f = 10 / 3//会保留小数-> 最多16位
var g = 10 % 3
console.log(a, b, c, d, e, f, g)//2 a1 11 9 20 5 1
// 赋值运算符 = += -= *= /= %=
// 比较运算符 == === != !== >= <= > <
var h = ("1" == 1)//true == 值比较值，不考虑数据类型
var i = ("1" === 1)//false === 值和数据类型都比较
var j = ("1" != 1)//false 值相等为false
var k = ("1" !== 1)//true 值和数据类型都相等为false，否则为true
// 逻辑运算符 && || !
console.log(!!"abc")//转布尔型
console.log(0 || 123)//会直接输出为true的值
// 自增自减运算符 ++ --
var l = 10
// 前置++或--为先运算在返回，后置++或--为先返回在运算
console.log(++l,l--,l)
// 三目(三元)运算符
console.log((12+13==25)?1:2)
console.log((12+13==24)?1:2)
