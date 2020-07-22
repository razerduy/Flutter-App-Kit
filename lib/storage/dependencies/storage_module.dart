import 'package:cards/storage/datasource/post_repo/post_local/post_local.dart';
import 'package:cards/storage/datasource/post_repo/post_local/post_local_imp.dart';
import 'package:cards/storage/datasource/post_repo/post_remote/post_remote.dart';
import 'package:cards/storage/datasource/post_repo/post_remote/post_remote_imp.dart';
import 'package:cards/storage/repository/post_repo_imp.dart';
import 'package:cards/utils/storage.dart';
import 'package:cards/utils/webservice.dart';
import 'package:get/get.dart';

class StorageModule {
  static void init() {
    Get.lazyPut<WebService>(() => WebService());
    Get.lazyPut<Storage>(() => Storage());
    Get.lazyPut<PostLocal>(() => PostLocalImplement());
    Get.lazyPut<PostRemote>(() => PostRemoteImplement());
    Get.lazyPut<PostRepositoryImplement>(() => PostRepositoryImplement());
  }

  static void deInit() {
    Get.delete<WebService>();
    Get.delete<PostLocal>();
    Get.delete<PostRemote>();
    Get.delete<PostRepositoryImplement>();
  }
}