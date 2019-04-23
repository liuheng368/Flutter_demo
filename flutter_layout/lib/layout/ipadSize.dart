import 'package:flutter/material.dart';
 
void main() => runApp(IpadSize());
 
class IpadSize extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final descTextStyle = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w800,
      fontFamily: 'Roboto',
      letterSpacing: 0.5,
      fontSize: 18,
      height: 2,
    );

    final stars = Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(Icons.star, color: Colors.black),
          Icon(Icons.star, color: Colors.black),
          Icon(Icons.star, color: Colors.black),
          Icon(Icons.star, color: Colors.black),
          Icon(Icons.star, color: Colors.black),
        ],
      ),
    );

    final score = Container(
      child: Text(
        '170 Reviews',
        style: descTextStyle
      ),
    );

    Container tipss(int no) {
      var icon, text, time;
      
      if (no == 0) {
        icon = Icon(Icons.kitchen, color: Colors.green[500]);
        text = Text('PREP:');
        time = Text('25 Min');
      }else if (no ==1) {
        icon = Icon(Icons.timer, color: Colors.green[500]); 
        text = Text('COOK');
        time = Text('1 hr');
      }else{
        icon = Icon(Icons.restaurant, color: Colors.green[500]);
        text = Text('FEEDS:');
        time = Text('4 - 6');
      }
      return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            icon,
            text,
            time,
          ],
        ),
      );
    }

    final textTitle = Container(
      // padding: EdgeInsets.all(20),
      child: Center(
        child: Text(
          'Strawberry Pavlova',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            letterSpacing: 0.5,
            fontSize: 30,
          ),
        )
      ),
    );

    final textDes = Container(
      padding: EdgeInsets.all(10),
      child: Center(
        child: Text(
          ''' Pavlova is a meringue-based dessertnamed after the Russian ballerinaAnna Pavlova. Pavlova features acrisp crust and soft, light inside,topped with fruit and whipped cream. ''',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'Georgia',
          fontSize: 25,
        ),
        )
      ),
    );  

    final goal = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          stars,
          score,
        ],
      ),
    );

    final tips = Container(
      child: DefaultTextStyle.merge(
        style: descTextStyle,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            tipss(0),
            tipss(1),
            tipss(2),
          ],
        ),
      ),
    );

    final leftMain = Container(
      width: 440,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          textTitle,
          textDes,
          goal,
          tips,
        ],
      ),
    );

    final imageView = Image.asset('assets/images/pavlova.jpg', fit: BoxFit.cover);


    return MaterialApp(
      title: 'IpadSize App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('IpadSize App Bar'),
        ),
        body: Center(
          child: Container(
            margin: EdgeInsets.all(5),
            height: 600,
            child: Card(
              child: Row(
                children: <Widget>[
                  leftMain,
                  imageView,
                ],
              ),
            ),
          ),
        )
      ),
    );
  }
}