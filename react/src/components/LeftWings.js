/* jshint esversion:6*/
import React, { Component } from 'react';

class LeftWings extends Component {
  constructor(props) {
    super(props);
    this.state = {};
  }

  render(){
    return(
      <div onClick={this.props.handleLeftWingDraft}>
        {this.props.name}
      </div>
    )
  }
}

export default LeftWings;
