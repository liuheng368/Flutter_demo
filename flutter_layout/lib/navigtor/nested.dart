import 'package:flutter/material.dart';
 
class NavigationPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: RaisedButton(
          child: Text('login in'),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => _Navigation(),
            ));
          },
        ),
      ),
    );
  }
}

class _Navigation extends StatelessWidget {
  
  final _navKey = GlobalKey<NavigatorState>();

  Future<bool>_onWillPop() async{
    final b = await _navKey.currentState.maybePop();
    return Future.value(!b);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: _onWillPop,
        child: Navigator(
          key: _navKey, 
          initialRoute: 'user/hello',
          onGenerateRoute: (RouteSettings settings) {
            WidgetBuilder _builder;
            switch (settings.name){
              case 'user/hello':
                _builder = (context) => Hello();
                break;
              case 'user/logOut':
                _builder = (context) => LogOut();
              break;
            }
            return MaterialPageRoute(builder: _builder,settings: settings);
          },
        ),
      ),
    );
  }
}

class Hello extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hello'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text("hello world"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                child: Text('back'),
                onPressed: () => {
                  Navigator.of(context,rootNavigator: true).pop()
                },
              ),
              RaisedButton(
                child: Text('push logOut'),
                onPressed: () => {
                  Navigator.of(context).pushNamed(('user/logOut'))
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}

class LogOut extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LogOut'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text("good bye"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                child: Text('back'),
                onPressed: () => {
                  Navigator.of(context).pop()
                },
              ),
              RaisedButton(
                child: Text('log out'),
                onPressed: () => {
                  Navigator.of(context,rootNavigator: true).pop()
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}