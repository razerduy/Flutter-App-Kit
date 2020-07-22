
import 'package:cards/domain/base/usecase.dart';
import 'package:cards/domain/model/post.dart';
import 'package:cards/domain/repository/post_repository.dart';
import 'package:cards/storage/repository/post_repo_imp.dart';
import 'package:cards/storage/object/post.dart' as Storage;
import 'package:get/get.dart';

class PostUseCase extends BaseUseCase {
  PostRepository _postRepository = Get.find<PostRepositoryImplement>();

  Future<List<Post>> getPosts() async {
    List<Storage.Post> posts = await _postRepository.getPosts();
    return posts.map((e) => Post.fromStorage(e)).toList();
  }
}