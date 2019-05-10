import 'package:flutter/material.dart';
 
class Horizontal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Horizontal"),
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
    );
  }
}