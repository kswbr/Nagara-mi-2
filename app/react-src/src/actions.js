import axios from 'axios';
import * as actionTypes from './actionTypes';

const startRequest = () => ({
  type: actionTypes.START_REQUEST,
});

const endRequest = () => ({
  type: actionTypes.END_REQUEST,
});

const fetchMovies = (movies) => ({
  type: actionTypes.FETCH_MOVIES,
  movies
});

const incrementPage = () => ({
  type: actionTypes.INCREMENT_PAGE,
})

const finishFetchMovies = () => ({
  type: actionTypes.FINISH_FETCH_MOVIES,
})

export const finishPlayMovie = (id) => ({
  type: actionTypes.FINISH_PLAY_MOVIE,
  id
})

export const playMovie = (id) => ({
  type: actionTypes.PLAY_MOVIE,
  id
})


export const requestMovies = () => {
  return (dispatch, getState) => {
    const state = getState()
    if (state.root.inRequest) {
      return
    }

    if (state.movie.finish) {
      return
    }

    dispatch(startRequest());
    const page = state.root.page
    axios.get('/api/movies',{params: {page}}).then((result) => {
      if (result.data.length === 0) {
        dispatch(finishFetchMovies());
        dispatch(endRequest());
        return
      }
      dispatch(fetchMovies(result.data));
      dispatch(incrementPage());
      dispatch(endRequest());
    })
  };
}


