import 'package:cards/domain/repository/post_repository.dart';
import 'package:cards/storage/datasource/post_repo/post_local/post_local.dart';
import 'package:cards/storage/datasource/post_repo/post_remote/post_remote.dart';
import 'package:cards/storage/object/post.dart';
import 'package:get/get.dart';

class PostRepositoryImplement implements PostRepository {
  PostRemote _postRemote = Get.find();
  PostLocal _postLocal = Get.find();

  @override
  Future<List<Post>> getPosts() async {
    return _postRemote.getPostOnNetwork();
  }

}