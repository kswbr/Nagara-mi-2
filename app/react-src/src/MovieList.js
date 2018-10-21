import React, { Component } from 'react';
import Grid from '@material-ui/core/Grid';
import { withStyles } from '@material-ui/core/styles';
import Movie from './Movie';

const styles = theme => ({
  root: {
    flexGrow: 1,
  },
});

class MovieList extends Component {

  state = {
    open: false,
  };


  render() {
    const { classes } = this.props;
    const data = JSON.parse('{"id":18,"title":"アユニ・D（BiSH）が語る、ソロプロジェクト PEDROで見つけた“自分をさらけ出せる場所”","url":"//www.youtube.com/embed/bhLMdKYSlbU","feed_id":52,"movie_type_id":null,"image":"https://i.ytimg.com/vi/bhLMdKYSlbU/hqdefault.jpg","publish":true,"movie_id":"bhLMdKYSlbU","play_time":207,"site_id":null,"site_type_id":null,"created_at":"2018-10-20T08:10:44.172Z","updated_at":"2018-10-20T08:10:44.172Z"}')
    const movies = Array(20).fill(data)
    const MovieCell = (props) => {
      return (
        <Grid item xs={12} sm={6} lg={3}>
          <Movie {...props} />
        </Grid>
      )
    }
    let movieList =[]
    for (let i in movies ){
      movieList.push(MovieCell(movies[i]))
    }

    return (
      <div className="MovieList">
        <Grid container className={classes.content} spacing={0}>
          {movieList}
        </Grid>
      </div>
    );
  }
}

export default withStyles(styles)(MovieList);
