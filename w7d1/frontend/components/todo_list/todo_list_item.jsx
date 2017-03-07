import React from 'react';
import TodoDetailView from './todo_detail_view_container.jsx';

class TodoListItem extends React.Component {
  constructor({ idx, todo }) {
    super(idx, todo);
    this.todo = todo;
    this.state = {
      done: todo.done,
      detail: false
    };
  }

  updateTodo(e) {
    if (this.state.done) {
      this.setState({ done: false });
    }
    else {
      this.setState({ done: true });
    }
  }

  printStatus() {
    return (this.state.done) ? "Undo" : "Done";
  }

  display() {
    (this.state.detail) ? this.setState({ detail: false }) : this.setState({ detail: true });
  }

  checkDetail() {
    if (this.state.detail) {
      return (
        <TodoDetailView todo={ this.todo } />
      );
    }
  }

  render() {
    return (
      <li>
        <h2 onClick={this.display.bind(this) }>{ this.todo.title }</h2>
        <button onClick={ this.updateTodo.bind(this) }>{ this.printStatus() }</button>
        { this.checkDetail() }
      </li>
    );
  }
}

export default TodoListItem;
