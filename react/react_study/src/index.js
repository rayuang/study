/**
 * @author rayuang
 */
import React from "react" //react核心包
import ReactDom from "react-dom" //将react组件渲染到页面
import ClassComponent from "./0001base/0001class_component"
import FunctionComponent from "./0001base/0002func_component"
import ComponentNested from "./0001base/0003component_nested"
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
    <ClassComponent></ClassComponent>, document.getElementById("class_component")
)


ReactDom.render(
    <FunctionComponent></FunctionComponent>, document.getElementById("func_component")
)

ReactDom.render(
    <ComponentNested></ComponentNested>, document.getElementById("component_nested")
)