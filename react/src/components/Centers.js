/* jshint esversion:6*/
import React, { Component } from 'react';

class Centers extends Component {
  constructor(props) {
    super(props);
    this.state = {};
  }

  render(){
    return(
      <div onClick={this.props.handleCenterDraft}>
        {this.props.name}
      </div>
    )
  }
}

export default Centers;
