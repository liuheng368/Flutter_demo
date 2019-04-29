import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List Todo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Center(
            child: ListTodo(),
          ),
        ),
      ),
    );
  }
}

class _ListTodoModel {
  final int todoIndex;
  final String todoDes;

  _ListTodoModel(@required this.todoIndex,@required this.todoDes);
}

class ListTodo extends StatelessWidget {

  final lm = List.generate(
    20, 
    (index) => _ListTodoModel(index, '我是第${index}个')
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
              child: Text('push'),
              onPressed: () async {
                final va = await Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => _PopPage()
                ));
                print('$va');
            }),));
  }
}

class _PopPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:Text('pop'),
        ),
      body: Center(
        child: Center(
          child: RaisedButton(
              child: Text('pop'),
              onPressed: () => Navigator.of(context).pop('we are coming'),
            ),  
        )
      )
    );
  }
}