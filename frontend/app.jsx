import React from 'react';
import ReactDOM from 'react-dom';

import Wrapper from './components/wrapper';

class App extends React.Component {
  render() {
    return (
      <Wrapper />
    )
  }
}

ReactDOM.render(<App />, document.getElementById('root'));
