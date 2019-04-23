import 'package:flutter/material.dart';
 
class Horizontal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Horizontal and Vertical Align',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Horizontal App Bar'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Image.asset('assets/images/small-pic-1.jpg'),
                  Image.asset('assets/images/small-pic-2.jpg'),
                  Image.asset('assets/images/small-pic-3.jpg'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Image.asset('assets/images/small-pic-1.jpg'),
                  Image.asset('assets/images/small-pic-2.jpg'),
                  Image.asset('assets/images/small-pic-3.jpg'),
                ],
              ),
            ],
          ),
        ),
     ),
    );
  }
}