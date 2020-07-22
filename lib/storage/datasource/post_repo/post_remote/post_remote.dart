import 'package:cards/storage/object/post.dart';

abstract class PostRemote {
  Future<List<Post>> getPostOnNetwork();
}