import 'package:flutter/material.dart';
 
void main() => runApp(GirdViewDemo());
 
class GirdViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: GridViewClass(),
        ),
      ),
    );
  }
}

class GridViewClass extends StatelessWidget{

  final descTextStyle = TextStyle(
      color: Colors.green,
      fontWeight: FontWeight.w800,
      fontFamily: 'Roboto',
      letterSpacing: 0.5,
      fontSize: 10,
      height: 2,
    );

  Widget getGirdItemView(int index) {
    return GridTile(
        child: Image.asset(
          'assets/images/middle-pic-${index + 1}.jpg',
          fit: BoxFit.cover
        ),
        footer: DefaultTextStyle(
          style: descTextStyle,
          child: GridTileBar(
            backgroundColor: Colors.black45,
            title: Text('Picture  $index'),
            subtitle: Text('Desasdad  $index'),
            trailing: Icon(Icons.star, color: Colors.white),
          ),
        )
      );
  }

  @override
  Widget build(BuildContext context) {
    var orientaion = MediaQuery.of(context).orientation;
    return GridView.builder(
            padding: EdgeInsets.all(5),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:  orientaion == Orientation.portrait ? 2 : 3,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              childAspectRatio: orientaion == Orientation.portrait ? 1 : 1.3,
            ),
            itemBuilder: (BuildContext context, int index) => getGirdItemView(index),
            itemCount: 30,
        );
  }
}