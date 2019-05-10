import 'package:flutter/material.dart';
import 'package:flutter_layout/pages.dart';

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