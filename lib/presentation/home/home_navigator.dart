import 'package:cards/presentation/base/navigator.dart';
import 'package:cards/presentation/detail/detail.dart';
import 'package:cards/presentation/home/home_contract.dart';

class HomeNavigator extends BaseNavigator implements Navigator {
  @override
  void gotoDetail({String title, String content}) {
    DetailPage.go(title, content);
  }
}
