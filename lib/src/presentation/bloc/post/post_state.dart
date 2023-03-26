part of 'post_bloc.dart';

enum PostStatus { inital, succes, err } // * api response states

class PostState extends Equatable {
  final List<PostModel> posts;
  final bool hasReachedMax;
  final PostStatus status;

  //! I gave default parametres
  PostState({
    this.posts = const <PostModel>[], //^ emty list default
    this.hasReachedMax = false,
    this.status = PostStatus.inital, //^ default initial state false
  });

  //* copies previus data
  PostState copyWith({
    List<PostModel>? posts,
    bool? hasReachedMax,
    PostStatus? status,
  }) {
    return PostState(
      posts: posts ?? this.posts,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      status: status ?? this.status,
    );
  }

  @override
  //* for compare (ewquatable)
  List<Object?> get props => [posts, hasReachedMax, status];
}
