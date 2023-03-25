import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_bar_example/src/presentation/bloc/post/post_event.dart';
import 'package:search_bar_example/src/presentation/bloc/post/post_state.dart';
import '../../../data/model/post_model.dart';

final dio = Dio();

class PostBloc extends Bloc<PostState, PostEvent> {
  List<PostModel> _posts = [];

  PostBloc(super.initialState);

  void onGetAllPost(GetAllPost event, Emitter<PostState> emit) async {
    try {
      final response =
          await Dio().get('https://jsonplaceholder.typicode.com/posts');
      final postsJson =
          response.data as List<dynamic>; //? list<dynamic> important
      _posts = postsJson.map((json) => PostModel.fromJson(json)).toList();
    } catch (error) {
      print(error);
    }
  }
}
