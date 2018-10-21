import React, { Component } from 'react';
import Paper from '@material-ui/core/Paper';
import Grid from '@material-ui/core/Grid';
import { withStyles } from '@material-ui/core/styles';

const styles = theme => ({
  root: {
    flexGrow: 1,
  },
  paper: {
    margin: theme.spacing.unit * 2,
    padding: theme.spacing.unit * 2,
    textAlign: 'center',
    color: theme.palette.text.secondary,
  },
});

class MainVisual extends Component {
  render() {
    const { classes } = this.props;
    console.log(classes)
    return (
      <div className="MainVisual">
        <Grid container spacing={24}>
          <Grid item xs={12}>
            <Paper className={classes.paper} >MainVisual</Paper>
          </Grid>
        </Grid>
      </div>
    );
  }
}

export default withStyles(styles)(MainVisual);
