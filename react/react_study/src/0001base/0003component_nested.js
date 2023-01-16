//组件嵌套
import React, { Component } from 'react'
import ClassComponent from './0001class_component'
import FunctionComponent from './0002func_component'

export default class ComponentNested extends Component {
    render() {
        return (
            <div>
                <ClassComponent></ClassComponent>
                <FunctionComponent></FunctionComponent>
            </div>
        )
    }
}
