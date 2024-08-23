import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socially/core/utils/assets_resources.dart';
import 'package:socially/core/widgets/main_app_bar.dart';
import 'package:socially/core/widgets/main_bottom_navigation_bar.dart';
import 'package:socially/core/widgets/my_error_widget.dart';
import 'package:socially/core/widgets/no_data_found_widget.dart';
import 'package:socially/features/home/presentation/bloc/posts_bloc/posts_bloc.dart';
import 'package:socially/features/home/presentation/widgets/post_card.dart';
import 'package:socially/features/home/presentation/widgets/stories_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _fetchPosts();
    scrollController.addListener(() {
      if (scrollController.offset >=
              scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange) {
        _fetchPostsNextPage();
      }
    });
  }

  void _fetchPosts() {
    context.read<PostsBloc>().add(const FetchPostsEv());
  }

  void _fetchPostsNextPage() {
    if (context.read<PostsBloc>().state.canLoadMore &&
        !context.read<PostsBloc>().isLoading) {
      context.read<PostsBloc>().add(const FetchPostsNextPageEv());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            StoriesSection(),
            SizedBox(height: 20.h),
            Expanded(
              child: BlocBuilder<PostsBloc, PostsState>(
                builder: (context, state) {
                  return state.posts.isNotEmpty
                      ? _buildPosts(state)
                      : Center(child: _mapStateToWidget(state));
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const MainBottomNavigationBar(),
    );
  }

  Widget _buildPosts(PostsState state) {
    return RefreshIndicator(
      onRefresh: () async =>
          context.read<PostsBloc>().add(const FetchPostsEv()),
      child: ListView.separated(
        shrinkWrap: true,
        controller: scrollController,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              PostCard(
                profileImage: AssetsResources.profile3Image,
                profileName: 'André Alexander',
                postText: state.posts[index].body,
                tags: state.posts[index].tags,
                postDate: DateTime(2024, 8, 21, 8),
                likes: state.posts[index].likes,
                comments: 23,
              ),
              if (state is PostsLoadingState && index == state.posts.length - 1)
                Center(
                  child: Transform.scale(
                    scale: 0.7,
                    child: const CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                  ),
                ),
            ],
          );
        },
        separatorBuilder: (context, index) => SizedBox(height: 15.h),
        itemCount: state.posts.length,
      ),
    );
  }

  Widget _mapStateToWidget(PostsState state) {
    if (state is PostsLoadingState) {
      return const Center(child: CircularProgressIndicator(color: Colors.blue));
    } else if (state is PostsNoDataFoundState) {
      return const NoDataFoundWidget();
    } else if (state is PostsNoInternetConnectionState) {
      return _buildOfflinePostsList();
    } else if (state is PostsErrorState) {
      return MyErrorWidget(message: state.message, onRetry: _fetchPosts);
    }
    return const SizedBox.shrink();
  }

  Widget _buildOfflinePostsList() {
    return RefreshIndicator(
      onRefresh: () async =>
          context.read<PostsBloc>().add(const FetchPostsEv()),
      child: ListView(
        children: [
          PostCard(
            profileImage: AssetsResources.profile1Image,
            profileName: 'Kylie Jenner',
            postText:
                '''Stopped by @zoesugg today with goosey girl to see @kyliecosmetics & @kylieskin 💕 wow what a dream!!!!!!!! It’s the best experience we have!''',
            postDate: DateTime(2024, 8, 23, 4),
            likes: 1320,
            comments: 23,
          ),
          SizedBox(height: 15.h),
          PostCard(
            profileImage: AssetsResources.profile2Image,
            profileName: 'Alex Strohi',
            postImages: const [
              AssetsResources.postImage,
              AssetsResources.postImage,
              AssetsResources.postImage,
              AssetsResources.postImage,
            ],
            tags: const ['Alberta', 'Cold', 'Mediation', 'Alberta', 'Cold'],
            postDate: DateTime(2024, 8, 22, 4),
            likes: 1320,
            comments: 23,
          ),
          SizedBox(height: 15.h),
          PostCard(
            profileImage: AssetsResources.profile3Image,
            profileName: 'André Alexander',
            postImages: const [
              AssetsResources.nature1Image,
              AssetsResources.nature2Image,
              AssetsResources.nature3Image,
            ],
            postDate: DateTime(2024, 8, 13, 4),
            likes: 1320,
            comments: 23,
          ),
        ],
      ),
    );
  }
}
