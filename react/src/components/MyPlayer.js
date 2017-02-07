/* jshint esversion:6*/
import React, { Component } from 'react';

class MyPlayer extends Component {
  constructor(props) {
    super(props);
    this.state = {};
  }

  render(){
    return(
      <div>
        {this.props.name}
      </div>
    )
  }
}

export default MyPlayer;
