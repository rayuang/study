/* 
流程控制
*/
if (0) {
    console.log("000")
} else if (1) {
    console.log("111")
}
var num = 100
switch (num) {
    case 10:
        console.log("10")
        break
    case 100:
        console.log("100")
        break
    default:
        console.log("以上都不是")
}
var whi = 10
while (whi > 0) {
    console.log(whi--)
}
do {
    console.log("doWhile")
} while (0)
for (var i = 0; i < 10; i++) {
console.log(i)
}
/* 
break 终止本次循环
continue 跳出当前这一轮循环
*/
