import 'package:flutter/material.dart';
import 'package:flutter_layout/layout/hori_vert_align.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: HomePage() 
    );
  }
}

class HomePage extends StatelessWidget {  
    @override
    Widget build(BuildContext context) {
      return Container(
        child: RaisedButton(
          child: Text('push'),
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (content) {
                return Horizontal();
              },
          )),
        ),
      );
    }
  }