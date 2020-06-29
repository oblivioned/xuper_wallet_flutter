import 'package:flutter/material.dart';

export 'package:flutter/material.dart';

abstract class Scene extends StatefulWidget {

}

abstract class SceneState extends State<Scene> with SingleTickerProviderStateMixin {
  String _title;
  bool _appBarHidden = false;

  // 弹出组建
  Widget _presentWidget;
  AnimationController _presentController;
  Animation _presentAnimtionCurve;

  String get title => _title;
  set title(String v) => setState(() {
        _title = v;
      });

  bool get appBarHidden => _appBarHidden;
  set appBarHidden(bool v) => setState(() {
        _appBarHidden = v;
      });

  SceneState(this._title, this._appBarHidden) {
    _presentController = AnimationController(
        duration: const Duration(milliseconds: 250), vsync: this);
    _presentAnimtionCurve =
        CurvedAnimation(parent: _presentController, curve: Curves.easeInOut);
  }

  Widget buildBody(BuildContext context);

  Future pushScene(BuildContext context, Widget scene) =>
      Navigator.push(context, MaterialPageRoute(builder: (context) => scene));

  void presentModalWidget(Widget widget, {bool tapMaskDissmiss = true}) {
    // 背景遮罩动画
    final fadeMaskLayer = GestureDetector(
        onTap: tapMaskDissmiss ? dissmissModalWidget : null,
        child: FadeTransition(
            opacity: Tween<double>(begin: 0.0, end: 0.5)
                .animate(_presentAnimtionCurve),
            child: Container(
              color: Colors.black,
            )));

    // 弹出的组建动画
    final slidePresentLayer = Container(
        child: SlideTransition(
      position: Tween<Offset>(begin: Offset(0, 1), end: Offset.zero)
          .animate(_presentAnimtionCurve),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [widget],
      ),
    ));

    _presentWidget = Stack(children: [fadeMaskLayer, slidePresentLayer]);

    setState(() {
      _presentController.forward();
    });
  }

  void dissmissModalWidget() {
    setState(() {
      _presentController.reverse().whenCompleteOrCancel(() {
        setState(() {
          _presentWidget = null;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final appBar = _appBarHidden
        ? null
        : AppBar(
            iconTheme: IconThemeData(color: Color(0xFF080808)),
            backgroundColor: Colors.white,
            title: Text(title, style: TextStyle(fontSize:21, color: Color(0xFF080808))),
          );

    final stack = Stack(children: [
      Scaffold(
          appBar: appBar,
          body: Container(child: buildBody(context)),
          backgroundColor: Color(0xFFF8F8F8))
    ]);

    // 处理弹出层
    if (_presentWidget != null) {
      stack.children.add(_presentWidget);
    }

    return stack;
  }
}
