part of 'posts_bloc.dart';

sealed class PostsState extends Equatable {
  final List<Post> posts;
  final int skip;
  final bool canLoadMore;

  const PostsState({
    required this.posts,
    required this.skip,
    required this.canLoadMore,
  });

  @override
  List<Object> get props => [posts, skip, canLoadMore];
}

final class PostsInitial extends PostsState {
  const PostsInitial({
    super.posts = const [],
    super.skip = 0,
    super.canLoadMore = true,
  });
}

final class PostsLoadingState extends PostsState {
  const PostsLoadingState({
    required super.posts,
    required super.skip,
    required super.canLoadMore,
  });
}

final class PostsLoadedState extends PostsState {
  const PostsLoadedState({
    required super.posts,
    required super.skip,
    required super.canLoadMore,
  });
}

final class PostsNoInternetConnectionState extends PostsState {
  const PostsNoInternetConnectionState({
    required super.posts,
    required super.skip,
    required super.canLoadMore,
  });
}

final class PostsNoDataFoundState extends PostsState {
  const PostsNoDataFoundState({
    required super.posts,
    required super.skip,
    super.canLoadMore = false,
  });
}

final class PostsErrorState extends PostsState {
  final String message;

  const PostsErrorState({
    required super.posts,
    required this.message,
    required super.skip,
    required super.canLoadMore,
  });

  @override
  List<Object> get props => [message, posts, skip, canLoadMore];
}
