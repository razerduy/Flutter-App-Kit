import 'package:cards/presentation/base/contract.dart';

abstract class View extends BaseContractView {

}

abstract class Presenter extends BaseContractPresenter {
  void getPost();
}

abstract class Navigator extends BaseContractNavigator {
  void gotoDetail({ String title, String content });
}