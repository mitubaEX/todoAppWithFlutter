import 'dart:convert';
import 'dart:async';

import 'package:flutter_app/models/todo.dart';
import 'package:flutter_app/entity/todo_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoEntityImpl implements TodoEntity {
//  List<Todo> todoList = [];

  @override
  Future<List<Todo>> findAll(){
    return _getTodoList();
  }

  @override
  Future<List<Todo>> addTodo(String todoName){
    return _addTodoList(todoName);
  }

  @override
  Future<List<Todo>> completeTodo(int id){
    return _completeTodoList(id);
  }
  
  @override
  Future<List<Todo>> removeTodo(int id) {
    return _removeTodoList(id);
  }

  Future<List<Todo>> _getTodoList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Todo> MyTodoList = JSON.decode(prefs.getString('todoList'))
        .map((i) => new Todo.fromJson(i))
        .toList();
    return MyTodoList;
  }

  Future<List<Todo>> _addTodoList(String todoName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Todo> MyTodoList = JSON.decode(prefs.getString('todoList'))
        .map((i) => new Todo.fromJson(i))
        .toList();

    // add
    MyTodoList.add(new Todo(MyTodoList.length, todoName, false));
    await prefs.setString('todoList', JSON.encode(MyTodoList));
    return MyTodoList;
  }

  Future<List<Todo>> _completeTodoList(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Todo> MyTodoList = JSON.decode(prefs.getString('todoList'))
        .map((i) => new Todo.fromJson(i))
        .toList();
    for(var i = 0; i < MyTodoList.length; i++){
      if(MyTodoList[i].id == id) {
        MyTodoList[i].comp = !MyTodoList[i].comp;
      }
    }

    // set
    await prefs.setString('todoList', JSON.encode(MyTodoList));
    return MyTodoList;
  }

  Future<List<Todo>> _removeTodoList(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Todo> MyTodoList = JSON.decode(prefs.getString('todoList'))
        .map((i) => new Todo.fromJson(i))
        .toList();
    for(var i = 0; i < MyTodoList.length; i++){
      if(MyTodoList[i].id == id)
        MyTodoList.remove(MyTodoList[i]);
    }

    // set
    await prefs.setString('todoList', JSON.encode(MyTodoList));
    return MyTodoList;

  }
}
