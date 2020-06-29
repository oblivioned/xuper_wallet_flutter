import 'package:xuper_wallet_flutter/widget/scene.dart';

import 'package:xuper_wallet_flutter/pages/wallet/create.dart';
import 'package:xuper_wallet_flutter/pages/wallet/import.dart';

class WelcomScene extends Scene {
  @override
  _WelcomSceneState createState() => _WelcomSceneState();
}

class _WelcomSceneState extends SceneState {
  bool agreeConsent = false;

  final List<Widget> _subWidgets = <Widget>[];

  _WelcomSceneState() : super('Welcome', true) {
    /// logo
    _subWidgets.add(Container(
      child: Image.asset('resources/xuper_logo.png'),
    ));

    /// title
    _subWidgets.add(Container(
      child: Text('欢迎使用超级链钱包', style: TextStyle(fontSize: 20)),
      margin: EdgeInsets.only(top: 40),
    ));

    /// create
    _subWidgets.add(Container(
      child: MaterialButton(
        color: Color(0xFF3E82FE),
        textColor: Colors.white,
        child: Text('创建钱包', style: TextStyle(fontSize: 16)),
        height: 48,
        minWidth: double.infinity,
        onPressed: () {
          // pushScene(context, CreateWalletScene());
          presentModalWidget(Container(
              width: double.infinity,
              // height: 500,
              child: Column(
                children: [
                  AppBar(title: Text('Title')),
                  MaterialButton(
                      color: Color(0xFF3E82FE),
                      textColor: Colors.white,
                      child: Text('创建钱包', style: TextStyle(fontSize: 16)),
                      minWidth: double.infinity,
                      onPressed: () {})
                ],
              )));
        },
      ),
      margin: EdgeInsets.only(top: 165, left: 20, right: 20),
    ));

    /// import
    _subWidgets.add(Container(
      child: MaterialButton(
        color: Color(0xFF1FCB9B),
        textColor: Colors.white,
        child: Text('导入钱包', style: TextStyle(fontSize: 16)),
        height: 48,
        minWidth: double.infinity,
        onPressed: () {
          pushScene(context, ImportWalletScene());
        },
      ),
      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
    ));
  }

  @override
  Widget buildBody(BuildContext context) {
    final column = Column(
      children: List.from(_subWidgets),
      mainAxisAlignment: MainAxisAlignment.center,
    );

    // checkbox row
    column.children.add(Container(
        margin: EdgeInsets.only(top: 70),
        child: GestureDetector(
            onTap: () {
              this.setState(() {
                this.agreeConsent = !this.agreeConsent;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                    value: this.agreeConsent,
                    activeColor: Colors.blue,
                    onChanged: (bool val) {
                      this.setState(() {
                        this.agreeConsent = val;
                      });
                    }),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: '我已阅读',
                      style: TextStyle(fontSize: 14, color: Colors.black)),
                  TextSpan(
                      text: '《用户协议》',
                      style: TextStyle(fontSize: 14, color: Colors.blue)),
                  TextSpan(
                      text: '并遵守相关使用协议.',
                      style: TextStyle(fontSize: 14, color: Colors.black)),
                ]))
              ],
            ))));

    return column;
  }
}
