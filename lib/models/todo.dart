
class Todo {
  int id;
  String todoName;
  bool comp;
  Todo(this.id, this.todoName, this.comp);

  // map to Todo
  Todo.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        todoName = json['todoName'],
        comp = json['comp'];

  // map to json
  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'todoName': todoName,
        'comp': comp,
      };
}