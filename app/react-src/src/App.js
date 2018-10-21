import React, { Component } from 'react';
import './App.css';
import { AppBar , Toolbar} from '@material-ui/core'
import MovieList from './MovieList';

class App extends Component {
  render() {
    return (
      <div className="App">
        <AppBar position="static" color="primary">
          <Toolbar>
            Nagara-Mi
          </Toolbar>
        </AppBar>
        <MovieList />
      </div>
    );
  }
}

export default App;
