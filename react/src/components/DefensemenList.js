/* jshint esversion:6*/
import React, { Component } from 'react';
import Defensemen from './Defensemen';

class DefensemenList extends Component {
  constructor(props) {
    super(props);
    this.state = {
      availablePlayers: []
    };
  }

  render(){
    let defensemen = this.props.allPlayers.map((player) => {
      if (player.position === "D"){
        let handleDefenseDraft = () => {
          this.props.handleDefenseDraft(player, 4);
        };
        return(
          < Defensemen
            key = { player.id }
            name = { player.name }
            handleDefenseDraft = { handleDefenseDraft }
          />
        )
      }
    })
    return(
      <div>
        <h3>Please Select Four Defensemen:</h3>
        {defensemen}
      </div>
    )
  }
}

export default DefensemenList;
