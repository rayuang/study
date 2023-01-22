import React, { Component } from 'react'
import './css/001index.css'

export default class App extends Component {
  render() {
    const num = 10;
    const component_style = {
        background:"pink",
        color:"red",
        fontSize:"32px"
    }
    return (
      <div style={component_style}>
        ComponentStyle-{100/5}-{num}
            <div className='bgc'>
                <label htmlFor='username'>bgc</label>
                <input id='username'></input>
            </div>
        </div>
    )
  }
}
