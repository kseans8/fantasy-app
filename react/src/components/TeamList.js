/* jshint esversion:6*/
import React, { Component }  from 'react';
import MyTeam from './MyTeam';
import LeftWingsList from './LeftWingsList';
import CentersList from './CentersList';
import RightWingsList from './RightWingsList';
import DefensemenList from './DefensemenList';


class TeamList extends Component {
  constructor(props) {
    super(props);
    this.state = {
      leftWings: [],
      leftWingsDrafted: false,
      centers: [],
      centersDrafted: false,
      rightWings: [],
      rightWingsDrafted: false,
      defensemen: [],
      defensemenDrafted: false,
      allPlayers: [],
      team: [],
      teamId: null
    };

    this.handleLeftWingDraft = this.handleLeftWingDraft.bind(this);
    this.handleCenterDraft = this.handleCenterDraft.bind(this);
    this.handleRightWingDraft = this.handleRightWingDraft.bind(this);
    this.handleDefenseDraft = this.handleDefenseDraft.bind(this);

    this.addPositionToTeam = this.addPositionToTeam.bind(this);
  }

  handleLeftWingDraft(player, size) {
    let array = this.state.leftWings;
    if (array.length < size) {
      array.push(player);
      this.setState({
        leftWings: array
      });
    }
    if (this.state.leftWings.length === size && !this.state.leftWingsDrafted) {
      this.setState({
        leftWingsDrafted: true
      })
      this.addPositionToTeam(this.state.leftWings);
    }
  }

  handleRightWingDraft(player, size) {
    let array = this.state.rightWings;
    if (array.length < size) {
      array.push(player);
      this.setState({
        rightWings: array
      });
    }

    if (this.state.rightWings.length === size && !this.state.rightWingsDrafted) {
      this.setState({
        rightWingsDrafted: true
      })
      this.addPositionToTeam(this.state.rightWings);
    }
  }

  handleCenterDraft(player, size) {
    let array = this.state.centers;
    if (array.length < size) {
      array.push(player);
      this.setState({
        centers: array
      });
    }

    if (this.state.centers.length === size && !this.state.centersDrafted) {
      this.setState({
        centersDrafted: true
      })
      this.addPositionToTeam(this.state.centers);
    }
  }

  handleDefenseDraft(player, size) {
    let array = this.state.defensemen;
    if (array.length < size) {
      array.push(player);
      this.setState({
        defensemen: array
      });
    }

    if (this.state.defensemen.length === size && !this.state.defensemenDrafted) {
      this.setState({
        defensemenDrafted: true
      })
      this.addPositionToTeam(this.state.defensemen);
    }
  }

  addPositionToTeam(positionArray) {
    let teamArray = this.state.team;
    if (teamArray.length <= 10) {
      positionArray.map((player) => {
        teamArray.push(player);
        this.setState({
          team: teamArray
        });
      });
    }
    if (this.state.team.length === 10) {
      this.state.team.map((player) => {
        let data = {
          player_id: player.id,
          team_id: this.state.teamId
        }
        let jsonStringData = JSON.stringify(data);

        fetch(`/api/v1/team_players`, {
          credentials: 'same-origin',
          method: 'post',
          headers: { 'Content-Type': 'application/json' },
          body: jsonStringData
        })
        .then(response => {
          if (response.ok) {
            return response;
          } else {
            let errorMessage = `${response.status} (${response.statusText})`,
            error = new Error(errorMessage);
            throw(error);
          }
        })
        .catch(error => console.error(`Error in fetch: ${error.message}`));
      })
    }

  }

  componentDidMount() {
    let newTeamId = parseInt($('.team-id').first().attr("id"));
    fetch('/api/v1/players', {
      credentials: 'same-origin'
    })
    .then(response => {
      if (response.ok) {
        return response;
      } else {
        let errorMessage = `${response.status}, (${response.statusText})`;
        let error = new Error(errorMessage);
        throw(error);
      }
    })
    .then(response => response.json())
    .then(body => {
      let players = body.players;
      this.setState({
        allPlayers: players,
        teamId: newTeamId
      });
    });
  }

  render() {

    return(
      <div>
        < MyTeam
          team={ this.state.team }
        />
        < LeftWingsList
          allPlayers={ this.state.allPlayers }
          leftWings={ this.state.leftWings }
          handleLeftWingDraft={this.handleLeftWingDraft}
        />
        < CentersList
          allPlayers={ this.state.allPlayers }
          centers={ this.state.centers }
          handleCenterDraft={this.handleCenterDraft}
        />
        < RightWingsList
          allPlayers={ this.state.allPlayers }
          rightWings={ this.state.rightWings }
          handleRightWingDraft={this.handleRightWingDraft}
        />
        < DefensemenList
          allPlayers={ this.state.allPlayers }
          defensemen={ this.state.defensemen }
          handleDefenseDraft={this.handleDefenseDraft}
        />
      </div>
    )
  }
}

export default TeamList;
