import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_bar_example/src/data/model/post_model.dart';
import 'package:http/http.dart' as http;

part 'post_state.dart';
part 'post_event.dart';

typedef HttpClient = http.Client;
const postLimit = 20;
const _postDuration = Duration(microseconds: 200);
// EventTransformer<T> postDroppable<T>(Duration duration) {
//   return (events, mapper) {
//     return droppable<T>().call(events.throttle(duration), mapper);
//   };
// }

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc({required HttpClient client})
      : _client = client,
        super(
          PostState(),
        ) {
    on<PostFetched>(_onPostFetched);
  }
  final http.Client _client;

  Future<void> _onPostFetched(
      PostFetched event, Emitter<PostState> emit) async {
    //* state come form PostState (18th line)
    if (state.hasReachedMax) return;
    try {
      //* if first request
      if (state.status == PostStatus.inital) {
        final posts = await _fetchPost();
        return emit(
          state.copyWith(
              status: PostStatus.succes, posts: posts, hasReachedMax: false),
        );
      }
      final newPosts = await _fetchPost(state.posts.length);
      newPosts.isEmpty
          ? emit(state.copyWith(hasReachedMax: true))
          : emit(state.copyWith(
              status: PostStatus.succes,
              //* marged the old list with the new arrivals
              posts: List.of(state.posts)..addAll(newPosts),
            ));
    } catch (_) {
      emit(state.copyWith(status: PostStatus.err));
    }
  }

  Future<List<PostModel>> _fetchPost([int startIndex = 0]) async {
    final response = await _client.get(
      Uri.https(
        'jsonplaceholder.typicode.com',
        '/posts',
        {'_start': '$startIndex', '_limit': '$postLimit'},
      ),
    );

    if (response.statusCode == 200) {
      return (json.decode(response.body) as List<dynamic>)
          .map((dynamic post) =>
              PostModel.fromJson(Map<String, dynamic>.from(post)))
          .toList();
    }
    throw Exception('fetched error (custom msg)');
  }
}
