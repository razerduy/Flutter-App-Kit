import 'package:cards/domain/repository/post_repository.dart';
import 'package:cards/domain/usecase/post_usecase.dart';
import 'package:cards/storage/repository/post_repo_imp.dart';
import 'package:get/get.dart';

class DomainModule {
  static init() {
    Get.lazyPut<PostUseCase>(() => PostUseCase());
  }

  static deInit() {
    Get.delete<PostUseCase>();
  }
}