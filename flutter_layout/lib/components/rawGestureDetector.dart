import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

typedef rawGestureCallBack = void Function(double yOff,String str);

//自定义手势控件RawGestureDetector
class _RawGestureDetector extends StatefulWidget {
  final Widget child;
  final rawGestureCallBack cb;

  _RawGestureDetector({Key key, this.child, this.cb}) : super(key: key);

  _RawGestureDetectorState createState() => _RawGestureDetectorState();
}

class _RawGestureDetectorState extends State<_RawGestureDetector> {
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
                ..onStart = (DragStartDetails details) {
                  widget.cb(0, '开始');
                }
                ..onUpdate = (DragUpdateDetails details) {
                    _offDistance = _offDistance + details.delta.dy;
                    widget.cb(_offDistance,'正在移动');
                    setState(() {});
                }
                ..onEnd = (DragEndDetails details){
                  widget.cb(_offDistance, '结束，离开屏幕时速度=${details.primaryVelocity}');
                };
              }
           ),
        },
       child: widget.child,
     )
    );
  }
}

class RawGestureDetectorDemo extends StatefulWidget {
  _RawGestureDetectorDemoState createState() => _RawGestureDetectorDemoState();
}

class _RawGestureDetectorDemoState extends State<RawGestureDetectorDemo> {

  double yOff = 0.0;  
  String sTips = '';  

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
          _RawGestureDetector(
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(color: Colors.lightBlue),
            ),
            cb: (double _yOff, String str) {
              this.yOff = _yOff;
              this.sTips = str;
              setState(() {});
            },
          ),
          Text('垂直移动距离${this.yOff}'),
          Text(this.sTips),
        ],
      ),
      )
    );
  }
}