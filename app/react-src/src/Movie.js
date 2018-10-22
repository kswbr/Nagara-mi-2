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
    width: theme.spacing.unit * 100,
    height: theme.spacing.unit * 56,
    left: '50%',
    top: '50%',
    transform: 'translate(-50%, -50%)',
    backgroundColor: theme.palette.background.paper,
    boxShadow: theme.shadows[5],
    padding: theme.spacing.unit * 4,
  },
  youtube: {
    position: 'absolute',
    left: '50%',
    top: '50%',
    transform: 'translate(-50%, -50%)',
    marginTop:"20px",
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

  render() {
    const { classes, image, title , feed, movie_id} = this.props;
    const { site } = feed;
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
              <Typography variant="subtitle1" id="modal-title">
                {title}
              </Typography>
              <Youtube
                videoId={movie_id}
                className={classes.youtube}
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

export default withStyles(styles)(Movie);

