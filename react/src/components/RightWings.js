/* jshint esversion:6*/
import React, { Component } from 'react';

class RightWing extends Component {
  constructor(props) {
    super(props);
    this.state = {};
  }

  render(){
    return(
      <div onClick={this.props.handleRightWingDraft}>
        {this.props.name}
      </div>
    )
  }
}

export default RightWing;
