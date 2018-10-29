import React, { Component } from 'react';
import Grid from '@material-ui/core/Grid';
import { withStyles } from '@material-ui/core/styles';
import Movie from './Movie';
import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';
import * as actions from './actions';
import InfiniteScroll from 'react-infinite-scroller';
import Fade from '@material-ui/core/Fade';

const styles = theme => ({
  root: {
    flexGrow: 1,
  },
});

class MovieList extends Component {

  state = {
    open: false,
    currentPlayMovieId: -1,
  };

  componentDidMount() {
    const {requestMovies} = this.props.actions
    requestMovies()
  }

  render() {
    const { classes, movie} = this.props;
    const {requestMovies} = this.props.actions
    const movies = movie.movies

    const MovieCell = (props) => {
      return (
        <Fade in={true} timeout={500}>
          <Grid item key={props.id} xs={12} sm={6} lg={3}>
            <Movie {...props} />
          </Grid>
        </Fade>
      )
    }
    let movieList =[]
    for (let i in movies ){
      movieList.push(MovieCell(movies[i]))
    }

    return (
      <InfiniteScroll
          pageStart={0}
          loadMore={requestMovies}
          hasMore={!movie.finish}
          >
          <div className="MovieList">
            <Grid container className={classes.content} spacing={0}>
              {movieList}
            </Grid>
          </div>
      </InfiniteScroll>
    );
  }
}

const mapStateToProps = (state, ownProps) => ({
  movie: state.movie,
})

function mapDispatchToProps(dispatch) {
  return {
    actions: bindActionCreators(actions, dispatch),
  }
}

const MovieListWithStyles = withStyles(styles)(MovieList)
export default connect(mapStateToProps, mapDispatchToProps)(MovieListWithStyles);
