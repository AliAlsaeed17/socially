part of 'posts_bloc.dart';

sealed class PostsEvent extends Equatable {
  const PostsEvent();

  @override
  List<Object> get props => [];
}

class FetchPostsEv extends PostsEvent {
  final List<Post>? posts;

  const FetchPostsEv({this.posts});
}

class FetchPostsNextPageEv extends PostsEvent {
  const FetchPostsNextPageEv();
}
