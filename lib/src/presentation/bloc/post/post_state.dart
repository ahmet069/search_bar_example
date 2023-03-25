import '../../../data/model/post_model.dart';

abstract class PostState {}

class InitialState extends PostState {}

class UpdatePostList extends PostState {
  List<PostModel> _posts = [];
  UpdatePostList(this._posts);
}
