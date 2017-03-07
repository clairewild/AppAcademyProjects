import React from 'react';
import TodoListItem from './todo_list_item.jsx';
import TodoForm from './todo_form.jsx';

const TodoList = ({ todos, receiveTodo }) => {

  let arr = todos.map((el) => (
    <TodoListItem key={ el.id } todo={ el }/>
  ));

  return (
    <div>
      <ul>
        { arr }
      </ul>
      <TodoForm receiveTodo={ receiveTodo } />
    </div>
  );
};

export default TodoList;
