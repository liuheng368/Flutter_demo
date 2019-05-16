import 'package:flutter/material.dart';

class RefreshList extends StatefulWidget {
  @override
  _RefreshIndState createState() => _RefreshIndState();
}

class _RefreshIndState extends State<RefreshList> {

  List<String> items = List();
  final _scrollV = ScrollController();

  VoidCallback block() {
    return () {
      if (_scrollV.offset == _scrollV.position.maxScrollExtent && _scrollV.position.maxScrollExtent != 0.0) {
        loadMore();
      }
    };
  }

  @override void initState() {
    super.initState();
    _scrollV.addListener(block());
  }

  @override void dispose() {
    super.dispose();
    _scrollV.removeListener(block());
  }

  Future<void> dataInit() async{
    for(var i=0; i<15; i++){
      items.add('Item$i');
    }
    await Future.delayed((Duration(seconds: 2)), ()=>setState(()=>{ items }));
  }

  void loadMore() {
    final count = items.length;
    for(var i=count; i<count + 10; i++){
       items.add('Item$i');
    }
    setState(()=>{ items });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RefreshList'),
      ),
      body:Stack(
        alignment: Alignment.center,
        children: <Widget>[
          RefreshIndicator(
            onRefresh: dataInit,
            child: ListView.builder(
              controller: _scrollV,
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: items.length,
              itemBuilder: (content,i){
                return ListTile(
                  title: Text(items[i]),
                );
              },
            ),
          ),
          // CircularProgressIndicator(
          //   value: 0.75,
          //   backgroundColor: Colors.black,
          //   valueColor: AlwaysStoppedAnimation(Colors.red),
          // )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _scrollV.animateTo(
              0,
              curve: Curves.easeOut,
              duration: const Duration(milliseconds: 300),
            ),
        child: Icon(Icons.arrow_upward, color: Colors.white),
      ),
    );
  }
}