import * as actionTypes from '../actionTypes'

const initialAppState = {
  inRequest: false,
  movies: []
}

const movie = (state = initialAppState, action) => {
  if (action.type === actionTypes.START_MOVIE_REQUEST) {
    return {
      ...state,
      inRequest: true,
    }
  } else if (action.type === actionTypes.END_MOVIE_REQUEST) {
    return {
      ...state,
      inRequest: false,
    }
  } else if (action.type === actionTypes.FETCH_MOVIES) {
    const movies = Object.assign({}, state.movies, action.movies)
    return {
      ...state,
      movies
    }
  } else {
    return state;
  }
}

export default movie
