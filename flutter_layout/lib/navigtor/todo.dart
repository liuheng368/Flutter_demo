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
      body: ListView.builder(
        itemCount: lm.length,
        itemBuilder: (context, index) => ListTile(
          title: Text('Todo ${lm[index].todoIndex}'),
          subtitle: Text('${lm[index].todoDes}'),
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (content) => _ListTodoDetail(model: lm[index]),
          )),
        ),
      ),
    );
  }
}

class _ListTodoDetail extends StatelessWidget {
  final _ListTodoModel model;

  const _ListTodoDetail({Key key,@required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:Text('${this.model.todoIndex}'),
        ),
      body: Center(
        child: Text(this.model.todoDes),
      )
    );
  }
}