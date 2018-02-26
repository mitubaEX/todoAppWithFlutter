import 'dart:async';
import 'package:flutter_app/models/todo.dart';

abstract class TodoRepository {
  Future<List<Todo>> findAll();

  Future<List<Todo>> addTodo(String todoName);

  Future<List<Todo>> completeTodo(int id);

  Future<List<Todo>> removeTodo(int id);
}