import 'dart:async';
import 'package:flutter_app/models/todo.dart';
import 'package:flutter_app/entity/todo_entity_impl.dart';
import 'package:flutter_app/repository/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository{
  TodoEntityImpl todoEntityImpl = new TodoEntityImpl();

  Future<List<Todo>> findAll() {
    return todoEntityImpl.findAll();
  }

  Future<List<Todo>> addTodo(String todoName) {
    return todoEntityImpl.addTodo(todoName);
  }

  Future<List<Todo>> completeTodo(int id) {
    return todoEntityImpl.completeTodo(id);
  }

  Future<List<Todo>> removeTodo(int id) {
    return todoEntityImpl.removeTodo(id);
  }
}
