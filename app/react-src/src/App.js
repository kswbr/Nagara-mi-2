import React, { Component } from 'react';
import './App.css';
import Header from './Header';
import MovieList from './MovieList';
import { MuiThemeProvider, createMuiTheme } from '@material-ui/core/styles';

const theme = createMuiTheme({
  typography: {
    useNextVariants: true,
  },
});

export class App extends Component {
  render() {
    return (
    <MuiThemeProvider theme={theme}>
      <div className="App">
        <Header />
        <div style={{marginTop:"80px"}}>
          <MovieList />
        </div>
      </div>
    </MuiThemeProvider>
    );
  }
}

export default App;
