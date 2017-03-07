import React from 'react';
import ReactDOM from 'react-dom';
import { uniqueId } from '../../util/util.js';

class TodoForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      id: 0,
      title: "",
      body: "",
      done: false
    };

    this.submitForm = this.submitForm.bind(this);
    this.setAttribute = this.setAttribute.bind(this);
  }

  submitForm(e) {
    e.preventDefault();
    this.setState({ id: uniqueId() }, () => {
      this.props.receiveTodo(this.state);
      this.setState({ title: "", body: "" });
    });
  }

  setAttribute(attribute) {
    return (e) => {
      this.setState({ [attribute]: e.target.value });
    };
  }

  render() {
    return (
      <form>
        <label>Title<input onChange={ this.setAttribute("title") } type="text" value={ this.state.title }></input></label><br></br>
        <label>Body<input onChange={ this.setAttribute("body") } type="text" value={ this.state.body }></input></label><br></br>
        <label>Status</label><br></br>
          <label>Done<input onClick={ this.setAttribute("done") } type="radio" name="done" value="true"></input></label><br></br>
          <label>Undone<input onClick={ this.setAttribute("done") } type="radio" name="done" value="false"></input></label><br></br>
        <input onClick={ this.submitForm } type="submit" value="Submit Todo Item"></input>
      </form>
    );
  }
}

export default TodoForm;
