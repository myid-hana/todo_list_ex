import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class Todo{
  bool isDone = false;  //처음에는 false로 선언해준다.
  String title; //입력값을 저장할 문자열 변수

  Todo(this.title);  //입력값을 title에 저장
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List App',
      theme: ThemeData(
        primarySwatch: Colors.lime,
      ),
      home: TodoApp(),
    );
  }
}

class TodoApp extends StatefulWidget {
  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {

  final _item = <Todo>[];  //Todo 값을 받아서 비어있는 배열을 만들어준다.
  var _todoController = TextEditingController();  //입력값 받아주기.

  @override
  void dispose(){
    _todoController.dispose();
    super.dispose();
  }

  Widget _buildItemWidget(Todo todo){   //Todo의 isDone과 title을 todo로 받는다.
    return ListTile(
      onTap: () {   //ListTile을 누를 때마다
        _toggleTodo(todo);
      },
      title: Text(
        todo.title,
        style: todo.isDone ? TextStyle(    //isDone이 true이면 style적용, false이면 style : null
          decoration: TextDecoration.lineThrough,
          fontStyle: FontStyle.italic,
        ) : null,
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete_forever),
        onPressed: (){
          _deleteTodo(todo);
        },
      ),
    );
  }

  void _addItem(Todo todo){
    setState(() {
      _item.add(todo);
      _todoController.text = '';
    });
  }

  void _toggleTodo(Todo todo) {
    setState(() {
      //상태변화
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteTodo(Todo todo){
    setState(() {
      _item.remove(todo);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To Do List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _todoController,
                  ),
                ),
                RaisedButton(
                  child: Text(
                    'Add',
                    style: TextStyle(color: Colors.black38),
                  ),
                  onPressed: () {
                    _addItem(Todo(_todoController.text));
                  },
                ),
              ],
            ),
            Expanded(
              child: ListView(
                children: _item.map((todo) => _buildItemWidget(todo)).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

