import 'package:cards/domain/model/post.dart';
import 'package:cards/presentation/base/viewmodel.dart';
import 'package:get/get.dart';

class HomeViewModel extends BaseViewModel {
  RxList<Post> posts = RxList([]);

  HomeViewModel();

}