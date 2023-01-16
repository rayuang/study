//事件绑定
import React, { Component } from 'react'

export default class App extends Component {
  render() {
    const obj = ()=>{
      console.log("onClick")
    }
    const mouse = ()=>{
      console.log("mouse")
    }
    return (
      <div>
        <input></input> 
        <button onClick={obj} onMouseOver={mouse}>add</button><br/>
        <input></input> 
        {/*this.isClick不能加小括号，加了系统会自动执行，后续点击无效*/}
        <button onClick={this.isClick}>add</button>
      </div>
    )
  }
  isClick(){
    console.log("isClick")
  }

}
