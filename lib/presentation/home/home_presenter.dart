import 'package:cards/domain/usecase/post_usecase.dart';
import 'package:cards/presentation/base/presenter.dart';
import 'package:cards/presentation/home/home_contract.dart' as HomeContract;
import 'package:cards/utils/error/handle_error.dart';
import 'package:get/get.dart';

import 'home_viewmodel.dart';

class HomePresenter extends BasePresenter implements HomeContract.HomeContractPresenter {
  final HomeViewModel _viewModel = Get.find();
  final PostUseCase _postUseCase = Get.find();

  @override
  void getPost() {
    _viewModel.isLoading.value = true;
    _postUseCase.getPosts().then((posts) {
      _viewModel.isLoading.value = false;
      _viewModel.posts.value = posts;
    }).catchError((error) {
      _viewModel.isLoading.value = false;
      HandleError(error, onTimeout: () {
        print('time out');
      }, onUnknown: (error) {
        print('unknown error $error');
      }).run();
    });
  }
}
