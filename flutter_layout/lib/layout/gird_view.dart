import 'package:flutter/material.dart';
 
void main() => runApp(GirdViewDemo());
 
class GirdViewDemo extends StatelessWidget {

  final descTextStyle = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w800,
      fontFamily: 'Roboto',
      letterSpacing: 0.5,
      fontSize: 10,
      height: 2,
    );

  Widget getGirdItemView(int index) {
    return GridTile(
        child: Image.asset(
          'middle-pic-$index',
          fit: BoxFit.cover
        ),
        footer: DefaultTextStyle(
          style: descTextStyle,
          child: GridTileBar(
            backgroundColor: Colors.black45,
            title: Text('Picture + $index'),
            subtitle: Text('Desasdad + $index'),
            trailing: Icon(Icons.star, color: Colors.white),
          ),
        )
      );
  }

  Widget getGirdView() {
    print("12312321312312312");

    print("12312321312312312");
    // final orientaion = MediaQuery.of(context).orientation;
    return GridView.builder(
            padding: EdgeInsets.all(5),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:  3,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              childAspectRatio: 1.2,
            ),
            itemBuilder: (BuildContext context, int index) => getGirdItemView(index),
            itemCount: 30,
        );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: getGirdView(),
        ),
      ),
    );
  }
}