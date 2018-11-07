import React from 'react';
import ReactDOM from 'react-dom';
import {MovieWithWidth} from './Movie';
import { shallow } from 'enzyme';
import { MuiThemeProvider, createMuiTheme } from '@material-ui/core/styles';

it('renders without crashing', () => {

  const div = document.createElement('div');
  const feed = {
    id: 52,
    url: 'https://testtest.jp/2018/11/post-275076.html',
    title: 'TestFeedTitle',
    site_id: 7,
    published: '2018-11-07T19:45:03.000Z',
    summary: '　TestSummary',
    searched: null,
    created_at: '2018-11-07T20:47:27.210Z',
    updated_at: '2018-11-07T20:47:27.210Z',
    site: {
      id: 7,
      name: 'TestSite',
      url: 'http://testsite.example/atom.xml',
      site_type_id: 1,
      favicon_id: null,
      created_at: '2018-11-07T20:46:04.341Z',
      updated_at: '2018-11-07T20:46:04.341Z'
    }
  }
  const theme = createMuiTheme({
    typography: {
      useNextVariants: true,
    },
  });
  ReactDOM.render(
    <MuiThemeProvider theme={theme}>
      <MovieWithWidth feed={feed} image={"TestImage.jpg"} movie_id={"TestMovieId"} />
    </MuiThemeProvider>, div
  );
  ReactDOM.unmountComponentAtNode(div);
});
