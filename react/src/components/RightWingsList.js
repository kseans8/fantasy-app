/* jshint esversion:6*/
import React, { Component } from 'react';
import RightWings from './RightWings';

class RightWingsList extends Component {
  constructor(props) {
    super(props);
    this.state = {
      availablePlayers: []
    };
  }

  render(){
    let rightWings = this.props.allPlayers.map((player) => {
      if (player.position === "RW"){
        let handleRightWingDraft = () => {
          this.props.handleRightWingDraft(player, 2);
        };
        return(
          < RightWings
            key = { player.id }
            name = { player.name }
            handleRightWingDraft = { handleRightWingDraft }
          />
        )
      }
    })
    return(
      <div>
        <h3>Please Select Two Right Wingers:</h3>
        {rightWings}
      </div>
    )
  }
}

export default RightWingsList;
