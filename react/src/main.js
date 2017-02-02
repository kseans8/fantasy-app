/*jshint esversion: 6*/

import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import TeamList from './components/TeamList';
import UserList from './components/UserList';
import PlayerList from './components/PlayerList';
import LeagueList from './components/LeagueList';

$(function() {
  if (document.getElementById('leagues')) {
    ReactDOM.render(
      <LeagueList/>,
      document.getElementById('leagues')
    );
  }

  if (document.getElementById('players')) {
    ReactDOM.render(
      <PlayerList/>,
      document.getElementById('players')
    );
  }

  if (document.getElementById('users')) {
    ReactDOM.render(
      <UserList/>,
      document.getElementById('users')
    );
  }

  if (document.getElementById('teams')) {
    ReactDOM.render(
      <TeamList/>,
      document.getElementById('teams')
    );
  }


});
