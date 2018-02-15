import 'dart:convert';
import 'dart:async';

import 'package:flutter_app/models/todo.dart';
import 'package:flutter_app/entity/todo_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoEntityImpl implements TodoEntity {
  List<Todo> todoList = [];

  @override
  List<Todo> findAll(){
    _getTodoList().then((List<Todo> MyTodoList){
      todoList = MyTodoList;
    });
    return todoList;
  }

  @override
  List<Todo> addTodo(String todoName){
    todoList.add(new Todo(todoList.length, todoName, false));
    _addTodoList(todoList).then((List<Todo> MyTodoList){
      todoList = MyTodoList;
    });
    return todoList;
  }

  @override
  List<Todo> completeTodo(int id){
    for(var i = 0; i < todoList.length; i++){
      if(todoList[i].id == id) {
        todoList[i].comp = !todoList[i].comp;
      }
    }
    _addTodoList(todoList).then((List<Todo> MyTodoList){});
    return todoList;
  }
  
  @override
  List<Todo> removeTodo(int id) {
    for(var i = 0; i < todoList.length; i++){
      if(todoList[i].id == id)
        todoList.remove(todoList[i]);
    }
    _addTodoList(todoList).then((List<Todo> MyTodoList){
      todoList = MyTodoList;
    });
    return todoList;
  }

  Future<List<Todo>> _getTodoList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Todo> MyTodoList = JSON.decode(prefs.getString('todoList'))
        .map((i) => new Todo.fromJson(i))
        .toList();
    return MyTodoList;
  }

  Future<List<Todo>> _addTodoList(List<Todo> MyTodoList) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('todoList', JSON.encode(MyTodoList));
    List<Todo> T = JSON.decode(prefs.getString('todoList'))
        .map((i) => new Todo.fromJson(i))
        .toList();
    return T;
  }
}
