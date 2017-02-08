/*jshint esversion: 6*/

import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import TeamList from './components/TeamList';

$(function() {
  ReactDOM.render(
    <TeamList/>,
    document.getElementById('draft')
  );
});
