import * as actionTypes from '../actionTypes'

const initialAppState = {
  movies: [],
  finish: false,
  currentFinishedId: -1,
  nextPlayMovieId: -1,
  currentPlayMovieId: -1
}

const movie = (state = initialAppState, action) => {
  if (action.type === actionTypes.FETCH_MOVIES) {
    const movies = state.movies.concat(action.movies)
    return {
      ...state,
      movies
    }
  } else if (action.type === actionTypes.FINISH_FETCH_MOVIES) {
    return {
      ...state,
      finish: true
    }
  } else if (action.type === actionTypes.PLAY_MOVIE) {
    return {
      ...state,
      currentPlayMovieId: action.id,
      nextPlayMovieId: -1
    }
  } else if (action.type === actionTypes.FINISH_PLAY_MOVIE) {
    const movies = state.movies;
    let nextPlayMovieId = state.nextPlayMovieId
    movies.forEach((movie,i) => {
      if (movie.id === action.id && movies[i + 1]) {
        nextPlayMovieId = movies[i + 1].id
      }
    })
    return {
      ...state,
      currentPlayMovieId: -1,
      currentFinishedId: action.id,
      nextPlayMovieId
    }
  } else {
    return state;
  }
}

export default movie
