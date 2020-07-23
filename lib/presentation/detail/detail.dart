import 'package:cards/presentation/base/page.dart';
import 'package:cards/presentation/detail/detail_contract.dart'
    as DetailContract;
import 'package:cards/presentation/detail/detail_presenter.dart';
import 'package:cards/presentation/detail/detail_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPage extends StatefulWidget {
  static var routeName = "DetailPage";

  static go(String title, String content) {
    DetailPageArguments arguments =
        DetailPageArguments(title: title, content: content);
    Get.to(DetailPage(), arguments: arguments);
  }

  @override
  State<StatefulWidget> createState() {
    return _DetailState();
  }
}

class _DetailState extends BaseState<
    DetailPage,
    DetailContract.View,
    DetailContract.Presenter,
    DetailContract.Navigator,
    DetailViewModel> implements DetailContract.View {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(viewModel.title.string)),
      ),
      body: SafeArea(
        child: Container(
          child: Obx(() => Text(viewModel.content.string)),
        ),
      ),
    );
  }

  @override
  void onPostFrame() {
    super.onPostFrame();
    DetailPageArguments map = Get.arguments as DetailPageArguments;
    viewModel.content.value = map.content;
    viewModel.title.value = map.title;
  }

  @override
  void initDependencies() {
    Get.lazyPut<DetailContract.View>(() => this);
    Get.lazyPut<DetailContract.Presenter>(() => DetailPresenter());
    Get.lazyPut<DetailViewModel>(() => DetailViewModel());
  }
}

class DetailPageArguments extends Object {
  String title;
  String content;

  DetailPageArguments({this.title, this.content});
}
