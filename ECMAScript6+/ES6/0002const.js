//不允许被修改,声明时必须赋值，不赋值为undefined，不能再次赋值
const num = 10

//不能重复定义
//遵循块级作用域 及 暂存性死区 及 声明不提升 及 不与顶层对象挂钩

const obj = {
    //obj存储的是地址
    name: "wang",
    age: 18
}

obj.name = "ruijie"
//此处可以修改，因为常量修饰的是obj的地址，地址不可改变，待对象中内容可以
console.log(obj)

// 若不想让其对象的属性改变，则可使用 Object.freeze()函数冻结对象中的属性
// 只能冻住一级，若属性也是复杂数据类型，则其属性的属性冻不住
const object = Object.freeze(
    {
        name: "wang",
        age: 18
    }
)
console.log(object.name)