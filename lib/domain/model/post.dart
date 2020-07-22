import 'package:cards/storage/object/post.dart' as Storage;

class Post {
  String title;
  String body;

  Post({this.title, this.body});

  static Post fromStorage(Storage.Post e) {
    return Post(title: e.tiTle, body: e.boDy);
  }
}