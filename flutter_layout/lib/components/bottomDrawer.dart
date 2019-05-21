import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

typedef bottomDrawerCallBack = void Function(double yOff);

//下拉抽屉
class BottomDrawer extends StatefulWidget {
  final Widget child;
  final bottomDrawerCallBack cb;

  BottomDrawer({Key key, this.child, this.cb}) : super(key: key);

  _BottomDrawerState createState() => _BottomDrawerState();
}

class _BottomDrawerState extends State<BottomDrawer> {
  double _offDistance = 100.0;

  @override
  Widget build(BuildContext context) {
    //无法热更新
    //Transform.translate() 使用系统已封装好的，使组件在X、Y轴移动的方法。
    //Transform.scale() 比例变换
    //Transform.rotate() 角度变换
    return  Transform.translate(
      offset: Offset(0.0, this._offDistance),
      child: RawGestureDetector(
        gestures: <Type, GestureRecognizerFactory>{
           VerticalDragGestureRecognizer: GestureRecognizerFactoryWithHandlers<VerticalDragGestureRecognizer>(
              ()=>VerticalDragGestureRecognizer(),
              (VerticalDragGestureRecognizer _initial) {
                _initial
                  ..onUpdate = (DragUpdateDetails details) {
                    _offDistance = _offDistance + details.delta.dy;
                    widget.cb(_offDistance);
                    setState(() {});
                  };
              }
           ),
        },
       child: widget.child,
     )
    );
  }
}

class BottomDrawerDemo extends StatefulWidget {
  _BottomDrawerDemoState createState() => _BottomDrawerDemoState();
}

class _BottomDrawerDemoState extends State<BottomDrawerDemo> {

  double yOff = 0.0;  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RawGestureDetector Demo'),
      ),
      body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          BottomDrawer(
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(color: Colors.lightBlue),
            ),
            cb: (double _yOff) {
              this.yOff = _yOff;
              setState(() {});
            },
          ),
          Text('垂直移动距离${this.yOff}'),
        ],
      ),
      )
    );
  }
}

    //   CurvedAnimation(
    //     parent: AnimationController(vsync: this, duration: const Duration(milliseconds: 250));,
    //     curve: Interval(
    //       0.5,
    //       0.75,
    //       curve: Curves.linear,
    //     ),
    //   ),
    // )
    //     AnimatedModalBarrier(
    //     color: animated
    //     dismissible: true, // changedInternalState is called if this updates
    //     semanticsLabel: 'barrierLabel', // changedInternalState is called if this updates
    //     barrierSemanticsDismissible: true,