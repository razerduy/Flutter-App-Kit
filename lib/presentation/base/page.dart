import 'package:cards/presentation/base/viewmodel.dart';
import 'package:cards/utils/progress_dialog_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

import 'contract.dart';

abstract class BaseState<
    Page extends StatefulWidget,
    View extends BaseContractView,
    Presenter extends BaseContractPresenter,
    Navigator extends BaseContractNavigator,
    ViewModel extends BaseViewModel> extends State<Page> {
  Presenter get presenter => Get.find<Presenter>();

  ViewModel get viewModel => Get.find<ViewModel>();

  Navigator get navigator => Get.find<Navigator>();

  View get view => Get.find<View>();

  ProgressDialogLoading progressDialogLoading;

  @override
  void initState() {
    super.initState();
    initDependencies();
    SchedulerBinding.instance.addPostFrameCallback((Duration duration) {
      onPostFrame();
    });
  }

  void initDependencies();

  void onPostFrame() {}

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (progressDialogLoading == null) {
      progressDialogLoading = ProgressDialogLoading(context: context);
    }
  }
}
