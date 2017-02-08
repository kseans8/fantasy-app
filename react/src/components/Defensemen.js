/* jshint esversion:6*/
import React, { Component } from 'react';

class Defensemen extends Component {
  constructor(props) {
    super(props);
    this.state = {};
  }

  render(){
    return(
      <div onClick={this.props.handleDefenseDraft}>
        {this.props.name}
      </div>
    )
  }
}

export default Defensemen;
