import 'package:xuper_wallet_flutter/widget/scene.dart';

class ImportWalletScene extends Scene {
  @override
  _ImportWalletSceneState createState() => _ImportWalletSceneState();
}

class _ImportWalletSceneState extends SceneState {
  bool agreeConsent = false;

  _ImportWalletSceneState() : super('Import', false);

  @override
  Widget buildBody(BuildContext context) {
    final header = Row(children: [
      Expanded(child: Text('A', textAlign:TextAlign.center)),
      Expanded(child: Text('A', textAlign:TextAlign.center)),
      Expanded(child: Text('A', textAlign:TextAlign.center)),
    ]);

    return header;
  }
}
