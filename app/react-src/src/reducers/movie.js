import * as actionTypes from '../actionTypes'

const initialAppState = {
  movies: [],
  finish: false
}

const movie = (state = initialAppState, action) => {
  if (action.type === actionTypes.FETCH_MOVIES) {
    const movies = state.movies.concat(action.movies)
    return {
      ...state,
      movies
    }
  } else if (action.type === actionTypes.FINISH_FETCH_MOVIES) {
    console.log({
      ...state,
      finish: true
    })
    return {
      ...state,
      finish: true
    }
  } else {
    return state;
  }
}

export default movie
