import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

typedef CustomDrawerCallBack = void Function(bool isOpen);

class CustomDrawer extends StatefulWidget {
  final double elevation;
  final Widget child;
  final String semanticLabel;
  final double widthPercent;  //占屏幕宽度的比例，0-1
  final CustomDrawerCallBack callback;  //打开关闭的回调 : open - true ,close - false

  const CustomDrawer({
    Key key,
    this.elevation = 16.0,
    this.child,
    this.semanticLabel,
    this.widthPercent,
    this.callback,
  }) : assert(elevation >= 0.0 && widthPercent != null && widthPercent > 0.0 && widthPercent < 1.0),
       super(key: key);

  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {

  @override
  void initState() {
    super.initState();
    if (widget.callback != null) {
      widget.callback(true);
    }
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.callback != null) {
      widget.callback(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));
    String label = widget.semanticLabel;
    switch (defaultTargetPlatform) {
      case TargetPlatform.iOS:
        label = widget.semanticLabel;
        break;
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        label = widget.semanticLabel ?? MaterialLocalizations.of(context)?.drawerLabel;
    }
    final double _width = MediaQuery.of(context).size.width * widget.widthPercent;
    return Semantics(
      scopesRoute: true,
      namesRoute: true,
      explicitChildNodes: true,
      label: label,
      child: ConstrainedBox(
        constraints: BoxConstraints.expand(width: _width),
        child: Material(
          elevation: _width,
          child: widget.child,
        ),
      ),
    );
  }
}