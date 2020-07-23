import 'package:get/get.dart';

abstract class BaseViewModel extends GetxController {
  RxBool isLoading = RxBool(false);
}