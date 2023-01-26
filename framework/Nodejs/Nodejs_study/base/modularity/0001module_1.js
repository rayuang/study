var add = function (a, b) {
    return a + b
}
var hello = function () {
    return "HelloWorld"
}

// 导出函数，只能导出一个，否则会覆盖
// module.exports = add
// 导出多个需使用对象形式
// commonjs规范
/* 
module.exports = {
    add, hello
}
 */
/* 
或使用
exports.add = add
exports.hello = hello
导出
*/
// es6导出规范
export default {
    add, hello
}