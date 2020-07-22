import 'package:cards/storage/object/post.dart' as Storage;

abstract class PostRepository {
  Future<List<Storage.Post>> getPosts();
}