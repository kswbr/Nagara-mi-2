import * as actionTypes from '../actionTypes'
import { combineReducers } from 'redux';
import movie from './movie';
import site from './site';

const initialAppState = {
  page: 0,
  inRequest: false,
}

const root = (state = initialAppState, action) => {
  if (action.type === actionTypes.INCREMENT_PAGE) {
    const newPage = state.page + 1
    return {
      ...state,
      page: newPage,
    }

  } else if (action.type === actionTypes.SET_FILTER_SITE_ID) {
    return {
      ...state,
      page: 0,
    }
  } else if (action.type === actionTypes.START_REQUEST) {
    return {
      ...state,
      inRequest: true,
    }
  } else if (action.type === actionTypes.END_REQUEST) {
    return {
      ...state,
      inRequest: false,
    }
  } else {
    return state;
  }
}

const reducer = combineReducers({
  root,
  movie,
  site,
});

export default reducer;
