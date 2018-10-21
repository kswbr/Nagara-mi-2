import axios from 'axios';
import * as actionTypes from './actionTypes';

const startMoiveRequest = () => ({
  type: actionTypes.START_MOVIE_REQUEST,
});

const endMoiveRequest = () => ({
  type: actionTypes.END_MOVIE_REQUEST,
});

const fetchMovies = (movies) => ({
  type: actionTypes.FETCH_MOVIES,
  movies
});


export const requestMovies = (page = 0) => {
  return dispatch => {
    dispatch(startMoiveRequest());
    axios.get('/api/movies',{page}).then((result) => {
      dispatch(fetchMovies(result.data));
      dispatch(endMoiveRequest());
    })
  };
}
