import React from "react";

/**
 * 继承 React.Component 实现组建类
 * 注意：
 * 1. 类名大写
 * 2. 最外层只能有一个标签，不能并列
 * 3. return后不能换行,若换行需放在()中
 */
class App extends React.Component{
    render(){
        return <div>
                <p>
                    HelloWorld-ClassComponent    
                </p>        
            </div>
    }
}

export default App