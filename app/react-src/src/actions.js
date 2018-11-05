import axios from 'axios';
import * as actionTypes from './actionTypes';

const startRequest = () => ({
  type: actionTypes.START_REQUEST,
});

const endRequest = () => ({
  type: actionTypes.END_REQUEST,
});

const fetchMovies = (movies,reset = false) => ({
  type: actionTypes.FETCH_MOVIES,
  movies,
  reset
});

const fetchSites = (sites) => ({
  type: actionTypes.FETCH_SITES,
  sites
});

const setFilterSiteId = (id) => ({
  type: actionTypes.SET_FILTER_SITE_ID,
  id
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

    let params = {page}

    if (state.movie.filterSiteId) {
      params.site = state.movie.filterSiteId
    }

    axios.get('/api/movies',{params} ).then((result) => {
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

export const filterMoviesBySite = (site) => {
  return (dispatch, getState) => {
    const state = getState()
    if (state.root.inRequest) {
      return
    }

    dispatch(startRequest());
    dispatch(setFilterSiteId(site));
    axios.get('/api/movies',{params: {site}}).then((result) => {
      dispatch(incrementPage());
      dispatch(fetchMovies(result.data,true));
      dispatch(endRequest());
    })
  };

};


export const requestSites = () => {
  return (dispatch, getState) => {
    const state = getState()
    if (state.root.inRequest) {
      return
    }

    axios.get('/api/sites').then((result) => {
      dispatch(fetchSites(result.data));
    })
  };
}


