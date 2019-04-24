import 'package:flutter/material.dart';
import 'dart:math';
 
void main() => runApp(ListViewDemo());
 
class ListViewDemo extends StatelessWidget {

  List<Widget> getListItem() {
    List<ListViewModel> listM = List();
    Random rd = Random();
    for (var i = 0; i<100 ; i++) {
      listM.add(ListViewModel(Color.fromRGBO(rd.nextInt(255), rd.nextInt(255), rd.nextInt(255), 1), i.toString()));
    }
    return listM.map((item) => ListViewItem(item)).toList();
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
          child: ListView(
            children: getListItem(),
          ),
        ),
      ),
    );
  }
}

class ListViewItem extends StatelessWidget {

  final ListViewModel model;

  ListViewItem(this.model);
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: model.color,
          child: Text(
            model.title,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      onTap: (){
        print(model.title);
      },
    );
  }
}


class ListViewModel {
  final color, title;

  ListViewModel(this.color,this.title);
}