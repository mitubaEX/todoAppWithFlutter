import 'package:flutter/material.dart';
import 'package:flutter_app/models/todo.dart';
import 'package:flutter_app/ui/todo_item.dart';
import 'package:flutter_app/repository/repository_factory.dart';

class TodoList extends StatefulWidget {
  bool completeCondition;

  TodoList({
    this.completeCondition,
  });

  @override
  _TodoListState createState() => new _TodoListState(completeCondition);
}

class _TodoListState extends State<TodoList>{

  List<Todo> todoList = [];

  bool completeCondition;

  _TodoListState(
      this.completeCondition,
      );

  @override
  void initState() {
    new RepositoryFactory()
        .getTodoRepositoryImpl()
        .findAll()
        .then((List<Todo> MyTodoList){
      setState((){
        todoList = MyTodoList.where((i) => i.comp == this.completeCondition).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (todoList.length == 0) {
      return new Center(
        child: new Text('No Todo'),
      );
    }
    return new ListView.builder(
      itemBuilder: (BuildContext context, int index) => new TodoItem(
        todo: todoList[index],
        completeCondition: completeCondition,
        onTap:(){
          new RepositoryFactory()
              .getTodoRepositoryImpl()
              .findAll()
              .then((List<Todo> MyTodoList){
            setState((){
              todoList = MyTodoList.where((i) => i.comp == this.completeCondition).toList();
            });
          });
        },
      ),
      itemCount: todoList.length,
    );
  }
}
