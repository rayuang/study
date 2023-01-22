let num = 10
// let num = 10 不允许重复定义变量
{
    // 块级作用域，块外面不可访问，var没有块级作用域，会污染全局
    let nums = 100;
}
//i 每一次循环都会销毁重新基于上次的值创建
for (let i = 0; i < 10; i++) {
    console.log(num)
}

/*
不允许变量提升
console.log(num)//会打印undefined
var num = 10
*/


let age = 18

function test() {
    console.log(age)
    /* 暂存性死区，当前作用域已经定义的变量（无论在前后定义），
    若作用域外定义过同名全局变量，在当前作用域该变量重新定义前无法访问，显示未定义
    即已创建但无法获取
    若当前作用域未定义，则正常访问
    */
    let age = 20
}

//不与顶层对象挂钩
var myage1 = 100
console.log(window.myage1)//顶层对象可以访问
let myage2 = 200
console.log(window.myage2)//顶层对象不可访问，undefined