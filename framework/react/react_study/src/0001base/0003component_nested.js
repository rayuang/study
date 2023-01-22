//组件嵌套
import React, { Component } from 'react'

const ClassComponent = () => <div>abc</div>
const FunctionComponent = () => <div>abc</div>


export default class App extends Component {
    render() {
        return (
            <div>
                <ClassComponent></ClassComponent>
                <FunctionComponent></FunctionComponent>
            </div>
        )
    }
}
