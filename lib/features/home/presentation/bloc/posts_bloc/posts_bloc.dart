import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:socially/core/errors/failures.dart';
import 'package:socially/core/usecases/params/pagination_param.dart';
import 'package:socially/features/home/domain/entities/post.dart';
import 'package:socially/features/home/domain/usecases/fetch_posts.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc({required this.fetchPosts}) : super(const PostsInitial()) {
    on<FetchPostsEv>(_onFetchPostsEvent);
    on<FetchPostsNextPageEv>(_onPostsNextPageEvent);
  }

  final FetchPosts fetchPosts;
  bool isLoading = false;

  FutureOr<void> _onFetchPostsEvent(
      FetchPostsEv event, Emitter<PostsState> emit) async {
    isLoading = true;
    emit(PostsLoadingState(
      posts: event.posts ?? [],
      skip: 0,
      canLoadMore: true,
    ));
    final failureOrSuccess = await fetchPosts(PaginationParam(skip: 0));
    emit(failureOrSuccess.fold(
      (failure) => _mapFailureToState(failure),
      (postsList) =>
          PostsLoadedState(posts: postsList, skip: 10, canLoadMore: true),
    ));
    isLoading = false;
  }

  FutureOr<void> _onPostsNextPageEvent(
      FetchPostsNextPageEv event, Emitter<PostsState> emit) async {
    isLoading = true;
    emit(PostsLoadingState(
      posts: state.posts,
      skip: state.skip,
      canLoadMore: state.canLoadMore,
    ));
    final failureOrNotifications =
        await fetchPosts(PaginationParam(skip: state.skip));
    emit(failureOrNotifications.fold(
      (failure) => _mapFailureToState(failure),
      (posts) => PostsLoadedState(
        posts: List.of(state.posts)..addAll(posts),
        skip: state.skip + 10,
        canLoadMore: state.canLoadMore,
      ),
    ));
    isLoading = false;
  }

  PostsState _mapFailureToState(Failure failure) {
    if (failure is InternetFailure) {
      return PostsNoInternetConnectionState(
        posts: state.posts,
        skip: state.skip,
        canLoadMore: state.canLoadMore,
      );
    }
    if (failure is NoDataFoundFailure) {
      return PostsNoDataFoundState(
        posts: state.posts,
        skip: state.skip,
      );
    }
    return PostsErrorState(
      message: failure.message,
      posts: state.posts,
      skip: state.skip,
      canLoadMore: state.canLoadMore,
    );
  }
}
