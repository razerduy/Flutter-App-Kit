import 'dart:async';

import 'package:get/get.dart';

class BaseUseCase<T> extends GetxController {
  Rx<T> data = Rx<T>();

  @override
  void onInit() {
    super.onInit();
  }

  StreamSubscription listenDataChange(Function(T) onDataChange) {
    return data.stream.listen((event) {
      onDataChange(event);
    });
  }

  @override
  void onClose() {
    super.onClose();
    data.close();
  }

}
