import React from 'react';

class Wrapper extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      contentHeight: null
    }
  }
  updateDimensions() {
    this.setState({contentHeight: {height: (window.innerHeight - 60) + 'px'}});
  }

  componentDidMount() {
    this.updateDimensions();
    window.addEventListener("resize", this.updateDimensions.bind(this));
  }

  render() {
    return (
      <div className='wrapper' ref='wrapper'>
        <div className='left-pane'>
          <div className='search-panel'>
            <input type='text' className='search' />
            <img src="assets/search-icon.png" className="search-icon"></img>
            <div className='search-icon'></div>
          </div>
          <div className='list-panel' style={this.state.contentHeight}></div>
        </div>
        <div className='right-pane'>
          <div className='nav-panel'>
            <img src="assets/trash-icon.png" className='trash-icon'>
            </img>
            <div className='user-menu'>
              <span className='user-name'>
                Tim
              </span>
              <span className='user-menu__menu-icon'>
                <i className="fa fa-caret-down fa-2" aria-hidden="true"></i>
              </span>
            </div>
          </div>
          <div className='content-panel' style={this.state.contentHeight}></div>
        </div>
      </div>
    )
  }
}

export default Wrapper;
