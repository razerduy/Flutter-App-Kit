import 'package:cards/generated/locale_key.g.dart';
import 'package:cards/presentation/base/page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_contract.dart' as HomeContract;
import 'home_navigator.dart';
import 'home_presenter.dart';
import 'home_viewmodel.dart';

class HomePage extends StatefulWidget {
  static final routeName = 'HOME';

  const HomePage();

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends BaseState<
    HomePage,
    HomeContract.View,
    HomeContract.Presenter,
    HomeContract.Navigator,
    HomeViewModel> implements HomeContract.View {
  @override
  void initDependencies() {
    Get.lazyPut<HomeContract.View>(() => this);
    Get.lazyPut<HomeContract.Presenter>(() => HomePresenter());
    Get.lazyPut<HomeContract.Navigator>(() => HomeNavigator());
    Get.lazyPut<HomeViewModel>(() => HomeViewModel());
  }

  @override
  void onPostFrame() {
    presenter.getPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tr(LocaleKeys.appTitle)),
      ),
      body: SafeArea(
        child: Container(
          child: GetX<HomeViewModel>(
            builder: (value) =>
                value.isLoading.value ? _renderLoading() : _renderListItem(),
          ),
        ),
      ),
    );
  }

  Widget _renderLoading() {
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _renderListItem() {
    return ListView.builder(
      itemCount: viewModel.posts.value.length,
      itemBuilder: (context, index) => InkWell(
        onTap: () => this.navigator.gotoDetail(
              content: viewModel.posts.value[index].body,
              title: viewModel.posts.value[index].title,
            ),
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                viewModel.posts.value[index].title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              Text(
                viewModel.posts.value[index].body,
                style: TextStyle(fontSize: 14),
              )
            ],
          ),
        ),
      ),
    );
  }
}
