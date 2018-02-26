import 'package:flutter/material.dart';
import 'package:flutter_app/ui/todo_list.dart';
import 'package:flutter_app/ui/drawer.dart';
import 'package:flutter_app/ui/create_todo.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      title: 'ToDo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(complete: false,),
    );
  }
}

class MyHomePage extends StatefulWidget {
  bool complete;
  MyHomePage({this.complete});

  @override
  _MyHomePage createState() => new _MyHomePage(this.complete);
}

class _MyHomePage extends State<MyHomePage> {
  bool complete;

  _MyHomePage(this.complete);

  @override
  initState(){
    super.initState();
  }

  String getTitle(){
    if(this.complete)
      return 'done';
    return 'doing';
  }

  @override
  build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(getTitle()), ),
      drawer: new MyDrawer(
        complete: this.complete,
      ),
      body: new Center(
        child: new TodoList(completeCondition: this.complete,),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: (){
          Navigator.push(context, new MaterialPageRoute(
            settings: const RouteSettings(name: '/create_todo'),
            builder: (BuildContext context) => new CreateTodo(),
          ));
        },
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }
}

