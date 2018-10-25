import React, { Component } from 'react';
import './App.css';
import { AppBar , Toolbar} from '@material-ui/core'

import IconButton from '@material-ui/core/IconButton';
import MenuIcon from '@material-ui/icons/Menu';
import FilterList from '@material-ui/icons/FilterList';
import FormControlLabel from '@material-ui/core/FormControlLabel';
import FormGroup from '@material-ui/core/FormGroup';
import MenuItem from '@material-ui/core/MenuItem';
import Menu from '@material-ui/core/Menu';
import Typography from '@material-ui/core/Typography';
import { withStyles } from '@material-ui/core/styles';


const styles = {
  root: {
    flexGrow: 1,
  },
  grow: {
    flexGrow: 1,
		textAlign:"left"
  },
  menuButton: {
    marginLeft: -12,
    marginRight: 20,
  },
};



class Header extends Component {
  state = {
    anchorEl: null,
  };

  handleMenu = event => {
    this.setState({ anchorEl: event.currentTarget });
  };

  handleClose = () => {
    this.setState({ anchorEl: false });
  };


  render() {
	  const { classes } = this.props;
    const { anchorEl } = this.state;
    const open = Boolean(anchorEl);
    return (
      <AppBar position="fixed" color="primary">
        <Toolbar >
          <Typography variant="h6" color="inherit" className={classes.grow}>
            Nagara-Mi
          </Typography>
         <div>
           <IconButton
             aria-owns={open ? 'menu-appbar' : null}
             aria-haspopup="true"
             onClick={this.handleMenu}
             color="inherit"
           >
             <FilterList />
           </IconButton>
           <Menu
             id="menu-appbar"
						 anchorEl={anchorEl}
             anchorOrigin={{
							 top:0,
               vertical: 'top',
               horizontal: 'right',
             }}
             transformOrigin={{
							 top:0,
               vertical: 'top',
               horizontal: 'right',
             }}
             open={open}
             onClose={this.handleClose}
           >
             <MenuItem onClick={this.handleClose}>Profile</MenuItem>
             <MenuItem onClick={this.handleClose}>My account</MenuItem>
           </Menu>
          </div>
        </Toolbar>
      </AppBar>
    );
  }
}

export default withStyles(styles)(Header);
