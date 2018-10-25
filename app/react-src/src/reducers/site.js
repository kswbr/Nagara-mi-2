import * as actionTypes from '../actionTypes'

const initialAppState = {
  sites: [],
  currentSiteId: -1
}

const site = (state = initialAppState, action) => {
  if (action.type === actionTypes.FETCH_SITES) {
    return {
      ...state,
      sites: action.sites
    }
  } else {
    return state;
  }
}

export default site
