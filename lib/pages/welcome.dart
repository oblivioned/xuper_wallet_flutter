import 'package:xuper_wallet_flutter/widget/stardard_scene.dart';


class WelcomeScene extends StardardScene {
  @override
  String get title => 'Welcome';

  // @override
  // Widget get body => Column(
  //     children: [SizedBox(width: 300, height:300), Image.asset('resources/xuper_logo.png')],
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     crossAxisAlignment: CrossAxisAlignment.center);

  @override
  Widget get body {
    final column = Column(
        children: [],
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center);

    column.children.add(SizedBox(width: 320));
    column.children.add(Image.asset('resources/xuper_logo.png'));

    final container = Container(child: column);

    return container;
  }
}
