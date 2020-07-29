import 'package:cards/presentation/base/contract.dart';

abstract class HomeContractView extends BaseContractView {

}

abstract class HomeContractPresenter extends BaseContractPresenter {
  void getPost();
}

abstract class HomeContractNavigator extends BaseContractNavigator {
  void gotoDetail({ String title, String content });
}
