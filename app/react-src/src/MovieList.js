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
    const data = JSON.parse('{"id":18,"title":"アユニ・D（BiSH）が語る、ソロプロジェクト PEDROで見つけた“自分をさらけ出せる場所”","url":"//www.youtube.com/embed/bhLMdKYSlbU","feed_id":52,"movie_type_id":null,"image":"https://i.ytimg.com/vi/bhLMdKYSlbU/hqdefault.jpg","publish":true,"movie_id":"bhLMdKYSlbU","play_time":207,"site_type_id":null,"created_at":"2018-10-20T08:10:44.172Z","updated_at":"2018-10-20T08:10:44.172Z","feed":{"id":52,"url":"https://realsound.jp/2018/10/post-266357.html","title":"アユニ・D（BiSH）が語る、ソロプロジェクト PEDROで見つけた“自分をさらけ出せる場所”","site_id":7,"published":"2018-10-20T13:00:03.000Z","summary":"　バンド形態のソロプロジェクト・PEDROとしてデビューを果たしたBiSHのアユニ・D。ギターには田渕ひさ子を迎え、先日には初ライブ『PEDRO first live “happy jam jam psycho”』も開催","searched":null,"created_at":"2018-10-20T08:10:43.839Z","updated_at":"2018-10-20T08:10:43.839Z","site":{"id":7,"name":"realsound","url":"http://realsound.jp/atom.xml","site_type_id":1,"favicon_id":null,"created_at":"2018-10-20T08:07:54.953Z","updated_at":"2018-10-20T08:07:54.953Z"}}}')
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
