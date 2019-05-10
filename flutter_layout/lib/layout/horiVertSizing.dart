import 'package:flutter/material.dart';
 
 class HoriVertSizingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('HoriVertSizingPage'),
        ),
        body: Center(
          child: (
            Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Image.asset('assets/images/small-pic-1.jpg',fit: BoxFit.cover),
                ),
                Expanded(
                  flex: 2,
                  child: Image.asset('assets/images/small-pic-2.jpg',fit: BoxFit.cover),
                ),
                Expanded(
                  flex: 1,
                  child: Image.asset('assets/images/small-pic-3.jpg',fit: BoxFit.cover),
                ),
              ],
            )
          ),
        ),
    );
  }
}