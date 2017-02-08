/* jshint esversion:6*/
import React, { Component } from 'react';
import MyPlayer from './MyPlayer';

class MyTeam extends Component {
  constructor(props) {
    super(props);
    this.state = {};
  }

  render(){
      let players = this.props.team.map((player) => {
        return(
          < MyPlayer
            key = { player.id }
            name = { player.name }
          />
        );
      });
    return(
      <div>
        <h2>My Team</h2>
        {players}
      </div>
    )
  }
}

export default MyTeam;
