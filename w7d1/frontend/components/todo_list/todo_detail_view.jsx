import React from 'react';

class TodoDetailView extends React.Component {

  constructor(props) {
    super(props);
  }

  delete(e) {
    this.props.removeTodo(this.props.todo);
  }

  render() {
    return(
      <div>
        <p>{ this.props.todo.body }</p>
        <p>{ (this.props.todo.done) ? "Done" : "Undone" }</p>
        <button onClick={ this.delete.bind(this) }>Delete</button>
      </div>
    );
  }
}

export default TodoDetailView;
