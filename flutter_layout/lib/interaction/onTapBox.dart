import 'package:flutter/material.dart';
  
class OnTapBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('OnTapBox'),
        ),
        body: Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _boxA(),
            _boxBParents(),
            _boxCParents(),
          ],
        ),
      )
    );
  }
}

class _boxA extends StatefulWidget {

  _boxAState createState() => _boxAState();
}

class _boxAState extends State<_boxA> {
  bool _active = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _active = !_active;
          });
        },
        child: Container(
          alignment: Alignment.center,
          child: Text(
            _active?'Active':'Inactive',
            style: TextStyle(fontSize: 32, color: Colors.white)
          ),
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            color: _active ? Colors.lightGreen[700] : Colors.grey[600],
          ),
        ),
      )
    );
  }
}

class _boxBParents extends StatefulWidget {

  _boxBState createState() => _boxBState();
}

class _boxBState extends State<_boxBParents> {
  bool _active = false;
  void _onTap(dynamic value) {
    setState(()=>{  _active = value   });
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: _boxB(active: _active, onTap: _onTap),
    );
  }
}

class _boxB extends StatelessWidget {
  final bool active;
  final ValueChanged onTap;

 _boxB({Key key, this.active:false, @required this.onTap}) : super(key: key){print('dsdadadad');}

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: ()=>{onTap(!active)},
        child: Container(
          alignment: Alignment.center,
          child: Text(
            active?'Active':'Inactive',
            style: TextStyle(fontSize: 32, color: Colors.white)
          ),
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            color: active ? Colors.lightGreen[700] : Colors.grey[600],
          ),
        ),
      ),
    );
  }
}

class _boxCParents extends StatefulWidget {

  _boxCState createState() => _boxCState();
}

class _boxCState extends State<_boxCParents> {
  bool _active = false;
  void _onTap(dynamic value) {
    setState(()=>{  _active = value   });
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: _boxC(active: _active, onTap: _onTap),
    );
  }
}

class _boxC extends StatefulWidget {
  final bool active;
  final ValueChanged onTap;

  const _boxC({Key key, this.active:false, @required this.onTap}) : super(key: key);

  _boxCLess createState() => _boxCLess();
}

class _boxCLess extends State<_boxC> {
  bool _hold = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: ()=>{widget.onTap(!widget.active)},
        onTapDown: (details)=>{ setState(()=>{ _hold = true }) },
        onTapUp: (details)=>{ setState(()=>{ _hold = false }) },
        onTapCancel: ()=>{setState(()=>{ _hold = false }) },
        child: Container(
          alignment: Alignment.center,
          child: Text(
            widget.active?'Active':'Inactive',
            style: TextStyle(fontSize: 32, color: Colors.white)
          ),
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
            border: _hold ? Border.all(color: Colors.orange[100],width: 10) : null,
          ),
        ),
      ),
    );
  }
}
