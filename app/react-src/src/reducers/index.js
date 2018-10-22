import * as actionTypes from '../actionTypes'
import { combineReducers } from 'redux';
import movie from './movie';

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
});

export default reducer;
