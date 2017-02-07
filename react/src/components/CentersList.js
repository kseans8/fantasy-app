/* jshint esversion:6*/
import React, { Component } from 'react';
import Centers from './Centers';

class CentersList extends Component {
  constructor(props) {
    super(props);
    this.state = {
      availablePlayers: []
    };
  }

  render(){
    let centers = this.props.allPlayers.map((player) => {
      if (player.position === "C"){
        let handleCenterDraft = () => {
          this.props.handleCenterDraft(player, 2);
        };
        return(
          < Centers
            key = { player.id }
            name = { player.name }
            handleCenterDraft = { handleCenterDraft }
          />
        )
      }
    })
    return(
      <div>
        <h3>Please Select Two Centers:</h3>
        {centers}
      </div>
    )
  }
}

export default CentersList;
