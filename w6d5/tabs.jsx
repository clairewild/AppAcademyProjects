import React from 'react';

class Tabs extends React.Component {
  constructor(props) {
    super(props);
    // this.state { index: 0, title: "", content: "" }
    this.state = {
      tabs: props.tabs,
      index: 0
    };
    this.updateIndex = this.updateIndex.bind(this);
  }

  updateIndex(index) {
    this.setState({ index });
  }

  render() {
    let tabs = [];
    this.state.tabs.forEach((t, idx) => {
      if (idx === this.state.index) {
        tabs.push(
          <li key={idx} className={"selected"}>
            <h1 onClick={this.updateIndex.bind(this, idx)}>{t.title}</h1>
          </li>
        );
      }
      else {
        tabs.push(
          <li key={idx}>
            <h1 onClick={this.updateIndex.bind(this, idx)}>{t.title}</h1>
          </li>
        );
      }
    });

    return (
      <div className={"tabs-div"}>
        <ul className={"tabs-ul"}>
          {tabs}
        </ul>
        <article className={"tab-content"}>{this.state.tabs[this.state.index].content}</article>
      </div>
    );
  }
}

export default Tabs;
