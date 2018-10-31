import React, { Component } from 'react';
import PropTypes from 'prop-types';
import { withStyles } from '@material-ui/core/styles';
import Card from '@material-ui/core/Card';
import CardActionArea from '@material-ui/core/CardActionArea';
import CardContent from '@material-ui/core/CardContent';
import CardMedia from '@material-ui/core/CardMedia';
import Typography from '@material-ui/core/Typography';
import Modal from '@material-ui/core/Modal';
import Youtube from 'react-youtube';
import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';
import * as actions from './actions';
import withWidth, { isWidthUp } from '@material-ui/core/withWidth';

const styles = theme => ({
  media: {
    height: 200,
  },
  card: {
    margin: theme.spacing.unit * 2,
    textAlign: 'center',
    color: theme.palette.text.secondary,
  },
  movie: {
    position: 'absolute',
    width: 0,
    height: 0,
    [theme.breakpoints.up('md')]: {
      width: theme.spacing.unit * 100,
      height: theme.spacing.unit * 56,
      padding: theme.spacing.unit * 4,
    },
    left: '50%',
    top: '50%',
    transform: 'translate(-50%, -50%)',
    backgroundColor: theme.palette.background.paper,
    boxShadow: theme.shadows[5],
  },
  youtube: {
    position: 'absolute',
    left: '50%',
    top: '50%',
    transform: 'translate(-50%, -50%)',
    marginTop:"20px",
    width: 360,
    height: 200,

    [theme.breakpoints.up('sm')]: {
      width: 512,
      height: 288,
    },

    [theme.breakpoints.up('md')]: {
      width: 640,
      height: 360,
    },

  }
});


class Movie extends Component {
  state = {
    open: false,
  };
  handleOpen = () => {
    this.setState({ open: true });
  };

  handleClose = () => {
    this.setState({ open: false });
  };

  handleStateChange = (event) => {
    if (event.data === 0) {
      this.props.actions.finishPlayMovie(this.props.id)
    }
    if (event.data === 1) {
      this.props.actions.playMovie(this.props.id)
    }
  };

  componentDidUpdate(prevProps, prevState, snapshot) {
    const {nextPlayMovieId, currentPlayMovieId, currentFinishedId} = this.props.movie

    if (currentPlayMovieId === -1 && nextPlayMovieId !== -1){
      if (this.props.id === nextPlayMovieId) {
        this.props.actions.playMovie(nextPlayMovieId)
        this.handleOpen()
      }

      if (this.props.id === currentFinishedId) {
        this.handleClose()
      }
    }
    return true
  }

  render() {
    const { classes, image, title , feed, movie_id} = this.props;
    const { site } = feed;
    const youtubeOpts = { playerVars: { autoplay: 1 } }

    const movieTitle = (title) => {
      if (isWidthUp('md', this.props.width)) {
        return (
          <Typography variant="subtitle1" id="modal-title">
            {title}
          </Typography>
        )
      }
    }

    return (
      <div>
        <Card className={classes.card}>
          <CardActionArea onClick={this.handleOpen}>
            <CardMedia
              className={classes.media}
              image={image}
              title={title}
            />
            <CardContent>
              <Typography gutterBottom variant="caption" component="h3">
                {title}
              </Typography>
              <Typography gutterBottom variant="caption" component="h3">
                {site.name}
              </Typography>
            </CardContent>
          </CardActionArea>
        </Card>
        <Modal
            aria-labelledby="simple-modal-title"
            aria-describedby="simple-modal-description"
            open={this.state.open}
            onClose={this.handleClose}
          >
            <div className={classes.movie}>
             {movieTitle(title)}
             <Youtube
                opts={youtubeOpts}
                videoId={movie_id}
                className={classes.youtube}
                onStateChange={this.handleStateChange}
              />
            </div>
          </Modal>
      </div>
    );
  }
}

Movie.propTypes = {
  classes: PropTypes.object.isRequired,
};

const mapStateToProps = (state, ownProps) => ({
  movie: state.movie,
})

function mapDispatchToProps(dispatch) {
  return {
    actions: bindActionCreators(actions, dispatch),
  }
}

const MovieWithStyles = withStyles(styles)(Movie)
const MovieWithWidth = withWidth()(MovieWithStyles)
export default connect(mapStateToProps, mapDispatchToProps)(MovieWithWidth);

