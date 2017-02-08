/* jshint esversion:6*/
import React, { Component } from 'react';
import LeftWings from './LeftWings';

class LeftWingsList extends Component {
  constructor(props) {
    super(props);
    this.state = {
      availablePlayers: []
    };
  }

  render(){

    let leftWings = this.props.allPlayers.map((player) => {
      if (player.position === "LW"){
        let handleLeftWingDraft = () => {
          this.props.handleLeftWingDraft(player, 2);
        };
        return(
          < LeftWings
            key = { player.id }
            name = { player.name }
            handleLeftWingDraft = { handleLeftWingDraft }
          />
        )
      }
    })
    return(
      <div>
        <h3>Please Select Two Left Wingers:</h3>
        {leftWings}
      </div>
    )
  }
}

export default LeftWingsList;
