import React, { Component } from 'react';
import './App.css';
import Header from './Header';
import MovieList from './MovieList';

class App extends Component {
  render() {
    return (
      <div className="App">
        <Header />
        <div style={{marginTop:"80px"}}>
          <MovieList />
        </div>
      </div>
    );
  }
}

export default App;
