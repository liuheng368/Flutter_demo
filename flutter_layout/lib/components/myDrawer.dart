import 'package:flutter/material.dart';
import '../pages.dart';

class myDrawer extends StatefulWidget {

  _myDrawerState createState() => _myDrawerState();
}

class _myDrawerState extends State<myDrawer> {
static final _dataSource = [
    {
      'title': 'Interaction',
      'isUnfold': false,
      'items': [
        {
          'title': 'On Tap Box',
          'isSelected': false,
          'pageBuilder': (BuildContext context) => OnTapBox(),
        },
        {
          'title': 'Refresh Indicator',
          'isSelected': false,
          'pageBuilder': (BuildContext context) => RefreshList(),
        }
      ],
    },
    {
      'title': 'Layout',
      'isUnfold': false,
      'items': [
        {
          'title': 'Gird View',
          'isSelected': false,
          'pageBuilder': (BuildContext context) => GridViewClass(),
        },
        {
          'title': 'HoriVert Align',
          'isSelected': false,
          'pageBuilder': (BuildContext context) => Horizontal(),
        },
        {
          'title': 'HoriVert Sizing Page',
          'isSelected': false,
          'pageBuilder': (BuildContext context) => HoriVertSizingPage(),
        },
        {
          'title': 'Ipad Size',
          'isSelected': false,
          'pageBuilder': (BuildContext context) => IpadSize(),
        },
        {
          'title': 'List View Demo',
          'isSelected': false,
          'pageBuilder': (BuildContext context) => ListViewDemo(),
        }
      ],
    },
    {
      'title': 'Navigtor',
      'isUnfold': false,
      'items': [
        {
          'title': 'HomePage',
          'isSelected': false,
          'pageBuilder': (BuildContext context) => HomePage(),
        },
        {
          'title': 'Navigation Page',
          'isSelected': false,
          'pageBuilder': (BuildContext context) => NavigationPage(),
        },
        {
          'title': 'List Return',
          'isSelected': false,
          'pageBuilder': (BuildContext context) => ListReturn(),
        },
        {
          'title': 'List Todo',
          'isSelected': false,
          'pageBuilder': (BuildContext context) => ListTodo(),
        },
      ],
    },
  ];

  void _restData() {
    _dataSource.forEach((item) {
      item['isUnfold'] = false;
      (item['items'] as List).forEach((model) {
        model['isSelected'] = false;
      });
    });
  }

  void _cellHeaderUnfold(index, isUnfold) {
    _restData();
    _dataSource[index]['isUnfold'] = !isUnfold;

    setState(() {});
  }

  void _onSelected(model, item){
    _restData();

    model['isUnfold'] = true;
    item['isSelected'] = true;

    Navigator.of(context)
    ..pop()
    ..push(MaterialPageRoute(
      builder: item['pageBuilder'],
    ));
  }

  Widget getHeader(BuildContext context) {
    return 
    DrawerHeader(
      decoration: BoxDecoration(
        color: Colors.tealAccent,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("Heny Flutter Demo"),
            MaterialButton(
              color: Colors.blueAccent,
              child: Text('logout'),
              onPressed: ()=>{
                Navigator.pop(context)
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget getTitle() {
    return
    Container(
      padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
      height: 44,
      child: Text('Home' ,
        textAlign: TextAlign.left, 
        style: TextStyle(color: Colors.black87, fontSize: 18)
      ),
    );
  }
/*
            */


  @override
  Widget build(BuildContext context) {
    return Container(
       child: Drawer(
         elevation: 20,
         child: ListView(
          //  padding: EdgeInsets.zero,
           children: <Widget>[
            getHeader(context),
            getTitle(),
            ExpansionPanelList(
              animationDuration: Duration(milliseconds: 500),
              expansionCallback: _cellHeaderUnfold,
              children: _dataSource.asMap().map<int, ExpansionPanel>(
                (index, model) => MapEntry(
                  index,
                  ExpansionPanel(
                    isExpanded: model['isUnfold'],
                    headerBuilder: (context, isUnfold) => ListTile(
                      onTap: ()=>_cellHeaderUnfold(index, isUnfold),
                      title: Text(
                        model['title'],
                        style: TextStyle(fontSize: 16),
                      ),
                      selected: model['isUnfold'],
                      dense: true,
                    ),
                    //是一个整体，此处返回列表无效
                    body: Container(
                      child: Column(
                        children: 
                        (model['items'] as List<Map<String, Object>>)
                        .map<Widget>((item)=>ListTile(
                        onTap: () => _onSelected(model, item),
                        title: Text(
                          item['title'],
                          style: TextStyle(fontSize: 14)),
                        selected: item['isSelected'],
                        dense: true,
                        enabled: item['pageBuilder'] != null,
                      )).toList(),
                      ),
                    ),
                  ),
                ),
              ).values.toList(),
            ),
           ],
         ),
       ),
    );
  }
}