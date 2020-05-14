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

  Widget _buildItemWidget(Todo todo){   //Todo의 isDone과 title을 todo로 받는다.
    return ListTile(
      onTap: () {   //ListTile을 누를 때마다
        setState(() {   //상태가 변한다.
          todo.isDone = !todo.isDone;   //true - false 로 변환됨.
        });
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
      ),
    );
  }

  void _toggleTodo(todo) {
    setState(() {
      //상태변화
      todo.isDone = !todo.isDone;
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
                  child: TextField(),
                ),
                RaisedButton(
                  child: Text(
                    'Add',
                    style: TextStyle(color: Colors.black38),
                  ),
                  onPressed: () {},
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

