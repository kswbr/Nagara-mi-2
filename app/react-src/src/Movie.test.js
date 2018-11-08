import React from 'react';
import ReactDOM from 'react-dom';
import {MovieWithWidth, Movie, styles} from './Movie';
import { shallow } from 'enzyme';
import { MuiThemeProvider, createMuiTheme } from '@material-ui/core/styles';
import renderer from 'react-test-renderer';
import CardActionArea from '@material-ui/core/CardActionArea';
import Modal from '@material-ui/core/Modal';

const feed = {
  url: 'https://testtest.jp/2018/11/post-275076.html',
  title: 'TestFeedTitle',
  site_id: 7,
  published: '2018-11-07T19:45:03.000Z',
  summary: '　TestSummary',
  searched: null,
  site: {
    id: 7,
    name: 'TestSite',
    url: 'http://testsite.example/atom.xml',
    site_type_id: 1,
    favicon_id: null,
  }
}

const theme = createMuiTheme({
  typography: {
    useNextVariants: true,
  },
});

const classes = {
  media: 'Movie-media-1',
  card: 'Movie-card-2',
  movie: 'Movie-movie-3',
  youtube: 'Movie-youtube-4'
}

it('renders without crashing', () => {
  const div = document.createElement('div');
  ReactDOM.render(
    <MuiThemeProvider theme={theme}>
      <MovieWithWidth feed={feed} image={"TestImage.jpg"} movie_id={"TestMovieId"} />
    </MuiThemeProvider>, div
  );
  ReactDOM.unmountComponentAtNode(div);
});


describe("モーダルが", () => {
  it('開くのを確認', () => {
    const movieProps = { currentPlayMovieId: 50, nextPlayMovieId: -1, currentFinishedId: -1 }
    const movie = shallow(
      <Movie width={"md"} movie={movieProps} classes={classes} feed={feed} image={"TestImage.jpg"} movie_id={"TestMovieId"} />
    );
    movie.find(CardActionArea).simulate("click")
    expect(movie.state().open).toBeTruthy()
    expect(movie.find(".modalTitle").length).toBe(1)
  });

  it('再生終了時に次のモーダルが開くのを確認', () => {
    const movieProps = { currentPlayMovieId: -1, nextPlayMovieId: 50, currentFinishedId: -1 }
    const actions = {
      playMovie: jest.fn()
    }
    const movie = shallow(
      <Movie id={50} width={"md"} movie={movieProps} actions={actions} classes={classes} feed={feed} image={"TestImage.jpg"} movie_id={"TestMovieId"} />
    );

    movie.find(CardActionArea).simulate("click")
    expect(movie.state().open).toBeTruthy()
    expect(actions.playMovie).toBeCalled()
  });

  it('再生終了時に前のモーダルが閉じるのを確認', () => {
    const movieProps = { currentPlayMovieId: -1, nextPlayMovieId: 52, currentFinishedId: 50 }
    const movie = shallow(
      <Movie id={50} width={"md"} movie={movieProps} classes={classes} feed={feed} image={"TestImage.jpg"} movie_id={"TestMovieId"} />
    );

    movie.find(CardActionArea).simulate("click")
    expect(movie.state().open).toBeFalsy()
  });
})

