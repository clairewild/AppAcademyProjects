import { RECEIVE_TODOS, RECEIVE_TODO, REMOVE_TODO } from '../actions/todo_actions.js';
import merge from 'lodash/merge';

const initialState = {
  1: {
    id: 1,
    title: "wash car",
    body: "with soap",
    done: false
  },
  2: {
    id: 2,
    title: "wash dog",
    body: "with shampoo",
    done: true
  },
};

const todosReducer = (state = initialState, action) => {
  Object.freeze(state);
  switch(action.type) {
    case RECEIVE_TODOS:
      let newState = {};
      action.todos.forEach((el, idx) => {
        newState[idx] = el;
      });
      return newState;
    case RECEIVE_TODO:
      let stateCopy = merge({}, state);
      stateCopy[action.todo.id] = action.todo;
      return stateCopy;
    case REMOVE_TODO:
      let removeCopy = merge({}, state);
      delete removeCopy[action.todo.id];
      return removeCopy;
    default:
      return state;
  }
};

export default todosReducer;
