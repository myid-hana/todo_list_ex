import 'package:flutter/material.dart';

void main() => runApp(MyApp());

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
  void _toggleTodo(todo) {
    setState(() {
      //상태변화
      todo.isDone = !todo.isDone;
    });
  }

  bool isDone = false;  //처음에는 false로 선언해준다.

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
                children: <Widget>[
                  ListTile(
                    onTap: () {   //ListTile을 누를 때마다
                      setState(() {   //상태가 변한다.
                        isDone = !isDone;   //true - false
                      });
                    },
                    title: Text(
                      "to do 1",
                      style: isDone ? TextStyle(    //isDone이 true이면 style적용, false이면 style : null
                        decoration: TextDecoration.lineThrough,
                        fontStyle: FontStyle.italic,
                      ) : null,
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete_forever),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

