import React from 'react';
import Tabs from './tabs';
import Clock from './clock';

const tabs = [
  {
    title: "One",
    content: "Just saying hi"
  },
  {
    title: "Two",
    content: "Au revoir"
  },
  {
    title: "Three",
    content: "Bonjour"
  }];

class Root extends React.Component{
  render() {
    return (
      <div>
        <Tabs tabs={tabs} />
        <Clock />
      </div>
    );
  }
}

export default Root;
