import React, { Component } from 'react';
import './App.css';
import { AppBar , Toolbar} from '@material-ui/core'
import IconButton from '@material-ui/core/IconButton';
import FilterList from '@material-ui/icons/FilterList';
import MenuItem from '@material-ui/core/MenuItem';
import Menu from '@material-ui/core/Menu';
import Typography from '@material-ui/core/Typography';
import { withStyles } from '@material-ui/core/styles';
import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';
import * as actions from './actions';


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

  constructor(props) {
    super(props)
    this.handleClick = this.handleClick.bind(this)
  }


  handleMenu = event => {
    this.setState({ anchorEl: event.currentTarget });
  };

  handleClose = () => {
    this.setState({ anchorEl: false });
  };

  handleClick = (id) => {
    const {filterMoviesBySite} = this.props.actions
    filterMoviesBySite(id)
  };

  componentDidMount() {
    const {requestSites} = this.props.actions
    requestSites()
  };

  render() {
	  const { classes } = this.props;
    const { anchorEl } = this.state;
    const open = Boolean(anchorEl);
    const {sites} = this.props.site

    const SiteFilter = (props) => {
      const id = props.id
      return (
        <MenuItem key={id} onClick={this.handleClick.bind(this,id)} >{props.name}</MenuItem>
      )
    }
    const siteList = []
    siteList.push(SiteFilter({id: -1, name:"All Sites"}))
    sites.forEach(site => {
      siteList.push(SiteFilter(site))
    })
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
            {siteList}
           </Menu>
          </div>
        </Toolbar>
      </AppBar>
    );
  }
}

const mapStateToProps = (state, ownProps) => ({
  site: state.site,
})

function mapDispatchToProps(dispatch) {
  return {
    actions: bindActionCreators(actions, dispatch),
  }
}

const HeaderWithStyles = withStyles(styles)(Header)
export default connect(mapStateToProps, mapDispatchToProps)(HeaderWithStyles);
