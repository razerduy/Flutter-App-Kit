import 'package:cards/storage/datasource/post_repo/post_local/post_local.dart';
import 'package:cards/utils/storage.dart';
import 'package:get/get.dart';

class PostLocalImplement implements PostLocal {
  Storage _storage = Get.find();
}