import 'package:xuper_wallet_flutter/widget/scene.dart';

class CreateWalletScene extends Scene {
  @override
  _CreateWalletSceneState createState() => _CreateWalletSceneState();
}

class _CreateWalletSceneState extends SceneState {
    bool agreeConsent = false;

    _CreateWalletSceneState() : super('Create', false);

    @override
    Widget buildBody(BuildContext context) {
      return Text('Create');
    }

}
