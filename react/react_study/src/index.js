/**
 * @author rayuang
 */
import React from "react" //react核心包
import ReactDom from "react-dom" //将react组件渲染到页面
import App from "./0001base/0005binding_event"
// ReactDom.render("<h1>HelloWorld</h1>",document.getElementById("root"))//将文字渲染到id为root的标签中
// ReactDom.render(<h1>HelloWorld</h1>,document.getElementById("root"))//将文字渲染到id为root的标签中
/*
ReactDom.render(React.createElement(
    "<div>",{
        id:123,
        className:456
    },"11111"
),document.getElementById("root"))//将文字渲染到id为root的标签中
*/
console.log("helloworld")

ReactDom.render(
    <App></App>, document.getElementById("root")
)