import React from 'react';

class Clock extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      time: new Date()
    };
  }

  updateTime() {
    this.state.time = new Date();
  }

  componentDidMount() {
    this.handle = window.setInterval(this.updateTime, 1000);
  }

  componentWillUnmount() {
    window.clearInterval(this.handle);
  }

  render() {
    let time = this.state.time.toDateString();
    return (
      <div>
        <time>{time}</time>
      </div>
    );
  }
}

export default Clock;
